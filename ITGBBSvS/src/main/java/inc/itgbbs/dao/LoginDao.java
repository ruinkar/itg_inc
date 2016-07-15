package inc.itgbbs.dao;

import inc.itgbbs.domain.LoginInfoDTO;

public interface LoginDao {
   public Integer findUser (LoginInfoDTO login);
}

