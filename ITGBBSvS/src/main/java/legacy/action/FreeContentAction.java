package legacy.action;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inc.itgbbs.util.ContentPath;
import legacy.model.BoardDAO;
import legacy.model.BoardDTO;

public class FreeContentAction implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		//list.jsp(okkyFree2)에서 content.jsp(okkyFreeArticle)로 넘어온 두 값 num, pageNum
		int anum = Integer.parseInt(request.getParameter("anum"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("FreeContentAction의 anum = " + anum + ", pageNum = " + pageNum); //파라미터로 받은 값 디버깅
			
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");	//날짜 출력 양식 설정 인스턴스(우리나라 양식)
		BoardDAO dbPro = new BoardDAO();	//메서드 호출
		BoardDTO article = dbPro.getArticle(anum);	//updateForm.jsp와 소스가 거의 같음
		
		
		//답글쓰기 주소 넘길때 코드를 줄이기 위한 것
	/* 	int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level(); */
		int replyNum = 0; 
		List repliesList = null;
		BoardDAO bdPro = new BoardDAO();
		replyNum = bdPro.getReplyCount(anum);
		if(replyNum > 0){
			repliesList = bdPro.getReplies(anum);
		}
		System.out.println("replyNum = "+replyNum+", repliesList = " +repliesList);
		
		//처리결과 전송
		request.setAttribute("replyNum", replyNum);
		request.setAttribute("repliesList", repliesList);
		request.setAttribute("anum", anum);
		request.setAttribute("article", article);
		request.setAttribute("pageNum", pageNum);
		
		return FREE+"/okkyFreeArticle.jsp";
	}

}
