package action;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etc.ContentPath;
import model.BoardDAO;

public class FreeListAction implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		// 모델2 게시판 페이징처리 참조
		// 선언문
		int pageSize = 10; // numberPage : 페이지당 보여주는 레코드 수
		int blockSize = 10; // pagePerBlock : 블락당 보여주는 페이지 수
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-DD HH:mm"); // 한국식
																			// 날짜양식
																			// 설정

		// 현재페이지 설정
		String pageNum = request.getParameter("pageNum"); // 클라이언트가 클릭시 자기자신
															// 호출하면 값 넘어옴
		System.out.println("페이징처리 pageNum = " + pageNum);

		if (pageNum == null)
			pageNum = "1"; // 처음 페이지를 열었을 때
		int currentPage = Integer.parseInt(pageNum); // nowPage : 현재페이지

		// 시작 레코드번호
		int startRow = (currentPage - 1) * pageSize + 1;
		// ex) (1-1)*10 +1 =1, (2-1)*10 +1 =11

		int endRow = currentPage * pageSize; // 종료 레코드번호

		int count = 0; // 총레코드수
		int number = 0; // 페이지별 시작하는 게시물의 번호(=beginPerPage)
		List articleList = null; // 10개(기본값)의 레코드를 담을 변수(그릇)

		// 총레코드수 구하기
		BoardDAO bdPro = new BoardDAO();
		count = bdPro.getArticleCount();
		System.out.println("현재 레코드 수 count = " + count); // 디버깅용
		if (count > 0) {
			articleList = bdPro.getArticles(startRow, endRow);
			System.out.println("articleList = " + articleList);
		}
		number = count - (currentPage - 1) * pageSize;
		// ex) 122 - (1-1)*10 = 122부터 시작(1페이지)
		System.out.println("number = " + number);
		
		//처리 결과 request객체에 저장
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("number", number);
		request.setAttribute("articleList", articleList);

		return FREE+"/okkyFree2.jsp";
	}

}
