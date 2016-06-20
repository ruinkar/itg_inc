package base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 웹상에서 요청을 받아서 처리해주는 메서드를 각 Action에ㅓㅅ 공통으로
// 사용할 메서드를 추상메서드로 구
public interface CommandAction {
	// 반환값 → String (요청을 받아서 화면에 결과를 보여줄 jsp가 있는 위치)
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}
