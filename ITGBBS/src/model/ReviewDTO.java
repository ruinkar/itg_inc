package model;

/**
 * review(후기게시판) 테이블의 DTO 클래스
 * @author oh
 * 
 * enum -> evnum으로 수정
 */


public class ReviewDTO {

	private int anum;	//게시물번호
	private int evnum;	//행사번호
	private int rating;	//평가점수
	
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public int getEvnum() {
		return evnum;
	}
	public void setEvnum(int evnum) {
		this.evnum = evnum;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	
}
