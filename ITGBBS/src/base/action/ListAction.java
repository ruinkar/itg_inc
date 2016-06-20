package base.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.model.BoardDAO;

// /list.do 요청시 응답하는 request.Pro()를 호출하는 액션클래스
public class ListAction implements CommandAction, etc.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// jsp에서 작업하던 자바의 메서드 호출부분을 여기서 작업
		System.out.printf("ListAction.requestPro() call%n");
		// 현재 페이지 설정
		int count = 0; // 총 레코드 수
		int number = 0; // 페이지별 시작하는 게시물 번호
		List articleList = null; // 10개의 레코드들을 담을 변수(그릇)
		BoardDAO bdPro = new BoardDAO();
		
		String pageNum = request.getParameter("pageNum");
		// 검색 분야, 검색어 처리
		String search = request.getParameter("search");
		String searchtext = request.getParameter("searchtext");
		
		count = bdPro.getArticleSearchCount(search, searchtext);
		System.out.printf("현재 레코드 수: %d%n", count);
		
		Hashtable<String, Integer> pgList = bdPro.pageList(pageNum, count);
		
		if (count > 0) {
			// 테이블의 레코드 순번, 화면에 보여줄 레코드 수 갯수(endRow X)
			System.out.printf("startRow=%s, endRow=%s %n", pgList.get("startRow"), pgList.get("endRow"));
			articleList = bdPro.getSearchArticles(
					pgList.get("startRow"),
					pgList.get("pageSize"),
					search,
					searchtext
					);
			System.out.printf("articleList: %s%n", articleList);
		} else {
			articleList = Collections.EMPTY_LIST;
		}
				
		// 처리결과 → request 에 저장
		request.setAttribute("pgList", pgList); // 페이지 정보
		request.setAttribute("search", search); // 검색 분류
		request.setAttribute("searchtext", searchtext); // 검색어
		request.setAttribute("articleList", articleList); // 레코드를 저장한 객체
		
		Set<String> keys = pgList.keySet();
		String key = null;
		Iterator it = keys.iterator();
		while(it.hasNext()) {
			key = (String) it.next();
			// System.out.println(key);
			request.setAttribute(key, pgList.get(key));
		}
		
		return BASE + "/list.jsp"; // ex. "/board/list.jsp"...
	}
	
	/*
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// jsp에서 작업하던 자바의 메서드 호출부분을 여기서 작업
		int pageSize = 10; // numPerPage → 페이지 당 보여주는 레코드 수
		int blockSize = 10; //pagePerBlock → 블럭 당 보여주는 페이지 수

		// 현재 페이지 설정
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1"; // default → "1" → 1
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 = nowPage
		//총 레코드 수
		int count = 0; // 총 레코드 수
		//총 레코드 수 구하기
		BoardDAO bdPro = new BoardDAO();
		count = bdPro.getArticleCount();

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (currentPage > pageCount) {
			currentPage = pageCount;
		}
		// 시작 레코드 번호 ex (1 - 1) * 10 + 1 = 1, (2 - 1) * 10 + 1 = 11
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize; // 1

		int number = 0; // 페이지별 시작하는 게시물 번호
		List articleList = null; // 10개의 레코드들을 담을 변수(그릇)

		System.out.printf("현재 레코드 수: %d%n", count);
		if (count > 0) {
			// 테이블의 레코드 순번, 화면에 보여줄 레코드 수 갯수(endRow X)
			articleList = bdPro.getArticles(startRow, pageSize);
			System.out.printf("articleList: %s%n", articleList);
		} else {
			articleList = Collections.EMPTY_LIST;
		}
		// ex) 122 - (1 - 1) * 10
		number = count - (currentPage - 1) * pageSize;
		System.out.printf("number: %s%n", number);
		
		// 처리결과 → request 에 저장
		request.setAttribute("currentPage", currentPage); // 현재페이지
		request.setAttribute("count", count); // 총 레코드 수
		request.setAttribute("pageSize", pageSize); // 페이지당 보여주는 레코드 수
		request.setAttribute("blockSize", blockSize); // 블럭당 보여주는 페이지 수
		request.setAttribute("pageCount", pageCount); // 
		request.setAttribute("articleList", articleList); // 레코드를 저장한 객체
		
		return "/list.jsp"; // ex. "/board/list.jsp"...
	}*/
}
