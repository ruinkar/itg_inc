/**
 * rank 화면 출력용
 * 
 * stage_top 상단 랭크용 작업 객체
 * rank_list 하단 랭크용 작업 객체
 * pages 페이징 작업 객체
 */

var itg = {
	back_width: 600,
	back_height: 150,
	list_item_height: 50,
	pages_height: 0,
	rtype: "mpoint",
	stage_top: {}, // 상위 랭크
	rank_list: {}, // 나머지 랭크 페이지
	pages: {}
};

itg.getSizeBG = function() {
	var h = $(window).height();
	
	var	htemp = h / 4;
	this.back_height = htemp > this.back_height ? htemp : this.back_height;
	
	// var wtemp = this.back_height * 4;
	var wtemp = h;
	this.back_width = wtemp > this.back_width ? wtemp : this.back_width;
	
	var litemp = h / 11;
	this.list_item_height = litemp > this.list_item_height ? litemp : this.list_item_height;
	
	this.pages_height = h - (10 * this.list_item_height);
}

// 초기화
itg.init = function(rtype) {
	
	this.getSizeBG();
	
	this.rtype = rtype;
	
	$("#left").css({
		height: $(window).height()
	});
	$("#right").css({
		height: $(window).height()
	});
	
	this.stage_top.init();
	this.rank_list.init();
	this.pages.init();
}

itg.print = function(json_high, json_others) {
	itg.stage_top.print(json_high);
	itg.rank_list.print(json_others);
}


// stage_top

// 상위 랭크 표시화면 초기 설정
itg.stage_top.init = function() {
	this.$stage = $(".stage_top");
	// console.log(this);
	// 상위 랭크 표시화면 사이즈 지정
	itg.stage_top.$stage.css({
		width: itg.back_width,
		height: itg.back_height
	});
	
	// 상위 랭크 개별 항목 동적 삽입
	this.$stage.each(function(index){
		var $this = $(this);
		
		for(var i = 0; i <= index; i++) {
			var box = document.createElement("div");
			var $box = $(box);
			
			$box.addClass("box_top cdiv");
			$box.css({
				width: itg.back_height,
				height: $this.height()
			});
			
			$this.append(box);
		}
	});
}; // stage_top.init()

// 상위 랭크 json to view
itg.stage_top.print = function(json_high) {
	// 상위 랭크 리스트 표시
	
	var $box = $(".box_top");
	
	$(json_high).each(function(index){
		$box.eq(index).css({
			background: itgUtil.thumbCheck(this.thumbnail)
		});
		
		var meminfo = [this.nick, itg.rtype == "rating" ? this.avgrat : this.mpoint ];
		var classname = ["text-nick", "text-point"];
		
		for(var i = 0; i < 2; i++) {
			var span = document.createElement("span");
			var $span = $(span);
			$span.text(meminfo[i]);
			$span.addClass(classname[i]);
			$box.eq(index).append(span);
		}
	});
	
	$box.on("click", function(){
		location.href="http://www.naver.com";
	});
}; // itg.stage_top.print()


//rank_list

// 나머지 랭크 표시화면 초기설정
itg.rank_list.init = function() {
	this.$rank_list = $("#rank_list");
	// 기타 랭크 표시화면 사이즈 지정
	this.$rank_list.css({
		width: itg.back_width
	});
}; // itg.rank_list.init()

// 나머지 랭크 json to view
itg.rank_list.print = function(json_others) {
	// 나머지 랭크 리스트 표시
	this.$rank_list.html("");
	
	var cname = ["outer", "inner", "centered", "cdiv"];
	var div = [];
	var $div = [];
	$(json_others).each(function(){
		var li = document.createElement("li");
		var $li = $(li);
		
		for(var i = 0; i < cname.length; i++) {
			div[i] = document.createElement("div");
			$div[i] = $(div);
			$div[i].addClass(cname[i]);
			if(i > 0){
				$div[i - 1].append(div[i]);
			}
		}
		
		var span = document.createElement("span");
		var $span = $(span);
		$span.text(this.nick + " " + this.mpoint);
		
		$div[3].css({
			width: itg.list_item_height,
			height: itg.list_item_height,
			background: itgUtil.thumbCheck(this.thumbnail)
		});
		
		$li.css({
			height: itg.list_item_height
		});
		$li.addClass("item_rank_list");
		$li.children().css({
			display:"inline-block"
		});
		div[2].append(span);
		$li.append(div[0]);
		
		itg.rank_list.$rank_list.append(li);
	});
} // itg.rank_list.print()

itg.pages.init = function() {
	this.$pages = $("#pages");
	this.$pages.css({
		width: itg.back_width,
		height: itg.pages_height
	});
	
	$("#pages").on("click", "a", this.flip);
} // itg.pages.init()

itg.pages.flip = function() {
	var pageNum = itgUtil.paramFromGet(this.href, "pageNum");
	var type = itgUtil.paramFromGet(this.href, "type");
	
	$.getJSON({
		method: "post",
		url: "rank_others.do",
		data: {
			pageNum: pageNum,
			type: type
			},
		success: function(data) {
			// alert(data);
			console.log(data.json_others);
			itg.rank_list.print(data.json_others);
			$("#pages").html(data.pagingHtml);
			document.body.scrollTop = document.body.scrollHeight;
		},
		error: function() {
			alert("error");
		}
	});
	
	return false;
}

var itgUtil = {
		
};

itgUtil.paramFromGet = function(href, param) {
	var p = href.indexOf(param);
	var value = href.substr(p);
	p = value.indexOf("&");
	value = p !== -1 ? value.substring(0, p) : value;
	p = value.indexOf("=");
	value = value.substr(p + 1);
	console.log(value);
	
	return value;
}

itgUtil.thumbCheck = function(thumb) {
	var result = "url('/img/noimage.jpg')";
	var suffix = " no-repeat center";
	
	if (thumb.indexOf(".jpg") !== -1) {
		result = "url('" + thumb + "')";
	}
	
	return result + suffix;
}