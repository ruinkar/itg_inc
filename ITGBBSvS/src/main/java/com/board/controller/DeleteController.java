package com.board.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dao.BoardDao;
import com.board.domain.BoardCommand;
import com.board.util.FileUtil;
import com.board.validator.BoardDeleteValidator;

@Controller
public class DeleteController {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private BoardDao boardDao; // Setter Method를 호출하는지 확인

	// 커맨드객체 초기화
	@ModelAttribute("command")
	public BoardCommand formbacking() {
		return new BoardCommand();
	}

	@RequestMapping(value = "/board/delete.do", method = RequestMethod.GET)

	public String form() {
		return "boardDelete";
	}

	// 2.Post방식->수정
	@RequestMapping(value = "/board/delete.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute("command") BoardCommand command, BindingResult result) {
		// 전달되는 입력값들,유효성검사 결과값
		if (log.isDebugEnabled()) {
			log.debug("BoardCommand=" + command);// 앞에서 입력받은값을 확인
		}
		// 유효성 체크메서드 호출(글삭제)
		new BoardDeleteValidator().validate(command, result);
		// 만약에 필수입력인데 입력을 하지 않았다면
		if (result.hasErrors()) { // 입력받은 값에 문제가 발생이 된다면(암호입력X)
			return form();// boardModify.jsp로 되돌아가라
		}

		BoardCommand board = null;// 삭제

		// 삭제시킬 게시물을 얻어옴
		board = boardDao.selectBoard(command.getSeq());

		// 비밀번호체크(DB상의 암호=웹상에서의 입력한 암호)
		if (!board.getPwd().equals(command.getPwd())) {// 같지 않다면
			result.rejectValue("pwd", "invalidPassword"); // 에러발생=>키등록->에러메세지등록
			return form();// 암호가 틀리면 다시 입력하도록
		} else {// 암호가 맞다면
			boardDao.delete(command.getSeq()); //DB상의 데이터삭제
			//만약에 업로드 된 파일까지 삭제하려면
			if(board.getFilename() != null) {
				FileUtil.removeFile(board.getFilename());
			}
		}
		return "redirect:/board/list.do";// redirect:/요청명령어
	}// 메서드
}
