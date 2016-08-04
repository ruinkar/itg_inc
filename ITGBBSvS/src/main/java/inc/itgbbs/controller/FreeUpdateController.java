package inc.itgbbs.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.FreeBoardDao;
import inc.itgbbs.domain.FreeBoardDTO;

@Controller
public class FreeUpdateController {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private FreeBoardDao freeBoardDao; // Setter Method를 호출하는지 확인

	@RequestMapping(value = "/free/updateForm.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam("anum") int anum) {

		FreeBoardDTO freeBoardDTO = freeBoardDao.selectBoard(anum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardModify");
		mav.addObject("article", freeBoardDTO);

		return new ModelAndView("tiles/free/update", "article", freeBoardDTO);// 이동할
																		// 페이지명
	}

	// 2.Post방식->수정
	@RequestMapping(value = "/free/updatePro.do", method = RequestMethod.POST)
	public String submit(@RequestParam("title") String title, @RequestParam("acontent") String acontent,
			@RequestParam("writer") String writer, @RequestParam("anum") int anum) {

		System.out.println("title = " + title);
		System.out.println("acontent = " + acontent);
		System.out.println("writer = " + writer);
		System.out.println("anum = " + anum);
		FreeBoardDTO freeBoardDTO = new FreeBoardDTO();
		freeBoardDTO.setTitle(title);
		freeBoardDTO.setAcontent(acontent);
		freeBoardDTO.setWriter(writer);
		freeBoardDTO.setAnum(anum);

		freeBoardDao.updateBoard(freeBoardDTO);// 실제 DB상에 변경
		return "redirect:/free/list.do";// redirect:/요청명령어
	}// 메서드
}
