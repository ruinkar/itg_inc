package legacy.model;

import java.sql.Timestamp;

/**
 * event(행사게시판) 테이블의 DTO 클래스
 * 
 * @author oh
 * 
 *         enum -> evnum으로 수정
 */

public class EventDTO {

	private int evnum; // 행사번호
	private int eperm; // 행사승인
	private String host; // 주최자
	private String ename; // 행사명
	private Timestamp begin; // 행사시작일
	private Timestamp end; // 행사종료일
	private String location; // 행사위치
	private String eimg; // 행사이미지
	private double lat; // 위도
	private double lng; // 경도

	public int getEvnum() {
		return evnum;
	}

	public void setEvnum(int evnum) {
		this.evnum = evnum;
	}

	public int getEperm() {
		return eperm;
	}

	public void setEperm(int eperm) {
		this.eperm = eperm;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public Timestamp getBegin() {
		return begin;
	}

	public void setBegin(Timestamp begin) {
		this.begin = begin;
	}

	public Timestamp getEnd() {
		return end;
	}

	public void setEnd(Timestamp end) {
		this.end = end;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getEimg() {
		return eimg;
	}

	public void setEimg(String eimg) {
		this.eimg = eimg;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	// json 형태 출력
	public String toJSON() {

		String[] EVENT = { "evnum", // 행사번호
				"eperm", // 행사승인
				"host", // 주최자
				"ename", // 행사명
				"begin", // 행사시작일
				"end", // 행사종료일
				"location", // 행사위치
				"eimg", // 행사이미지
				"lat", // 위도
				"lng" // 경도
		};

		Object[] values = { evnum, // 행사번호
				eperm, // 행사승인
				host, // 주최자
				ename, // 행사명
				begin, // 행사시작일
				end, // 행사종료일
				location, // 행사위치
				eimg, // 행사이미지
				lat, // 위도
				lng // 경도
		};

		String result = "{";
		for (int i = 0; i < EVENT.length; i++) {
			result += "\"" + EVENT[i] + "\" : \"" + String.valueOf(values[i]) + "\""
					+ (i >= EVENT.length - 1 ? "" : ", ");
		}
		result += "}";

		return result;
	}
}
