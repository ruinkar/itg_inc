package com.board.controller;

import java.io.File;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.dao.BoardDao;
import com.board.domain.BoardCommand;
import com.board.util.FileUtil;


@Controller
public class DetailController {
	
	private Logger log = Logger.getLogger(this.getClass());
	private BoardDao boardDao;

	
	@Autowired
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		System.out.println("DetailController의 setBoardDao()호출");
	}

	@RequestMapping("/board/detail.do")
	public ModelAndView process(@RequestParam("seq") int seq) {
		if(log.isDebugEnabled()) {
			log.debug("seq = " + seq);
		}
		
		boardDao.updateHit(seq); //조회수 증가
		
		//레코드를 한개 얻어오는 메서드호출
		BoardCommand board = boardDao.selectBoard(seq);
		
		//selectDetail.jsp에 전달(1.이동할 페이지, 2.key값 3.value값)
		ModelAndView mav = new ModelAndView("boardView", "board", board);
		return mav;
		
	}
	//파일 다운로드에 해당하는 요청이 들어왔을 때 처리해주는 메서드
	@RequestMapping("/board/file.do")
	public ModelAndView download(@RequestParam("filename") String fileName) throws Exception {
		File downloadFile = new File(FileUtil.UPLOAD_PATH + "/" + fileName);
		return new ModelAndView("downloadView", "downloadFile", downloadFile);
		
	}
}
