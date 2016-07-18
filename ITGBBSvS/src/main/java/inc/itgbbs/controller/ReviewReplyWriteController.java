package inc.itgbbs.controller;




import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import inc.itgbbs.dao.ReviewDao;
import inc.itgbbs.domain.BoardDTO;

@Controller
public class ReviewReplyWriteController {

	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private ReviewDao reviewDao;//메서드호출

	//커맨드 객체 초기화->사용자로부터 값을 입력받은 부분(객체)->Model
	@ModelAttribute("command")
	//public MemberCommand test(){
	public BoardDTO formBacking(){
		System.out.println("formBacking()호출됨");
		return new BoardDTO();
	}
	
	//2.Post방식
	@RequestMapping(value="/review/replyWrite.do",method=RequestMethod.POST)
	public String submit(@ModelAttribute("command") BoardDTO command,
								@RequestParam(value="pageNum",defaultValue="1")
								int pageNum
			                        ){
//		ReviewDTO review = null;
		//전달되는 입력값들,유효성검사 결과값
		if(log.isDebugEnabled()){
			log.debug("BoardDTO="+command);//앞에서 입력받은값을 확인
		}
/*		//유효성 체크메서드 호출
		new ReviewWriteValidator().validate(command, result);
		//만약에 필수입력인데 입력을 하지 않았다면
		if(result.hasErrors()){ //입력받은 값에 문제가 발생이 된다면
			return form();//insertForm.jsp로 되돌아가라
		}
*/		//파일업로드 유무
			//최대값을 구하기->+1
			int newSeq=reviewDao.getNewAnum()+1;
			System.out.println("boardDao.getNewSeq()="+reviewDao.getNewAnum());
			System.out.println("newSeq="+newSeq);
			command.setPnum(command.getAnum()); // 덧글의 주체를 넣는다.
			command.setAnum(newSeq); //덧글 새번호 출력
			command.setCategory(3);// 댓글 카테고리 설정
			HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String ip = req.getHeader("X-FORWARDED-FOR");
			if (ip == null)
			ip = req.getRemoteAddr();
			command.setIp(ip);
			
			System.out.println("command result =" +command);
			reviewDao.insertReply(command);//파일업로드인 경우만 따로 처리->DB에 저장
			
		    ///실질적인 업로드가 될 수있도록
		return "redirect:/review/content.do?anum="+command.getPnum()+"&pageNum="+pageNum;//redirect:/요청명령어
	}
	
	
	@RequestMapping(value="/review/replyDelete.do",method=RequestMethod.POST)
	public String replydelete(@ModelAttribute("command") BoardDTO command,
			@RequestParam(value="pageNum",defaultValue="1")
								int pageNum
			                        ){
		System.out.println("덧글삭제 기능 : "+command);
		System.out.println("pageNum : "+pageNum);
		reviewDao.deleteReply(command.getAnum());
		return "redirect:/review/content.do?anum="+command.getPnum()+"&pageNum="+pageNum;//redirect:/요청명령어
	}
	
	
}
