package inc.itgbbs.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.EventDao;
import inc.itgbbs.domain.BoardDTO;
import inc.itgbbs.domain.EventDTO;
import inc.itgbbs.util.FileUtil;
import inc.itgbbs.util.TimeConvert;

@Controller
public class EventUpdateController {

	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private EventDao eventDao;//메서드호출

	//입력->insertForm.jsp->액션컨트롤러 필요
	//submit->요청명령어가 틀리면->따로 작성(p303)
	//1.Get방식value="/요청명령어",method=RequestMethod.GET
	@RequestMapping(value="/evinfo/updateForm.do",method=RequestMethod.GET)
	public ModelAndView process(@RequestParam("anum") int anum,
			@RequestParam("pageNum") int pageNum
			) {
		if(log.isDebugEnabled()) {
			log.debug("anum = " + anum);
		}
		System.out.println("anum="+anum);
		
		//레코드를 한개 얻어오는 메서드호출
		BoardDTO barticle = eventDao.selectboard(anum);
		EventDTO earticle = eventDao.selectevent(anum);
		TimeConvert tc = new TimeConvert();
		earticle.setBeginStr(tc.timeStampTostr2(earticle.getBegin()));	
		earticle.setEndStr(tc.timeStampTostr2(earticle.getEnd()));
		//selectDetail.jsp에 전달(1.이동할 페이지, 2.key값 3.value값)
		ModelAndView mav = new ModelAndView("eventUpdateForm");
		// 답변에 대한 메서드 정리		
		mav.addObject("barticle", barticle);
		mav.addObject("earticle", earticle);
		mav.addObject("pageNum", pageNum);
		return mav;
	}

	
	//커맨드 객체 초기화->사용자로부터 값을 입력받은 부분(객체)->Model
	@ModelAttribute("command")
	//public MemberCommand test(){
	public BoardDTO formBacking(){
		System.out.println("formBacking()호출됨");
		return new BoardDTO();
	}
	
	//2.Post방식
	@RequestMapping(value="/evinfo/updateForm.do",method=RequestMethod.POST)
	public String submit(@ModelAttribute("command") BoardDTO command,
									@ModelAttribute("event") EventDTO event,
									BindingResult result){

		//전달되는 입력값들,유효성검사 결과값
		if(log.isDebugEnabled()){
			log.debug("BoardDTO="+command);//앞에서 입력받은값을 확인
			log.debug("event="+event);//앞에서 입력받은값을 확인
		}
/*		//유효성 체크메서드 호출
		new ReviewWriteValidator().validate(command, result);
		//만약에 필수입력인데 입력을 하지 않았다면
		if(result.hasErrors()){ //입력받은 값에 문제가 발생이 된다면
			return form();//insertForm.jsp로 되돌아가라
		}
*/		//파일업로드 유무
		try{
			String oldFileName="";//업로드할 파일명 저장
			oldFileName = command.getAfile();
			System.out.println("oldFileName = " + oldFileName );
			// 파일업로드된 파일이 존재한다면
			if (!command.getUpload().isEmpty()) {
			// 맨처음에 업로드한 파일명(바꾸기전의 파일명)
				command.setAfile("/img/"+FileUtil.rename(command.getUpload().getOriginalFilename()));
				event.setEimg(command.getAfile());//DB에 저장하기 직전에 저장(변경파일명)
			} else {
				command.setAfile(oldFileName);
				event.setEimg(command.getAfile());//DB에 저장하기 직전에 저장(변경파일명)
			}
			System.out.println("saveFilename = " + command.getAfile() );
			
			
			TimeConvert tc = new TimeConvert();
			event.setBegin(tc.strToTimeStamp(event.getBeginStr()));
			event.setEnd(tc.strToTimeStamp(event.getEndStr()));
			
			eventDao.updateboard(command);//파일업로드인 경우만 따로 처리->DB에 저장
			eventDao.updateevent(event);
			
			// 새로운 파일로 업로드 할수 있도록 재조정
			if (!command.getUpload().isEmpty()) { // 탐색기의 파일=>업로드위치 복사
				File file = new File(FileUtil.UPLOAD_PATH + "/" + command.getAfile().substring(5));
				// Multipart객체명.transferTo(이동할 경로포함한 파일의 정보객체명)//복사해줌
				command.getUpload().transferTo(file);
			}

			// 기존의 파일을 삭제
			if (oldFileName != null && !oldFileName.equals(command.getAfile())) {
				FileUtil.removeFile(oldFileName.substring(5));
			}

		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/evinfo/list.do";//redirect:/요청명령어
	}
}
