package inc.itgbbs.controller;

import java.io.File;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.util.FileUtil;
import com.board.validator.BoardValidator;

import inc.itgbbs.dao.FreeBoardDao;
import inc.itgbbs.domain.FreeBoardDTO;

@Controller
public class FreeUpdateController {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private FreeBoardDao freeBoardDao; // Setter Method를 호출하는지 확인

	@RequestMapping(value = "/free/updateForm.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam("anum") int anum) {

		FreeBoardDTO freeBoardDTO = freeBoardDao.selectBoard(anum);
		return new ModelAndView("boardModify", "command", freeBoardDTO);// 이동할
																		// 페이지명
	}

	// 2.Post방식->수정
	@RequestMapping(value = "/board/update.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute("") FreeBoardDTO command, BindingResult result) {
		// 전달되는 입력값들,유효성검사 결과값
		if (log.isDebugEnabled()) {
			log.debug("BoardCommand=" + command);// 앞에서 입력받은값을 확인
		}
/*		// 유효성 체크메서드 호출(글수정)
		new BoardValidator().validate(command, result);
		// 만약에 필수입력인데 입력을 하지 않았다면
		if (result.hasErrors()) { // 입력받은 값에 문제가 발생이 된다면(암호입력X)
			return "boardModify";// boardModify.jsp로 되돌아가라
		}*/

		BoardCommand board = null;// 수정
		String oldFileName = "";

		// 변경전 파일명을 읽어옴
		board = freeBoardDao.selectBoard(command.getSeq());

		// 비밀번호체크(DB상의 암호=웹상에서의 입력한 암호)
		if (!board.getPwd().equals(command.getPwd())) {// 같지 않다면
			result.rejectValue("pwd", "invalidPassword"); // 에러발생=>키등록->에러메세지등록
			return "boardModify";// 암호가 틀리면 다시 입력하도록
		} else {// 암호가 맞다면
				// 기존의 파일명을 얻어와야함
			oldFileName = board.getFilename();
			// 업로드했는지 안했는지를 체크

			if (!command.getUpload().isEmpty()) {
				try { // 새로운 파일명으로 등록
					command.setFilename(FileUtil.rename(command.getUpload().getOriginalFilename()));// DB에
																									// 저장하기
																									// 직전에
																									// 저장(변경파일명)
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {// 업로드 하지 않은 경우
				command.setFilename(oldFileName);// 그냥 덮어쓰기
			}

			freeBoardDao.update(command);// 실제 DB상에 변경

			// 실질적인 기존의 파일을 삭제->새로운 파일로 업로드할 수있도록 재 조정(복사)
			if (!command.getUpload().isEmpty()) { // 탐색기의 파일=>업로드위치 복사
				try {
					File file = new File(FileUtil.UPLOAD_PATH + "/" + command.getFilename());
					// Multipart객체명.transferTo(이동할 경로포함한 파일의 정보객체명)//복사해줌
					command.getUpload().transferTo(file);

				} catch (Exception e) {
					e.printStackTrace();
				}
				// 이전의 데이터는 삭제
				if (oldFileName != null) {
					FileUtil.removeFile(oldFileName);
				}
			}
		}
		return "redirect:/free/list.do";// redirect:/요청명령어
	}// 메서드
}
