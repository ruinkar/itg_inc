package inc.itgbbs.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.ReviewDao;
import inc.itgbbs.domain.BoardDTO;
import inc.itgbbs.util.FileUtil;

@Controller
public class ReviewDeleteController {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private ReviewDao reviewDao; // Setter Method를 호출하는지 확인

	
	@RequestMapping(value = "/review/deleteForm.do", method = RequestMethod.GET)
	public ModelAndView process
    (@RequestParam(value="pageNum",defaultValue="1") 
        int pageNum,
     @RequestParam(value="anum",defaultValue="") //검색분야
        String anum
      ){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewDeleteForm");
		mav.addObject("pageNum" , pageNum);
		mav.addObject("anum" , anum);
		return mav;
	}
    
	

	// 2.Post방식->수정
	@RequestMapping(value = "/review/deleteForm.do", method = RequestMethod.POST)
	public String submit(@RequestParam(value="pageNum",defaultValue="1") 
    int pageNum,
 @RequestParam(value="anum",defaultValue="") //검색분야
    int anum) {
		// 파일명 알아오기
		BoardDTO board = reviewDao.getBoard(anum);
		// 파일 삭제
		System.out.println("board afile=" +board.getAfile());
		if(board.getAfile() != null) {
			FileUtil.removeFile(board.getAfile().substring(5));
		}
		// 딸린덧글 삭제
		reviewDao.deletereply(anum);
		// 게시글 삭제
		reviewDao.deleteBoard(anum);
		// 리뷰글 삭제
		//reviewDao.deleteReview(anum);
		return "redirect:/review/list.do";// redirect:/요청명령어
	}// 메서드
}
