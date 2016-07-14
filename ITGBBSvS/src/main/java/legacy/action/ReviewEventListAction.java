package legacy.action;

import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import legacy.model.ReviewDAO;

public class ReviewEventListAction implements CommandAction, inc.itgbbs.util.ContentPath  {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.printf("ReviewEventListAction.requestPro() call%n");
		request.setCharacterEncoding("utf-8");
		int count = 0; // 총 레코드 수
		int number = 0; // 페이지별 시작하는 게시물 번호
		List articleList = null; // 10개의 레코드들을 담을 변수(그릇)
		String check = request.getParameter("check");
		ReviewDAO reviewPro = new ReviewDAO();
		
		String pageNum = request.getParameter("pageNum");
		// 검색어 처리
		String search = request.getParameter("search");
		count = reviewPro.eventCount(search);
		
		Hashtable<String, Integer> pgList = reviewPro.pageList(pageNum, count);
		
		if (count > 0) {
			// 테이블의 레코드 순번, 화면에 보여줄 레코드 수 갯수(endRow X)
			System.out.printf("startRow=%s, endRow=%s %n", pgList.get("startRow"), pgList.get("endRow"));
			articleList = reviewPro.evRead(
					pgList.get("startRow"),
					pgList.get("endRow"),
					search
					);
			System.out.printf("articleList: %s%n", articleList);
		} else {
			articleList = Collections.EMPTY_LIST;
		}
		request.setAttribute("search", search); // 검색 분류
		request.setAttribute("articleList", articleList); // 레코드를 저장한 객체
		request.setAttribute("count", count); // 레코드를 저장한 객체
		request.setAttribute("check", check); // 레코드를 저장한 객체
		
		Set<String> keys = pgList.keySet();
		String key = null;
		Iterator it = keys.iterator();
		while(it.hasNext()) {
			key = (String) it.next();
			// System.out.println(key);
			request.setAttribute(key, pgList.get(key));
		}
		return REVIEW +"/eventCheck.jsp";
	}

}