package inc.itgbbs.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import inc.itgbbs.domain.PageCommand;

public class MPageDao extends SqlSessionDaoSupport implements IMPageDao {

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("MPage.count");
	}
	
	@Override
	public List list(PageCommand pageCommand) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("MPage.list", pageCommand);
	}

}
