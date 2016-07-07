package model;

/**
 * logininfo(로그인정보) 테이블의 DTO 클래스
 * @author son
 */
public class LoginInfoDTO {
	private String id; //아이디
	private String password; //비밀번호
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "LoginInfoDTO [id=" + id + ", password=" + password + "]";
	}
	
	
}
