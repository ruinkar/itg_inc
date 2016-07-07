package model;

/**
 * member(회원) 테이블의 DTO 클래스
 * @author son
 */
public class MemberDTO {
	private String id; // 아이디
	private String name; // 이름
	private String nick; //닉네임
	private String email; //이메일
	private String thumbnail; //섬네일(등록사진)
	private int mpoint; //회원포인트
	private String fkey; //페이스북 로그인 인증키
	private String gkey; //구글 로그인 인증키
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getNick() {
		return nick;
	}
	
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getThumbnail() {
		return thumbnail;
	}
	
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public int getMpoint() {
		return mpoint;
	}
	
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	
	public String getFkey() {
		return fkey;
	}
	
	public void setFkey(String fkey) {
		this.fkey = fkey;
	}
	
	public String getGkey() {
		return gkey;
	}
	
	public void setGkey(String gkey) {
		this.gkey = gkey;
	}
	
	

}
