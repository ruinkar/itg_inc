package model;

import java.sql.Timestamp;

/**
 * msg(쪽지) 테이블의 DTO 클래스
 * @author son
 */

public class MsgDTO {
	private int mnum; //쪽지번호
	private String sid; // 받는사람
	private String rid; // 보내는사람
	private Timestamp mdate; //쪽지작성일
	private String mcontent; // 쪽지내용
	
	public int getMnum() {
		return mnum;
	}
	
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	
	public String getSid() {
		return sid;
	}
	
	public void setSid(String sid) {
		this.sid = sid;
	}
	
	public String getRid() {
		return rid;
	}
	
	public void setRid(String rid) {
		this.rid = rid;
	}
	
	public Timestamp getMdate() {
		return mdate;
	}
	
	public void setMdate(Timestamp mdate) {
		this.mdate = mdate;
	}
	
	public String getMcontent() {
		return mcontent;
	}
	
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	
}
