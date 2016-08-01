package inc.itgbbs.domain;

import java.sql.Timestamp;

/**
 * likelist(추천수관리) 테이블의 DTO 클래스
 * @author son
 */

public class LikeListDTO {
	private int lnum; //추천번호
	private String id; //아이디
	private Timestamp likedate; //추천일
	private int anum; // 게시물번호
	
	public int getLnum() {
		return lnum;
	}
	
	public void setLnum(int lnum) {
		this.lnum = lnum;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public Timestamp getLikedate() {
		return likedate;
	}
	
	public void setLikedate(Timestamp likedate) {
		this.likedate = likedate;
	}
	
	public int getAnum() {
		return anum;
	}
	
	public void setAnum(int anum) {
		this.anum = anum;
	}
}
