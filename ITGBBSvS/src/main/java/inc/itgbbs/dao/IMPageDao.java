package inc.itgbbs.dao;

import java.util.List;

import inc.itgbbs.domain.BoardCommand;
import inc.itgbbs.domain.PageCommand;
import inc.itgbbs.domain.RankCommand;

public interface IMPageDao {
	
	// 유저 정보
	public RankCommand meminfo(String id);
	
	// 유저 게시글 전체 수
	public int count(String id);
	
	// 유저 게시글 리스트
	public List list(PageCommand pageCommand);
	
	// 댓글 링크 부모 게시물로
	public BoardCommand reply(int anum);
}
