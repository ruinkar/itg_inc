package inc.itgbbs.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import inc.itgbbs.domain.MemberCommand;
import inc.itgbbs.domain.PageCommand;

public class MPageDao extends SqlSessionDaoSupport implements IMPageDao {


	@Override
	public MemberCommand meminfo(String id) {
		return getSqlSession().selectOne("MPage.meminfo", id);
	}
	
	@Override
	public int count(String id) {
		return getSqlSession().selectOne("MPage.count", id);
	}
	
	@Override
	public List list(PageCommand pageCommand) {
		return getSqlSession().selectList("MPage.list", pageCommand);
	}


}
