package inc.itgbbs.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import inc.itgbbs.domain.LoginInfoDTO;
import inc.itgbbs.domain.MemberCommand;

@Component
public class LoginDaoImpl extends SqlSessionDaoSupport 
                                         implements LoginDao {

	@Override
	public Integer findUser(LoginInfoDTO login) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Login.findUser",login);
	}
	

	@Override
	public int getMember(String id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("Login.getMember", id);
	}

	@Override
	public void signUpMember(MemberCommand memberCommand) {
		getSqlSession().insert("Login.signUpMember", memberCommand);
		getSqlSession().insert("Login.signUpLoginInfo", memberCommand);
	}

	@Override
	public void deleteLoginInfo(LoginInfoDTO loginInfoDTO) {
		getSqlSession().delete("Login.deleteLoginInfo", loginInfoDTO);
	}

}

