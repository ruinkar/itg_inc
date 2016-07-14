package inc.itgbbs.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.util.PagingUtil;

import inc.itgbbs.dao.ReviewDao;
import inc.itgbbs.domain.BoardDTO;
import inc.itgbbs.util.ContentPath;

@Controller
public class ReviewEventListController implements ContentPath {

	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private ReviewDao reviewDao;//메서드호출

	/*public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		System.out.println("setMemberDao()호출됨");
	}*/
	
	//요청받아 처리해주는 메서드 작성
	@RequestMapping(REVIEW+"/eventList.do")
	public ModelAndView process
	             (@RequestParam(value="pageNum",defaultValue="1") 
	                 int currentPage,
	              @RequestParam(value="keyField",defaultValue="") //검색분야
                     String keyField,
                  @RequestParam(value="keyWord",defaultValue="")  //검색어
	                 String keyWord,
	             @RequestParam(value="check",defaultValue="Y")  //검색어
    String check){
	
		if(log.isDebugEnabled()){//디버깅모드라면
			log.debug("currentPage="+currentPage);
			log.debug("keyField="+keyField);
			log.debug("keyWord="+keyWord);
		}
		//검색분야,검색어에 해당하는 Map객체생성
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("keyField", keyField);//검색분야
		map.put("keyWord",keyWord);//검색어
		
		//총갯수
		int count=reviewDao.getEventCount(map);
		log.debug("count="+count);
		System.out.println("count="+count);
		PagingUtil page = null;
		//페이징처리(1.검색항목,2.검색내용,3.현재페이지,4.총갯수,5.페이지당 레코드수,6.블럭당 페이지수,7.요청명령어
		if (!keyField.equals("") ) 
		{
			System.out.println("keyField는 널이 아님");
			page=new PagingUtil (keyField,keyWord,currentPage,count,3,3,"eventList.do","&check=n");
		}
		//페이징처리(1.현재페이지,2.총갯수,3.페이지당 레코드수,4.블럭당 페이지수,5.요청명령어
		else  page=new PagingUtil(currentPage,count,10,10,"eventList.do");
		map.put("start", page.getStartCount());//시작 레코드번호
		map.put("end",page.getEndCount());//마지막 레코드번호
		
		System.out.println("start="+page.getStartCount());
		System.out.println("end="+page.getEndCount());
		
		List<BoardDTO> list=null;//레코드들을 담을 객체변수선언
		if (count > 0){
			list=reviewDao.getEventList(map);
		}else{ //존재X
			list=Collections.emptyList();//0
		}
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("ReviewEventList");
		mav.addObject("articleList", list); // 레코드를 저장한 객체
		mav.addObject("count", count); // 레코드를 저장한 객체
		mav.addObject("check", check); // 레코드를 저장한 객체
		mav.addObject("pagingHtml",page.getPagingHtml());
		mav.addObject("pageNum",currentPage);
		
		return mav;
	}
}

