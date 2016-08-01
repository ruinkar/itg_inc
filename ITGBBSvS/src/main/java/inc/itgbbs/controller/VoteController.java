package inc.itgbbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import inc.itgbbs.dao.IVoteDao;
import inc.itgbbs.domain.LikeListDTO;

@Controller
public class VoteController {
	
	@Autowired
	IVoteDao voteDao;
	
	// 추천 동작
	// 현재 아이디의 현재 글 추천 기록 검색 후
	// 존재하지 않으면 새 추천 정보 등록
	// 최종적으로 총 추천 수 반환
	@RequestMapping("/free/vote.do")
	@ResponseBody
	public String vote(
			@RequestParam("anum") int anum,
			HttpServletRequest request
			){
		
		LikeListDTO likeListDTO = new LikeListDTO();
		
		String id = request.getSession().getAttribute("id").toString();
		
		System.out.println(id + "의 추천: " + anum);
		
		likeListDTO.setId(id);
		likeListDTO.setAnum(anum);
		
		int check = 0;
		check = voteDao.voteCheck(likeListDTO);
		
		if(check == 0) {
			voteDao.vote(likeListDTO);
		} else {
			voteDao.unvote(likeListDTO);
		}
		
		int votecount = 0;
		votecount = voteDao.voteCount(anum);
		
		return String.valueOf(votecount);
	}

}
