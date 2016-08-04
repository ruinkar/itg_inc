package inc.itgbbs.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import inc.itgbbs.dao.LoginDao;
import inc.itgbbs.domain.MemberCommand;
import inc.itgbbs.util.ContentPath;

@Controller
@SessionAttributes("memberCommand")
public class SignUpController implements ContentPath{
	@Autowired
	private LoginDao loginDao;
	/*
	@ModelAttribute("memberCommand")
	public MemberCommand formBacking() {
		return new MemberCommand();
	}*/
	
	@RequestMapping(value=MEMBER + "/signup.do", method=RequestMethod.GET)
	public String form(Model model){
		model.addAttribute("memberCommand", new MemberCommand());
		System.out.println("form()");
		return "signUpForm";
	}
	
	@RequestMapping(value=MEMBER + "/signup.do", method=RequestMethod.POST)
	public String signUp(@ModelAttribute @Valid MemberCommand memberCommand, BindingResult result, SessionStatus sessionStatus) {
		
		if(result.hasErrors() ){
			return "signUpForm";
		} else {
			sessionStatus.setComplete();
			loginDao.signUpMember(memberCommand);
			return "redirect:/memberInfo.do?id=" + memberCommand.getId();
		}
	}

}
