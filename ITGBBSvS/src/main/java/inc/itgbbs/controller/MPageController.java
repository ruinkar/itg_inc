package inc.itgbbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.IMPageDao;
import inc.itgbbs.domain.PageCommand;
import inc.itgbbs.util.PagingUtil;

@Controller
public class MPageController {
	
	final int top = 10; // 상위 랭킹 수
	int blockCount = 10; // 페이지 당 항목 수
	int blockPage = 10; // 블록 당 페이지 수
	String pageUrl = "/memberInfo.do"; // 페이징 처리용 명령어
	
	@Autowired
	IMPageDao mPageDao;

	@RequestMapping("/memberInfo.do")
	public ModelAndView member_log(
			@RequestParam(value="pageNum", defaultValue="1") int pageNum,
			@RequestParam("id") String id
			){
		
		int count = mPageDao.count(id);
		PagingUtil pagingUtil = new PagingUtil(pageNum, count, blockCount, blockPage, pageUrl);
		PageCommand pageCommand = new PageCommand();
		
		pageCommand.setStart(pagingUtil.getStartCount());
		pageCommand.setEnd(pagingUtil.getEndCount());
		pageCommand.setId(id);
		
		return new ModelAndView("mpage")
				.addObject("list", mPageDao.list(pageCommand))
				.addObject("pagingHTML", pagingUtil.getPagingHtml());
	}
	
}
