package inc.itgbbs.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import inc.itgbbs.domain.PageCommand;
import inc.itgbbs.domain.RankCommand;

public class RankDao extends SqlSessionDaoSupport implements IRankDao {
	
	@Override
	public int getMemberCount(int rtype) {
		return getSqlSession().selectOne(
				rtype == 0 ?
				"Rank.memberCountMpoint" : "Rank.memberCountRating");
	}

	@Override
	public List<RankCommand> getListTop(int rtype, int top) {
		return getSqlSession().selectList(
				rtype == 0 ?
				"Rank.list_top_mpoint" : "Rank.list_top_rating", top);
	}

	@Override
	public List<RankCommand> getListPage(int rtype, PageCommand pageCommand) {
		System.out.println(pageCommand.getStart() + " " + pageCommand.getEnd());
		return getSqlSession().selectList(
				rtype == 0 ?
				"Rank.list_page_mpoint" : "Rank.list_page_rating", pageCommand);
	}
	
}
