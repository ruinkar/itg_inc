package inc.itgbbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.IRankDao;
import inc.itgbbs.domain.RankCommand;
import inc.itgbbs.util.PagingUtil;

@Controller
public class RankController {
	
	final int top = 10; // 상위 랭킹 수
	int blockCount = 10; // 페이지 당 항목 수
	int blockPage = 10; // 블록 당 페이지 수
	String pageUrl = "rank_ajax.do"; // 페이징 처리용 명령어
	
	@Autowired
	IRankDao rankDao;
	
	
	@RequestMapping("/rank.do")
	public ModelAndView rankTop(
			@RequestParam(value="rtype", defaultValue="0")int rtype,
			@RequestParam(value="pageNum", defaultValue="1")int pageNum ){
		
		int count = rankDao.getMemberCount(rtype);
		PagingUtil pagingUtil = new PagingUtil(pageNum, count, blockCount, blockPage, pageUrl);
		
		List<RankCommand> listTop = rankDao.getListTop(rtype, top);
		List<RankCommand> listPage = rankDao.getListPage(rtype, pagingUtil);
		String json_top = list2Json(listTop);
		String json_page = list2Json(listPage);
		
		return new ModelAndView("rankList")
				/*.addObject("listTop", listTop)
				.addObject("listPage", listPage)*/
				.addObject("json_top", json_top)
				.addObject("json_page", json_page)
				.addObject("pagingHtml", pagingUtil.getPagingHtml() )
				.addObject("rtype", rtype);
	}
	
	@RequestMapping("/rank_ajax.do")
	@ResponseBody
	public String rankAjax(
			@RequestParam(value="rtype", defaultValue="0")int rtype,
			@RequestParam(value="pageNum", defaultValue="1")int pageNum ){
		
		int count = rankDao.getMemberCount(rtype);
		PagingUtil pagingUtil = new PagingUtil(pageNum, count, blockCount, blockPage, pageUrl);
		
		List<RankCommand> listTop = rankDao.getListTop(rtype, top);
		List<RankCommand> listPage = rankDao.getListPage(rtype, pagingUtil);
		
		StringBuffer json = new StringBuffer("{");
		json.append("\"json_top\":"+ list2Json(listTop) );
		json.append(",");
		json.append("\"json_page\":"+ list2Json(listPage) );
		json.append(",");
		json.append("\"pagingHtml\":\""+ pagingUtil.getPagingHtml() + "\"" );
		json.append(",");
		json.append("\"rtype\":"+ rtype);
		json.append("}");
		
		return json.toString();
	}
	
	// setJsonData로 만든 List를 Json 배열형태로 최종 포장
	public String list2Json(List<RankCommand> list) {
		int size = list.isEmpty() ? 0 : list.size();

		StringBuffer json = new StringBuffer("[");
		for (int i = 0; i < size; i++) {
			String data = list.get(i).toString();
			json.append(data + (i < size - 1 ? "," : "") );
		}
		json.append("]");

		// System.out.println(json);
		return json.toString();
	}
	
}
