package com.board.controller;

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

import com.board.dao.BoardDao;
import com.board.domain.BoardCommand;
import com.board.util.PagingUtil;

@Controller
public class ListController {

	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardDao boardDao;//메서드호출

	/*public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		System.out.println("setMemberDao()호출됨");
	}*/
	
	//요청받아 처리해주는 메서드 작성
	@RequestMapping("/board/list.do")
	public ModelAndView process
	             (@RequestParam(value="pageNum",defaultValue="1") 
	                 int currentPage,
	              @RequestParam(value="keyField",defaultValue="") //검색분야
                     String keyField,
                  @RequestParam(value="keyWord",defaultValue="")  //검색어
	                 String keyWord){
	
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
		int count=boardDao.getRowCount(map);
		log.debug("count="+count);
		
		//페이징처리(1.현재페이지,2.총갯수,3.페이지당 레코드수,4.블럭당 페이지수,5.요청명령어
		PagingUtil page=new PagingUtil(currentPage,count,3,3,"list.do");
		map.put("start", page.getStartCount());//시작 레코드번호
		map.put("end",page.getEndCount());//마지막 레코드번호
		
		List<BoardCommand> list=null;//레코드들을 담을 객체변수선언
		if (count > 0){
			list=boardDao.list(map);
		}else{ //존재X
			list=Collections.emptyList();//0
		}
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("boardList");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	}
}

