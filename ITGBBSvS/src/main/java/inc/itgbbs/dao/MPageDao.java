package inc.itgbbs.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import inc.itgbbs.domain.BoardCommand;
import inc.itgbbs.domain.PageCommand;
import inc.itgbbs.domain.RankCommand;

public class MPageDao extends SqlSessionDaoSupport implements IMPageDao {


	@Override
	public RankCommand meminfo(String id) {
		return getSqlSession().selectOne("MPage.meminfo", id);
	}
	
	@Override
	public int count(String id) {
		return getSqlSession().selectOne("MPage.count", id);
	}
	
	@Override
	public List list(PageCommand pageCommand) {
		// System.out.println(pageCommand.getStart() + " " + pageCommand.getEnd());
		return getSqlSession().selectList("MPage.list", pageCommand);
	}

	@Override
	public BoardCommand reply(int anum) {
		return getSqlSession().selectOne("MPage.reply", anum);
	}


}
