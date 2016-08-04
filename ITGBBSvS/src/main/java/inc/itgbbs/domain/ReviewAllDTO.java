package inc.itgbbs.domain;

import java.sql.Timestamp;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@Alias("ReviewAllDTO")
public class ReviewAllDTO {

	private int anum;	//게시물번호
	@DecimalMin(value = "1" , message="행사를 검색하세요")
	private int evnum;	//행사번호
	@DecimalMin(value = "0.1" , message="후기 점수는 0.1점 이상 입력하셔야 합니다. ")
	private float rating;	//평가점수
	private String writer; //작성자
	private int category;	//카테고리
	private Timestamp adate; //작성날짜
	private String evtitle;	//title
	private String afile;	//첨부파일
	private int readcount;//조회수
	private String tag1; //태그1
	private String tag2; //태그2
	private String tag3;//태그3
	private String tag4; //태그4
	private String tag5;//태그5
	private int pnum; //대상글번호
	
	private String ip; //ip 
	@NotEmpty (message="제목을 입력하세요.")
	@Length (min=5 , message="제목은 5글자 이상 입력하셔야 합니다.")
	private String title;	//제목
	@NotEmpty (message="내용을 입력하세요.")
	@Length (min=20 , message="내용은 10글자 이상 입력하셔야 합니다.")
//파일업로드->관련된 클래스 객체를 선언
	private String acontent;//글내용
	private MultipartFile upload;//업로드된 정보

	
	/**
	 * @return the upload
	 */
	public MultipartFile getUpload() {
		return upload;
	}
	/**
	 * @param upload the upload to set
	 */
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	/**
	 * @return the evtitle
	 */
	public String getEvtitle() {
		return evtitle;
	}
	/**
	 * @param evtitle the evtitle to set
	 */
	public void setEvtitle(String evtitle) {
		this.evtitle = evtitle;
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
		return "ReviewAllDTO [anum=" + anum + ", evnum=" + evnum + ", rating=" + rating + ", writer=" + writer
				+ ", category=" + category + ", adate=" + adate + ", evtitle=" + evtitle + ", afile=" + afile
				+ ", readcount=" + readcount + ", tag1=" + tag1 + ", tag2=" + tag2 + ", tag3=" + tag3 + ", tag4=" + tag4
				+ ", tag5=" + tag5 + ", pnum=" + pnum + ", ip=" + ip + ", title=" + title + ", acontent=" + acontent
				+ ", upload=" + upload + "]";
	}
	
	
	
}
