package inc.itgbbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.IMPageDao;
import inc.itgbbs.domain.BoardCommand;
import inc.itgbbs.domain.PageCommand;
import inc.itgbbs.domain.RankCommand;
import inc.itgbbs.util.ContentPath;
import inc.itgbbs.util.PagingUtil;

@Controller
public class MPageController implements ContentPath{
	
	final int top = 10; // 상위 랭킹 수
	int blockCount = 10; // 페이지 당 항목 수
	int blockPage = 10; // 블록 당 페이지 수
	String pageUrl = "memberInfo.do"; // 페이징 처리용 명령어
	String addKey  = "&id=";
	
	@Autowired
	IMPageDao mPageDao;

	
	// 멤버 페이지로 연결시 처리 항목
	@RequestMapping("/memberInfo.do")
	public ModelAndView member_log(
			@RequestParam(value="pageNum", defaultValue="1") int pageNum,
			@RequestParam("id") String id
			){
		
		// 페이지 계산
		System.out.println(id);
		int count = mPageDao.count(id);
		PagingUtil pagingUtil = new PagingUtil(pageNum, count, blockCount, blockPage, pageUrl, addKey + id);
		PageCommand pageCommand = new PageCommand();
		
		System.out.println(1);
		// mapper 인자 객체 세팅
		pageCommand.setStart(pagingUtil.getStartCount());
		pageCommand.setEnd(pagingUtil.getEndCount());
		pageCommand.setId(id);
		
		RankCommand mem = mPageDao.meminfo(id);
		List<BoardCommand> list = mPageDao.list(pageCommand);
				
		return new ModelAndView("mpage")
				.addObject("mem", mem)
				.addObject("json_page", list2Json(list))
				.addObject("pagingHtml", pagingUtil.getPagingHtml());
	}
	
	@RequestMapping("/mpage_ajax.do" )
	@ResponseBody
	public String rankAjax(
			@RequestParam(value="pageNum", defaultValue="1")int pageNum, 
			@RequestParam("id")String id ){
		
		int count = mPageDao.count(id);
		PagingUtil pagingUtil = new PagingUtil(pageNum, count, blockCount, blockPage, pageUrl, addKey + id);
		PageCommand pageCommand = new PageCommand();
		
		pageCommand.setStart(pagingUtil.getStartCount());
		pageCommand.setEnd(pagingUtil.getEndCount());
		pageCommand.setId(id);
		
		List<BoardCommand> list = mPageDao.list(pageCommand);
		
		StringBuffer json = new StringBuffer("{");
		json.append("\"json_page\":"+ list2Json(list) );
		json.append(",");
		json.append("\"pagingHtml\":\""+ pagingUtil.getPagingHtml() + "\"" );
		json.append("}");
		
		return json.toString();
	}
	
	@RequestMapping("/mpage/reply.do")
	public String reply(
			@RequestParam("anum") int anum
			) {
		
		String[] contentPath = {FREE, EVINFO, REVIEW };
		BoardCommand bc = mPageDao.reply(anum);
		int anum2 = bc.getAnum();
		int cat = bc.getCategory();
		
		return "redirect:" + contentPath[cat] + "/content.do?anum=" + anum2;
	}
	
	
	
	// list를 json 배열으로
	public String list2Json(List<BoardCommand> list) {
		int size = list.isEmpty() ? 0 : list.size();

		StringBuffer json = new StringBuffer("[");
		for (int i = 0; i < size; i++) {
			String data = list.get(i).toString();
			json.append(data + (i < size - 1 ? "," : "") );
		}
		json.append(']');

		System.out.println(json);
		return json.toString();
	}
	
}
