package inc.itgbbs.dao;

import java.util.List;

import inc.itgbbs.domain.RankCommand;
import inc.itgbbs.util.PagingUtil;

public interface IRankDao {

	// 유저 수 
	public int getMemberCount(int rtype);
	
	// 상단 유저 목록
	public List<RankCommand> getListTop(int rtype, int top);
	
	// 하단 유저 목록
	public List<RankCommand> getListPage(int rtype, PagingUtil pagingUtil);
}
