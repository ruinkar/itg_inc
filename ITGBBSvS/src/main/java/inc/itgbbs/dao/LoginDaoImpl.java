package inc.itgbbs.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import inc.itgbbs.domain.LoginInfoDTO;

@Component
public class LoginDaoImpl extends SqlSessionDaoSupport 
                                         implements LoginDao {

	@Override
	public Integer findUser(LoginInfoDTO login) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Login.findUser",login);
	}

	
}

