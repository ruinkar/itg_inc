package legacy.action;

import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import legacy.model.BoardDTO;
import legacy.model.ReviewDAO;

public class ReviewListAction implements CommandAction, inc.itgbbs.util.ContentPath  {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.printf("ReviewListAction.requestPro() call%n");
		int count = 0; // 총 레코드 수
		int number = 0; // 페이지별 시작하는 게시물 번호
		List articleList = null; // 10개의 레코드들을 담을 변수(그릇)
		List articleRankList = null;
		int makeControlBoxCount = 0;
		ReviewDAO reviewPro = new ReviewDAO();
		
		String pageNum = request.getParameter("pageNum");
		// 검색 분야, 검색어 처리
		String search = request.getParameter("search");
		String searchtext = request.getParameter("searchtext");
		count = reviewPro.getArticleSearchCount(search, searchtext);
		
		Hashtable<String, Integer> pgList = reviewPro.pageList(pageNum, count);
		articleRankList = reviewPro.getArticlesRank(1 , 10); // 10위까지의 데이터를 가져온다.
		BoardDTO firstRank = (BoardDTO)articleRankList.get(0);
		articleRankList.remove(0);
		makeControlBoxCount = articleRankList.size()/3;
		System.out.printf("makeControlBoxCount: %s%n",makeControlBoxCount);
		makeControlBoxCount = makeControlBoxCount;
		if ((articleRankList.size()%3) > 0)
			makeControlBoxCount += 1;
		System.out.printf("articleRankList.size(): %s%n", articleRankList.size());
		System.out.printf("makeControlBoxCount: %s%n", makeControlBoxCount);
		if (count > 0) {
			// 테이블의 레코드 순번, 화면에 보여줄 레코드 수 갯수(endRow X)
			
			System.out.printf("count =%s , startRow=%s, endRow=%s %n",count, pgList.get("startRow"), pgList.get("endRow"));
			articleList = reviewPro.getSearchArticles(
					pgList.get("startRow"),
					pgList.get("endRow"),
					search,
					searchtext
					);
			
			System.out.printf("articleList: %s%n", articleList);
		} else {
			articleList = Collections.EMPTY_LIST;
		}
		
		request.setAttribute("search", search); // 검색 분류
		request.setAttribute("searchtext", searchtext); // 검색어
		request.setAttribute("articleList", articleList); // 레코드를 저장한 객체
		request.setAttribute("count", count); // 레코드를 저장한 객체
		request.setAttribute("firstRank", firstRank); // 레코드를 저장한 객체
		request.setAttribute("otherRank", articleRankList); // 레코드를 저장한 객체
		request.setAttribute("makeControlBoxCount", makeControlBoxCount); // 레코드를 저장한 객체
		
		Set<String> keys = pgList.keySet();
		String key = null;
		Iterator it = keys.iterator();
		while(it.hasNext()) {
			key = (String) it.next();
			// System.out.println(key);
			request.setAttribute(key, pgList.get(key));
		}
		return REVIEW +"/list.jsp";
	}

}
