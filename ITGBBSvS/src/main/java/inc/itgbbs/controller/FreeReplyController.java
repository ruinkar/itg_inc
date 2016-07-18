package inc.itgbbs.controller;

import java.sql.Timestamp;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import inc.itgbbs.dao.FreeBoardDao;
import inc.itgbbs.domain.FreeBoardDTO;

@Controller
public class FreeReplyController {


	@Autowired
	private FreeBoardDao freeBoardDao;// 메서드호출

	@RequestMapping(value = "/free/replyPro.do", method = RequestMethod.POST)
	public String submit(@RequestParam("acontent") String acontent, @RequestParam("pnum") String pnum1) {
		int pnum = Integer.parseInt(pnum1);
		System.out.println("pnum = " + pnum);
		System.out.println("acontent = " + acontent);
		FreeBoardDTO freeBoardDTO = new FreeBoardDTO();
		freeBoardDTO.setTitle("댓글");
		freeBoardDTO.setAcontent(acontent);
		freeBoardDTO.setWriter("jjj"); // 로그인 임시 계정
		freeBoardDTO.setPnum(pnum);
		Timestamp t = new Timestamp(System.currentTimeMillis());
		freeBoardDTO.setAdate(t);
		freeBoardDTO.setIp("4.4.4.4"); // 추후 설정
		freeBoardDTO.setCategory(3); // 댓글 카테고리

		try {

			// 최대값을 구하기->+1
			int newSeq = freeBoardDao.getNewSeq() + 1;
			System.out.println("freeBoardDao.getNewSeq()=" + freeBoardDao.getNewSeq());
			System.out.println("anum + 1=" + newSeq);

			freeBoardDTO.setAnum(newSeq);
			freeBoardDao.insertReply(freeBoardDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/free/content.do?anum=" + pnum;
	}

}
