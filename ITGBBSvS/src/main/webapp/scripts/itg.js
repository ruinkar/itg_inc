/**
 * rank 화면 출력용
 * 
 * stage_top 상단 랭크용 작업 객체
 * rank_list 하단 랭크용 작업 객체
 * pages 페이징 작업 객체
 * mpage 회원 활동정보 페이지
 */

var itg = {
	uri: "rank_ajax.do",
	ajaxData: {}, 
	back_width: 600,
	back_height: 150,
	list_item_height: 50,
	pages_height: 0,
	rtype: 0,
	stage_top: {}, // 상위 랭크
	rank_list: {}, // 나머지 랭크 페이지
	pages: {},
	mpage: {}
};


// rank..
// 사이즈 초기화
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
itg.initRank = function(rtype) {
	
	this.getSizeBG();
	
	this.rtype = rtype;
	itg.ajaxData.rtype = rtype;
	
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
		
		var mid = this.mid
		
		$box.eq(index).on("click", function() {
			
			location.href = "memberInfo.do?id=" + mid;
		});
		
		console.log(+itg.rtype === 0);
		var meminfo = [this.nick, (+itg.rtype === 0? this.mpoint : Math.floor(this.avgrat * 10)/10 ) ];
		var classname = ["text-nick", "text-point"];
		
		for(var i = 0; i < 2; i++) {
			var span = document.createElement("span");
			var $span = $(span);
			$span.text(meminfo[i]);
			$span.addClass(classname[i]);
			$box.eq(index).append(span);
		}
		
	});
}; // itg.stage_top.print()


//rank_list

// 나머지 랭크 표시화면 초기설정
itg.rank_list.init = function() {
	this.$rank_list = $("#list-group");
	// 기타 랭크 표시화면 사이즈 지정
	this.$rank_list.css({
		width: itg.back_width
	});
}; // itg.rank_list.init()

// 나머지 랭크 json to view
itg.rank_list.print = function(json_page) {
	// 나머지 랭크 리스트 표시
	this.$rank_list.html("");
	var cname = ["outer", "inner", "centered", "inner cdiv"];
	
	$(json_page).each(function(){
		
		var li = document.createElement("li");
		var $li = $(li);
		
		var div = [];
		var $div = [];
		for(var i = 0; i < cname.length; i++) {
			div[i] = document.createElement("div");
			$div[i] = $(div[i]);
			$div[i].addClass(cname[i]);
			if(i > 0){
				$div[i - 1].append(div[i]);
			}
			if(i == 3){
				$div[i].prependTo(div[0]);
			}
		}
		
		var span = document.createElement("span");
		var $span = $(span);
		$span.addClass("centered");
		$span.text(this.nick + " " + (+itg.rtype === 0 ? this.mpoint : Math.floor(this.avgrat * 10)/10 ) );
		
		$div[3].css({
			width: itg.list_item_height,
			height: itg.list_item_height,
			background: itgUtil.thumbCheck(this.thumbnail)
		});
		
		$li.css({
			height: itg.list_item_height
		});
		$li.addClass("list-item");
		$li.children().css({
			display:"inline-block"
		});
		$div[1].append(span);
		
		var mid = this.mid;
		
		$div[1].on("click", function(){
			location.href = "memberInfo.do?id=" + mid;
		});
		
		$li.append(div[0]);
		itg.rank_list.$rank_list.append(li);
	});
} // itg.rank_list.print()

itg.pages.init = function() {
	this.$pagebox = $("#pagebox");
	this.$pagebox.css({
		width: itg.back_width,
		height: itg.pages_height
	});
	
	this.$pages = $("#pages");
	
	this.$pages.on("click", "a", this.flip);
} // itg.pages.init()

itg.pages.flip = function() {
	var href = this.href;
	
	itg.ajaxData.pageNum = itgUtil.paramFromGet(href, "pageNum");
	
	$.getJSON({
		method : "post",
		url : itg.uri,
		data : itg.ajaxData
	}).done(function(data) {
		// console.log(data);
		if(itg.uri === "rank_ajax.do"){
			itg.rank_list.print(data.json_page);
		} else {
			itg.mpage.print(data.json_page);
		}
		
		$("#pages").html(data.pagingHtml);
		document.body.scrollTop = document.body.scrollHeight;
	}).fail(function(request, status, error) {
		console.log(error);
		console.log(request.responseText);
	});

	return false;
}


//mpage..

itg.mpage.init = function (id) {
	
	itg.uri = "mpage_ajax.do";
	itg.ajaxData.id = id;
	itg.getSizeBG();
	itg.pages.init();
}

itg.mpage.print = function (json) {
	$("#list").html("");
	
	var pageType = ["Board.do","EvInfo.do","Review.do","Reply.do"];
	var param1 = "?anum=";
	
	var eh = "에 ";
	var boardType = ["게시물을", "행사 정보를", "행사 후기를", "댓글을"];
	var suffix = "작성하였습니다."
	
	$(json).each(function(){
		var cat = this.category;
		
		var li = document.createElement("li");
		var a = document.createElement("a");
		var div = document.createElement("div");
		
		var $li = $(li);
		var $a = $(a);
		var $div = $(div);
		
		$div.text(this.adate + eh + boardType[cat] + suffix);
		
		$a.attr("href", pageType[cat] + param1 + this.anum);
		$a.text(this.title);
		
		$li.css({
			height: itg.list_item_height
		});
		$li.append(div);
		$li.append(a);
		$("#list").append(li);
	});
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