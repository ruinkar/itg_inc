package inc.itgbbs.domain;

import java.sql.Timestamp;
import java.time.Instant;

/**
 * board(게시판) 테이블의 DTO 클래스
 * @author oh
 */

public class BoardCommand {
	private int anum; // 게시물번호
	private int category; // 카테고리
	private Timestamp adate; // 작성날짜
	private String title; // 제목\
	private int pnum; // 대상글번호
	
	private String time; // 경과시간
	
	public String getTime() {
		long result = Timestamp.from(Instant.now()).getTime() - adate.getTime();
		
		
		
		return time;
	}

	public int getAnum() {
		return anum;
	}

	public void setAnum(int anum) {
		this.anum = anum;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		String[] BOARD = {
				"anum",		//게시물번호
				"category",	//카테고리
				"adate",	//작성날짜
				"title",	//제목
				"pnum"		//대상글번호
		};
		
		Object[] values = {
				anum,		//게시물번호
				category,	//카테고리
				adate,		//작성날짜
				title,		//제목
				pnum		//대상글번호
		};
		
		StringBuffer result = new StringBuffer("{");
		for(int i = 0; i < BOARD.length; i++){
			result.append('\"');
			result.append(BOARD[i]);
			result.append("\":\"");
			result.append(String.valueOf(values[i]));
			result.append('\"');
			result.append((i < BOARD.length - 1 ? "," : "}") );
		}
		
		return result.toString();
	}
	
}
