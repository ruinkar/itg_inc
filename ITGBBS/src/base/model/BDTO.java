package base.model;

import java.sql.Timestamp;

//게시판 → 공지사항, 자유게시판, 답변형게시판, 파일첨부형 게시판
public class BDTO {
	
	// ~ 일반 자유게시판 항목
	private int aNum;				// 게시물 번호
	private String writer;			// 작성자(계정 이름)
	private int category; 			// 카테고리
	private Timestamp aDate; 	// 작성날짜
	private String ip;				// ip
	private String title;				// 제목
	private String aContent;		// 글내용
	private String aFile;			// 첨부파일
	private int readCount;			// 조회수
	private String tag1;			// 태그1
	private String tag2;			// 태그2
	private String tag3;			// 태그3
	private String tag4;			// 태그4
	private String tag5;			// 태그5
	private String pNum;			// 대상글번호
	
	
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public Timestamp getaDate() {
		return aDate;
	}
	public void setaDate(Timestamp aDate) {
		this.aDate = aDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getaFile() {
		return aFile;
	}
	public void setaFile(String aFile) {
		this.aFile = aFile;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}
	public String getTag4() {
		return tag4;
	}
	public void setTag4(String tag4) {
		this.tag4 = tag4;
	}
	public String getTag5() {
		return tag5;
	}
	public void setTag5(String tag5) {
		this.tag5 = tag5;
	}
	public String getpNum() {
		return pNum;
	}
	public void setpNum(String pNum) {
		this.pNum = pNum;
	}

	
	
}
