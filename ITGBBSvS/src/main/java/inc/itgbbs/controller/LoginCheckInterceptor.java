package inc.itgbbs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println(".preHandle()");
		
		HttpSession session = request.getSession();
		String id = null;
		id = (String)session.getAttribute("id");
		boolean ok = (id != null);
		System.out.println(id + " " + ok);
		
		if(!ok){
			String referer = request.getHeader("REFERER");
			response.sendRedirect(referer);
		}
		
		return ok;
	}
}
