package inc.itgbbs.domain;

import org.apache.ibatis.type.Alias;

/**
 * review(후기게시판) 테이블의 DTO 클래스
 * @author oh
 * 
 * enum -> evnum으로 수정
 */

@Alias("ReviewDTO")
public class ReviewDTO {

	private int anum;	//게시물번호
	private int evnum;	//행사번호
	private float rating;	//평가점수
	
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
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ReviewDTO [anum=" + anum + ", evnum=" + evnum + ", rating=" + rating + "]";
	}
	
	
	
	// json 형태로 출력
	public String toJSON() {

		String[] REVIEW = { 
				"anum", // 게시물번호
				"evnum", // 행사번호
				"rating" // 평가점수
		};
		
		Object[] values = {
				anum,
				evnum,
				rating
		};
		
		String result = "{";
		for(int i = 0; i < REVIEW.length; i++){
			result += "\"" + REVIEW[i] + "\" : \"" + String.valueOf(values[i]) + "\"" + (i >= REVIEW.length - 1 ? "" : ", ");
		}
		result += "}";
		
		return result;
	}
}
