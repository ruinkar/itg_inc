package inc.itgbbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.IMPageDao;
import inc.itgbbs.domain.BoardCommand;
import inc.itgbbs.domain.PageCommand;
import inc.itgbbs.util.PagingUtil;

@Controller
public class MPageController {
	
	final int top = 10; // 상위 랭킹 수
	int blockCount = 10; // 페이지 당 항목 수
	int blockPage = 10; // 블록 당 페이지 수
	String pageUrl = "/memberInfo.do"; // 페이징 처리용 명령어
	String addKey  = "&id=";
	
	@Autowired
	IMPageDao mPageDao;

	@RequestMapping("/memberInfo.do")
	public ModelAndView member_log(
			@RequestParam(value="pageNum", defaultValue="1") int pageNum,
			@RequestParam("id") String id
			){
		
		System.out.println(id);
		int count = mPageDao.count(id);
		System.out.println(1);
		PagingUtil pagingUtil = new PagingUtil(pageNum, count, blockCount, blockPage, pageUrl, addKey + id);
		PageCommand pageCommand = new PageCommand();
		
		pageCommand.setStart(pagingUtil.getStartCount());
		pageCommand.setEnd(pagingUtil.getEndCount());
		pageCommand.setId(id);
		
		List<BoardCommand> list = mPageDao.list(pageCommand);
		
		System.out.println(2);
		
		return new ModelAndView("mpage")
				.addObject("mem", mPageDao.meminfo(id))
				.addObject("json_list", list2Json(list))
				.addObject("pagingHTML", pagingUtil.getPagingHtml());
	}
	
	public String list2Json(List<BoardCommand> list) {
		int size = list.isEmpty() ? 0 : list.size();

		StringBuffer json = new StringBuffer("[");
		for (int i = 0; i < size; i++) {
			String data = list.get(i).toString();
			System.out.println(data);
			json.append(data + (i < size - 1 ? "," : "") );
		}
		json.append(']');

		// System.out.println(json);
		System.out.println(json.toString());
		return json.toString();
	}
	
}
