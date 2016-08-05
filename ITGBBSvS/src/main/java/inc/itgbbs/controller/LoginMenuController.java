package inc.itgbbs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	
	@RequestMapping("login/makeSession.do")
	public String process(@RequestParam("id") String id,
			@RequestParam("password") String password,
			HttpSession session,
			HttpServletRequest request
			) {
		
		LoginInfoDTO login = new LoginInfoDTO();
		login.setId(id);
		login.setPassword(password);
		System.out.println(login);
		int result = loginDao.findUser(login); 
		System.out.println();
		if (result != 0 )
		{
			session.setAttribute("userLoginInfo", login);
			session.setAttribute("id", login.getId());
		}
		String ref2 = request.getHeader("REFERER");
		ref2 = ref2.substring(8);
		ref2 = ref2.substring((ref2.indexOf('/', ref2.indexOf('/')+1)+1));
		return "redirect:/"+ref2;
	}
	
	@RequestMapping("login/deleteSession.do")
	public String process( HttpSession session, HttpServletRequest request) {
		
		session.invalidate();
		String referer = request.getHeader("REFERER");
		referer = referer.substring(referer.compareTo("ITGBBSvS"));
		
		String ref2 = request.getHeader("REFERER");
		ref2 = ref2.substring(8);
		ref2 = ref2.substring((ref2.indexOf('/', ref2.indexOf('/')+1)+1));
		return "redirect:/"+ref2;
		
	}
	
}
