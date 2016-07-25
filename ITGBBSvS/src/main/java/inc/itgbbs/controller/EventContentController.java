package inc.itgbbs.controller;

import java.io.File;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.EventDao;
import inc.itgbbs.domain.BoardDTO;
import inc.itgbbs.domain.EventDTO;
import inc.itgbbs.util.ContentPath;
import inc.itgbbs.util.FileUtil;


@Controller
public class EventContentController implements ContentPath{
	
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private EventDao eventDao;//메서드호출

	
	@RequestMapping(EVINFO + "/content.do")
	public ModelAndView process(@RequestParam("anum") int anum,
			@RequestParam(value="pageNum", defaultValue="1") int pageNum
			) {
		if(log.isDebugEnabled()) {
			log.debug("anum = " + anum);
		}
		System.out.println("anum="+anum);
		eventDao.updateReadCount(anum); //조회수 증가
		
		//레코드를 한개 얻어오는 메서드호출
		BoardDTO board  = eventDao.selectboard(anum);
		EventDTO event = eventDao.selectevent(anum);
		
		
		if(log.isDebugEnabled()) {
			log.debug("event = " + event);
			log.debug("board = " + board);
		}
		
		int replyNum = 0;
		List<BoardDTO> repliesList = null;
		replyNum = eventDao.getReplyCount(anum);
		System.out.println("replyNum="+replyNum);
		if (replyNum > 0) {
			repliesList = eventDao.getReplies(anum);
		}
		
		
		
		//selectDetail.jsp에 전달(1.이동할 페이지, 2.key값 3.value값)
		ModelAndView mav = new ModelAndView("eventContentForm");
		// 답변에 대한 메서드 정리		
		mav.addObject("barticle", board);
		mav.addObject("earticle", event);
		mav.addObject("pageNum", pageNum);
		mav.addObject("replyNum", replyNum); 
		mav.addObject("repliesList", repliesList); 
		return mav;
	}
	//파일 다운로드에 해당하는 요청이 들어왔을 때 처리해주는 메서드
	@RequestMapping(EVINFO + "/file.do")
	public ModelAndView download(@RequestParam("filename") String fileName) throws Exception {
		File downloadFile = new File(FileUtil.UPLOAD_PATH + "/" + fileName.substring(4));
		return new ModelAndView("downloadView", "downloadFile", downloadFile);
		
	}
	
}
