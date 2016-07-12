package com.board.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardCommand {

	private int seq;//게시물번호
	private String writer;//작성자
	private String title;//제목
	private String content;//글내용
	private String pwd;//암호
	private int hit;//조회수
	private Date regdate;//자료올린 날짜
	//파일업로드->관련된 클래스 객체를 선언
	private MultipartFile upload;//업로드된 정보
	//--------------------------------------------
	private String filename;//업로드할 파일명
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	//업로드된 파일의 정보를 얻어오기
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("setUpload()호출됨!");
	}
	public String getFilename() {
		return filename;
	}
	//업로드한 파일명이 저장
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
    @Override
    public String toString() {
    	// TODO Auto-generated method stub
    	return "BoardCommand[seq="+seq+",writer="+writer+",title="
    			+title+",content="+content+",pwd="+pwd+",hit="
    			+hit+",regdate="+regdate+",upload="+upload
    			+",filename="+filename+"]";
    }
}



