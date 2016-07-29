package inc.itgbbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.FreeBoardDao;
import inc.itgbbs.domain.FreeBoardDTO;




@Controller
public class FreeDetailController {
	
	private Logger log = Logger.getLogger(this.getClass());
	private FreeBoardDao freeBoardDao;

	
	@Autowired
	public void setBoardDao(FreeBoardDao freeBoardDao) {
		this.freeBoardDao = freeBoardDao;
		System.out.println("DetailController의 setBoardDao()호출");
	}

	@RequestMapping("/free/content.do")
	public ModelAndView process(@RequestParam("anum") int anum) {
		if(log.isDebugEnabled()) {
			log.debug("anum = " + anum);
		}
		
		freeBoardDao.update(anum); //조회수 증가
		
		//레코드를 한개 얻어오는 메서드호출
		FreeBoardDTO freeBoardDTO = freeBoardDao.selectBoard(anum);
		System.out.println("가져온 article 값 = " + freeBoardDTO.getAnum());
		//selectDetail.jsp에 전달(1.이동할 페이지, 2.key값 3.value값)
		List<FreeBoardDTO> repliesList = null;
		int replyNum = freeBoardDao.getReplyCount(anum); //댓글 갯수 파악
		if(replyNum > 0) {
			repliesList = freeBoardDao.repliesList(anum);
		}
		System.out.println("replyNum = "+replyNum+", repliesList = " +repliesList);
		
		ModelAndView mav = new ModelAndView("boardView", "article", freeBoardDTO);
		mav.addObject("replyNum", replyNum);
		mav.addObject("repliesList", repliesList);
		
		return mav;
		
	}
	
	
	// 추천 동작
	// 현재 아이디의 현재 글 추천 기록 검색 후
	// 존재하지 않으면 새 추천 정보 등록
	// 최종적으로 총 추천 수 반환
	@RequestMapping("/free/vote.do")
	@ResponseBody
	public String vote(
			@RequestParam("anum") int anum,
			HttpServletRequest request
			){
		
		String id = request.getSession().getAttribute("id").toString();
		
		
		int votecount = 0;
		votecount = freeBoardDao.getVoteCount(anum);
		
		return String.valueOf(votecount);
	}
/*	//파일 다운로드에 해당하는 요청이 들어왔을 때 처리해주는 메서드
	@RequestMapping("/board/file.do")
	public ModelAndView download(@RequestParam("filename") String fileName) throws Exception {
		File downloadFile = new File(FileUtil.UPLOAD_PATH + "/" + fileName);
		return new ModelAndView("downloadView", "downloadFile", downloadFile);
		
	}*/
}
