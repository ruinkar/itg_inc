package inc.itgbbs.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import inc.itgbbs.domain.LoginInfoDTO;

public class LoginDaoImpl extends SqlSessionDaoSupport 
                                         implements LoginDao {

	@Override
	public Integer findUser(LoginInfoDTO login) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Login.findUser",login);
	}

	
}

