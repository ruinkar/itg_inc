package inc.itgbbs.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {
	
	@RequestMapping("/error.do")
	public ModelAndView error(HttpServletResponse response){
		
		return new ModelAndView("pageError");
	}
}
