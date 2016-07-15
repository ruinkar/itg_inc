package inc.itgbbs.controller;

import java.sql.Timestamp;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import inc.itgbbs.dao.FreeBoardDao;
import inc.itgbbs.domain.FreeBoardDTO;



@Controller
public class FreeWriteController {

private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private FreeBoardDao freeBoardDao;//메서드호출

	
	//입력->insertForm.jsp->액션컨트롤러 필요
	//submit->요청명령어가 틀리면->따로 작성(p303)
	//1.Get방식value="/요청명령어",method=RequestMethod.GET
	@RequestMapping(value="/free/writeForm.do")
		public String form(){
			System.out.println("writeForm으로 이동 중");
			return "boardWrite";
		}
	
	//커맨드 객체 초기화->사용자로부터 값을 입력받은 부분(객체)->Model
/*	@ModelAttribute("freeBoardDTO")
	//public MemberCommand test(){
	public FreeBoardDTO formBacking(){
		System.out.println("formBacking()호출됨");
		return new FreeBoardDTO();
	}*/
	
	//2.Post방식
	@RequestMapping(value="/free/writePro.do", method=RequestMethod.POST)
	public String submit(@RequestParam("title") String title,
			@RequestParam("acontent") String acontent,
			@RequestParam("writer") String writer
			){
		
		System.out.println("title = " + title);
		System.out.println("acontent = " + acontent);
		System.out.println("writer = " + writer);
		FreeBoardDTO freeBoardDTO = new FreeBoardDTO();
		freeBoardDTO.setTitle(title);
		freeBoardDTO.setAcontent(acontent);
		freeBoardDTO.setWriter(writer);

		Timestamp t = new Timestamp(System.currentTimeMillis());
		freeBoardDTO.setAdate(t);
		freeBoardDTO.setIp("4.4.4.4");	//추후 설정
		freeBoardDTO.setCategory(0);
		freeBoardDTO.setAfile("x");

		//파일업로드 유무
		try{
			
			//최대값을 구하기->+1
			int newSeq=freeBoardDao.getNewSeq()+1;
			System.out.println("freeBoardDao.getNewSeq()="+freeBoardDao.getNewSeq());
			System.out.println("newSeq="+newSeq);
			
			freeBoardDTO.setAnum(newSeq);
			
		    freeBoardDao.insert(freeBoardDTO);//파일업로드인 경우만 따로 처리->DB에 저장
		    
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/free/list.do";//redirect:/요청명령어
	}
	
	
}
