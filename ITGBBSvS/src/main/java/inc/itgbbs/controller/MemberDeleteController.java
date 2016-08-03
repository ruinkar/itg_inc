package inc.itgbbs.controller;

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
import inc.itgbbs.util.ContentPath;

@Controller
@SessionAttributes("command")
public class MemberDeleteController implements ContentPath{
	@Autowired
	private LoginDao loginDao;
	
	@ModelAttribute("command")
	public LoginInfoDTO formBacking() {
		LoginInfoDTO loginInfoDTO = new LoginInfoDTO();
		String id = "";
		
		id = (String)((ServletRequestAttributes)RequestContextHolder
				.currentRequestAttributes()).getRequest()
				.getSession().getAttribute("id");
		loginInfoDTO.setId(id);
		
		return loginInfoDTO;
	}
	
	@RequestMapping(value=MEMBER + "/delete.do", method=RequestMethod.GET)
	public String form(){
		// model.addAttribute("memberCommand", new MemberCommand());
		System.out.println("form()");
		return "memberDeleteForm";
	}
	
	@RequestMapping(value=MEMBER + "/delete.do", method=RequestMethod.POST)
	public String signUp(@Valid LoginInfoDTO loginInfoDTO, BindingResult result, SessionStatus sessionStatus) {
		
		System.out.println(loginInfoDTO.toString() );
		
		if(result.hasErrors() ){
			return "memberDeleteForm";
		} else {
			((ServletRequestAttributes)RequestContextHolder
					.currentRequestAttributes())
					.getRequest()
					.getSession()
					.invalidate();
			sessionStatus.setComplete();
			loginDao.deleteLoginInfo(loginInfoDTO);
			return "redirect:/free/list.do";
		}
	}

}
