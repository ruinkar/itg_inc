package action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etc.PagingUtil;
import model.RankDAO;

public class RankList implements CommandAction, etc.ContentPath {

	
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("RankView.requestPro()");
		
		PagingUtil page = null;
		RankDAO dao = new RankDAO();
		// 현재 페이지 설정
		
		int currentPage = 1;
		int count = 0; // 총 레코드 수
		int blockCount = 10;
		int blockPage = 5;
		String pageUrl = "rank.do";
		String pageNum = request.getParameter("pageNum"); // 검색 분야, 검색어 처리
		if (pageNum == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(pageNum);
		}
		
		count = dao.getMemberCount();
		
		page = new PagingUtil(currentPage, count, blockCount, blockPage, pageUrl);
		int start = page.getStartCount();
		int end = page.getEndCount();
		String pagingHtml = page.getPagingHtml().toString();
		
		List list = dao.getRankTop();
		List list_others = dao.getRankPage(start, end);
		/*
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		*/
		
		String json_high = dao.listJSON(list);
		String json_others = dao.listJSON(list_others);
		
		// request.setAttribute("count", count);
		request.setAttribute("json_high", json_high);
		request.setAttribute("json_others", json_others);
		request.setAttribute("pagingHtml", pagingHtml);
		
		return RANK + "/rank.jsp";
	}
	
	

	/*
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("RankView.requestPro()");
		
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
		
		return BASE + "/rank.jsp";
	} */
}
