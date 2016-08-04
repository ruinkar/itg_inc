package inc.itgbbs.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import inc.itgbbs.dao.ReviewDao;
import inc.itgbbs.domain.ReviewAllDTO;
import inc.itgbbs.util.FileUtil;

@Controller
public class ReviewWriteController {

	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private ReviewDao reviewDao;//메서드호출
	
	//입력->insertForm.jsp->액션컨트롤러 필요
	//submit->요청명령어가 틀리면->따로 작성(p303)
	//1.Get방식value="/요청명령어",method=RequestMethod.GET
	@RequestMapping(value="/review/writeForm.do",method=RequestMethod.GET)
		public String form(){
		    System.out.println("form()");
			return "reviewWriteForm";//이동할 페이지명
		}
	//커맨드 객체 초기화->사용자로부터 값을 입력받은 부분(객체)->Model
	@ModelAttribute("command")
	//public MemberCommand test(){
	public ReviewAllDTO formBacking(){
		ReviewAllDTO rev = new ReviewAllDTO();
		String id = (String)((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest().getSession().getAttribute("id");
		rev.setWriter(id);
		System.out.println("command()호출됨");
		return rev;
	}
	
	//2.Post방식
	@RequestMapping(value="/review/writeForm.do",method=RequestMethod.POST)
	public String submit(
			@ModelAttribute("command") @Valid ReviewAllDTO command,
			                        BindingResult result
			                        ){
		//ReviewDTO review = new ReviewDTO();
//전달되는 입력값들,유효성검사 결과값
		if(log.isDebugEnabled()){
			log.debug("ReviewAllDTO="+command );//앞에서 입력받은값을 확인
			log.debug("result="+result.getModel());//앞에서 입력받은값을 확인
		}
		//만약에 필수입력인데 입력을 하지 않았다면
		if(result.hasErrors()){ //입력받은 값에 문제가 발생이 된다면
			return "reviewWriteForm";//이동할 페이지명
			//return form();//insertForm.jsp로 되돌아가라
		}
		//파일업로드 유무
		try{
			String newName="";//업로드할 파일명 저장
			//파일업로드된 파일이 존재한다면
			if(!command.getUpload().isEmpty()){
				//맨처음에 업로드한 파일명(바꾸기전의 파일명)
				newName=FileUtil.rename
						             (command.getUpload().getOriginalFilename());
				System.out.println("newName="+newName);
				command.setAfile("/img/"+newName);//DB에 저장하기 직전에 저장(변경파일명)
			}
			else {
				command.setAfile("/img/noimage.jpg");//DB에 저장하기 직전에 저장(변경파일명)
			}
			//최대값을 구하기->+1
			int newSeq=reviewDao.getNewAnum()+1;
			System.out.println("boardDao.getNewSeq()="+reviewDao.getNewAnum());
			System.out.println("newSeq="+newSeq);
			
			command.setAnum(newSeq);
			String ip = null;
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			
			ip = request.getHeader("X-FORWARDED-FOR");
			if (ip == null)
			ip = request.getRemoteAddr();
			command.setIp(ip);
			//review.setAnum(command.getAnum());
			
			reviewDao.insertReview(command);//파일업로드인 경우만 따로 처리->DB에 저장
			reviewDao.insertRating(command);
			
		    ///실질적인 업로드가 될 수있도록
		    if(!command.getUpload().isEmpty()){ //탐색기의 파일=>업로드위치 복사
		    	File file=new File(FileUtil.UPLOAD_PATH+"/"+newName);
		    	//Multipart객체명.transferTo(이동할 경로포함한 파일의 정보객체명)//복사해줌
		    	command.getUpload().transferTo(file);
		    }
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/review/list.do";//redirect:/요청명령어
	}
}
