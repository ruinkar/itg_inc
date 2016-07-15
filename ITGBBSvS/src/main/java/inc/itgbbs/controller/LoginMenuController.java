package inc.itgbbs.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import inc.itgbbs.dao.LoginDao;
import inc.itgbbs.domain.LoginInfoDTO;


@Controller
public class LoginMenuController {
	
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private LoginDao loginDao;//메서드호출

	
	@RequestMapping("/review/login/makeSession.do")
	public String process(@RequestParam("id") String id,
			@RequestParam("password") String password,
			HttpSession session
			) {
		
		LoginInfoDTO login = new LoginInfoDTO();
		login.setId(id);
		login.setPassword(password);
		System.out.println(login);
		int result = loginDao.findUser(login); 
		
		if (result != 0 )
		{
			session.setAttribute("userLoginInfo", login);
		}
		return "redirect:/review/list.do";
	}
	
	@RequestMapping("/review/login/deleteSession.do")
	public String process( HttpSession session) {
		
		session.invalidate();
		return "redirect:/review/list.do";
	}
	
}
