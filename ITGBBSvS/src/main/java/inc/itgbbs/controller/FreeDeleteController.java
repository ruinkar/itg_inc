package inc.itgbbs.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import inc.itgbbs.dao.FreeBoardDao;

@Controller
public class FreeDeleteController {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private FreeBoardDao freeBoardDao; // Setter Method를 호출하는지 확인

	@RequestMapping(value = "/free/deletePro.do", method = RequestMethod.GET)
	public String form(@RequestParam("anum") int anum) {

		freeBoardDao.deleteBoard(anum);
		return "redirect:/free/list.do";// redirect:/요청명령어
	}

	
	
}
