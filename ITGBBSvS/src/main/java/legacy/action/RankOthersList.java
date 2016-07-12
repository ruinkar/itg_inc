package legacy.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inc.itgbbs.util.PagingUtil;
import legacy.model.RankDAO;

public class RankOthersList implements CommandAction, inc.itgbbs.util.ContentPath {

	
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("RankView.requestPro()");
		
		PagingUtil page = null;
		RankDAO dao = new RankDAO();
		// 현재 페이지 설정
		
		final String mpoint_list = "mpoint";
		String rtypestr = request.getParameter("rtype");
		if (rtypestr == null) rtypestr = "";
		int rtype = rtypestr.equals(mpoint_list) ? 
				0 : 1;
		
		int currentPage = 1;
		int count = 0; // 총 레코드 수
		int blockCount = 10;
		int blockPage = 5;
		String pageUrl = "rank_others.do";
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
		
		List list_others = dao.getRankPage(rtype, start, end);
		String json_others = dao.listJSON(list_others);
		
		// request.setAttribute("count", count);
		String json = "{ \"json_others\": " + json_others
				+ ", \"pagingHtml\": \"" + pagingHtml + "\"}";
		System.out.println(json);
		request.setAttribute("json", json);
		
		return RANK + "/rank_others.jsp";
	}
}
