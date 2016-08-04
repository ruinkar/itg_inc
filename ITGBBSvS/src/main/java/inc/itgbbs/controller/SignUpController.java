package inc.itgbbs.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import inc.itgbbs.dao.LoginDao;
import inc.itgbbs.domain.LoginInfoDTO;
import inc.itgbbs.domain.MemberCommand;
import inc.itgbbs.util.ContentPath;

@Controller
@SessionAttributes("memberCommand")
public class SignUpController implements ContentPath {
	@Autowired
	private LoginDao loginDao;

	@ModelAttribute("memberCommand")
	public MemberCommand formBacking() {
		return new MemberCommand();
	}

	@RequestMapping(value = MEMBER + "/signup.do", method = RequestMethod.GET)
	public String form() {
		// model.addAttribute("memberCommand", new MemberCommand());
		System.out.println("form()");
		return "tiles/member/signup";
	}

	@RequestMapping(value = MEMBER + "/signup.do", method = RequestMethod.POST)
	public String signUp(@Valid MemberCommand memberCommand, BindingResult result, SessionStatus sessionStatus) {

		System.out.println(memberCommand.toString());

		
		
		if (result.hasErrors()) {
			System.out.println("sign up error");
			return "tiles/member/signup";
		} else {
			sessionStatus.setComplete();
			loginDao.signUpMember(memberCommand);
			
			HttpSession session = ((ServletRequestAttributes)RequestContextHolder
					.currentRequestAttributes())
					.getRequest()
					.getSession();
			
			LoginInfoDTO login = new LoginInfoDTO();
			login.setId(memberCommand.getId());
			login.setPassword(memberCommand.getPassword());
			
			session.setAttribute("userLoginInfo", login);
			session.setAttribute("id", memberCommand.getId());
			
			return "redirect:/memberInfo.do?id=" + memberCommand.getId();
		}
	}

}
