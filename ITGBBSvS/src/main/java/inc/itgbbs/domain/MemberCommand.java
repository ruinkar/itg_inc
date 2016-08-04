package inc.itgbbs.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

/**
 * member(회원) 테이블의 DTO 클래스
 * @author son
 */
@Component
@Alias("MemberCommand")
public class MemberCommand {
	@NotNull(message="빈 칸")
	@Size(min=1, max=20, message="20자를 초과할 수 없습니다")
	@Pattern(regexp="^[0-9a-zA-Z_-]+$", message="올바른 값을 입력하세요")
	private String id; // 아이디
	
	@NotNull
	@Size(min=1, max=20, message="20자를 초과할 수 없습니다")
	@Pattern(regexp="^[0-9a-zA-Z_-]+$", message="올바른 값을 입력하세요")
	private String name; // 이름
	
	@NotNull
	@Size(min=1, max=20, message="20자를 초과할 수 없습니다")
	@Pattern(regexp="^[0-9a-zA-Z_-]+$", message="올바른 값을 입력하세요")
	private String nick; //닉네임
	
	@NotNull
	@Size(min=1, max=40, message="40자를 초과할 수 없습니다")
	@Pattern(regexp="^[0-9a-zA-Z_-]+@[0-9a-zA-Z]+(.[0-9a-zA-Z_-]+)*$", message="올바른 주소를 입력하세요")
	private String email; //이메일
	
	private String thumbnail; //섬네일(등록사진)
	private int mpoint; //회원포인트
	private String fkey; //페이스북 로그인 인증키
	private String gkey; //구글 로그인 인증키
	
	@NotNull
	@Size(min=8, max=20, message="8-20자 범위에서 입력하세요")
	@Pattern(regexp="^(?=.*[a-zA-Z])(?=.*[0-9])[0-9a-zA-Z]$", message="올바른 값을 입력하세요")
	private String password;
	
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}	
	
	
	@Override
	public String toString() {
		return "MemberCommand [id=" + id + ", name=" + name + ", nick=" + nick + ", email=" + email + ", thumbnail="
				+ thumbnail + ", mpoint=" + mpoint + ", fkey=" + fkey + ", gkey=" + gkey + ", password=" + password
				+ "]";
	}

	// json 형태 출력
	public String toJSON() {
		
		String[] MEMBER = {
				"id",		// 아이디
				"name",		// 이름
				"nick",		//닉네임
				"email",	//이메일
				"thumbnail",//섬네일(등록사진)
				"mpoint",	//회원포인트
				"fkey",		//페이스북 로그인 인증키
				"gkey"		//구글 로그인 인증키
		};
		
		Object[] values = {
				id,
				name,
				nick,
				email,
				thumbnail,
				mpoint,
				fkey,
				gkey
		};
		
		String result = "{";
		for(int i = 0; i < MEMBER.length; i++){
			result += "\"" + MEMBER[i] + "\" : \"" + String.valueOf(values[i]) + "\"" + (i >= MEMBER.length - 1 ? "" : ", ");
		}
		result += "}";
		
		return result;
	}
	
	
	public String toItemJSON() {
		
		String[] MEMBER = {
				"nick",		//닉네임
				"thumbnail",//섬네일(등록사진)
				"mpoint"	//회원포인트
		};
		
		Object[] values = {
				nick,
				thumbnail,
				mpoint
		};
		
		String result = "{";
		for(int i = 0; i < MEMBER.length; i++){
			result += "\"" + MEMBER[i] + "\" : \"" + String.valueOf(values[i]) + "\"" + (i >= MEMBER.length - 1 ? "" : ", ");
		}
		result += "}";
		
		return result;
	}
}
