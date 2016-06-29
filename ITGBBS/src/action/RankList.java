package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDTO;
import model.RankDAO;

public class RankList implements CommandAction, etc.ContentPath {

	
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("RankView.requestPro()");
		
		RankDAO dao = new RankDAO();
		// 현재 페이지 설정
		int count = 0; // 총 레코드 수
		int number = 0; // 페이지별 시작하는 게시물 번호
		String pageNum = request.getParameter("pageNum"); // 검색 분야, 검색어 처리
		count = dao.getMemberCount();
		
		
		List list = dao.getRankTop();
		List list_others = dao.getRankPage("1", "10");
		/*
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		*/
		String json_high = dao.listJSON(list);
		String json_others = dao.listJSON(list_others);
		
		request.setAttribute("count", count);
		request.setAttribute("json_high", json_high);
		request.setAttribute("json_others", json_others);
		
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
