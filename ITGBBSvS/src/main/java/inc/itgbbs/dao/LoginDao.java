package inc.itgbbs.dao;

import inc.itgbbs.domain.LoginInfoDTO;
import inc.itgbbs.domain.MemberCommand;

public interface LoginDao {
   public Integer findUser (LoginInfoDTO login);
   
   public int getMember (String id);
   
   public void signUpMember (MemberCommand memberCommand);
   
   public void deleteLoginInfo (LoginInfoDTO loginInfoDTO);
}

