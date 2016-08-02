package inc.itgbbs.controller;

import java.io.File;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.IVoteDao;
import inc.itgbbs.dao.ReviewDao;
import inc.itgbbs.domain.BoardDTO;
import inc.itgbbs.domain.ReviewAllDTO;
import inc.itgbbs.util.FileUtil;


@Controller
public class ReviewContentController {
	
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private ReviewDao reviewDao;//메서드호출
	
	@Autowired
	IVoteDao voteDao;
	
	@RequestMapping("/review/content.do")
	public ModelAndView process(@RequestParam("anum") int anum,
			@RequestParam(value="pageNum", defaultValue="1") int pageNum
			) {
		if(log.isDebugEnabled()) {
			log.debug("anum = " + anum);
		}
		System.out.println("anum="+anum);
		reviewDao.updateReadCount(anum); //조회수 증가
		
		//레코드를 한개 얻어오는 메서드호출
		ReviewAllDTO article = reviewDao.selectReview(anum);
		ReviewAllDTO rating = null;
		if ( article.getEvnum() != 0 )
		{
			rating = reviewDao.selectRating(anum);
			article.setEvtitle(rating.getEvtitle());
		}
		else article.setEvtitle("삭제된 이벤트 입니다");
			
		int replyNum = 0;
		List<BoardDTO> repliesList = null;
		replyNum = reviewDao.getReplyCount(anum);
		System.out.println("replyNum="+replyNum);
		if (replyNum > 0) {
			repliesList = reviewDao.getReplies(anum);
		}
		
		
		
		//selectDetail.jsp에 전달(1.이동할 페이지, 2.key값 3.value값)
		ModelAndView mav = new ModelAndView("reviewContent");
		// 답변에 대한 메서드 정리		
		mav.addObject("article", article);
		mav.addObject("pageNum", pageNum);
		mav.addObject("replyNum", replyNum); 
		mav.addObject("repliesList", repliesList); 
		mav.addObject("voteNum" , voteDao.voteCount(anum));
		return mav;
	}
	//파일 다운로드에 해당하는 요청이 들어왔을 때 처리해주는 메서드
	@RequestMapping("/review/file.do")
	public ModelAndView download(@RequestParam("filename") String fileName) throws Exception {
		File downloadFile = new File(FileUtil.UPLOAD_PATH + "/" + fileName.substring(4));
		return new ModelAndView("downloadView", "downloadFile", downloadFile);
		
	}
	
}
