package model;

import java.sql.Timestamp;

/**
 * board(게시판) 테이블의 DTO 클래스
 * @author oh
 */

public class BoardDTO {
	private int anum; //게시물번호
	private String writer; //작성자
	private int category;	//카테고리
	private Timestamp adate; //작성날짜
	private String ip; //ip 
	private String title;	//제목
	private String acontent;//글내용
	private String afile;	//첨부파일
	private int readcount;//조회수
	private String tag1; //태그1
	private String tag2; //태그2
	private String tag3;//태그3
	private String tag4; //태그4
	private String tag5;//태그5
	private int pnum; //대상글번호
	
	
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
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
	public Timestamp getAdate() {
		return adate;
	}
	public void setAdate(Timestamp adate) {
		this.adate = adate;
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
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getAfile() {
		return afile;
	}
	public void setAfile(String afile) {
		this.afile = afile;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
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
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	
	
	
	
	// json 형태로 출력
		public String toJSON() {
			
			String[] BOARD = {
					"anum",		//게시물번호
					"writer",	//작성자
					"category",	//카테고리
					"adate",	//작성날짜
					"ip",		//ip 
					"title",	//제목
					"acontent",	//글내용
					"afile",	//첨부파일
					"readcount",//조회수
					"tag1",		//태그1
					"tag2", 	//태그2
					"tag3",		//태그3
					"tag4",		//태그4
					"tag5",		//태그5
					"pnum"		//대상글번호
			};
			
			Object[] values = {
					anum,		//게시물번호
					writer,		//작성자
					category,	//카테고리
					adate,		//작성날짜
					ip,			//ip 
					title,		//제목
					acontent,	//글내용
					afile,		//첨부파일
					readcount,	//조회수
					tag1,		//태그1
					tag2, 		//태그2
					tag3,		//태그3
					tag4,		//태그4
					tag5,		//태그5
					pnum		//대상글번호
			};
			
			String result = "{";
			for(int i = 0; i < BOARD.length; i++){
				result += "\"" + BOARD[i] + "\" : \"" + String.valueOf(values[i]) + "\"" + (i >= BOARD.length - 1 ? "" : ", ");
			}
			result += "}";
			
			return result;
		}
}
