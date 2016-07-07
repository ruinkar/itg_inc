package base.model;

import java.sql.Timestamp;

//행사게시판 필드들
public class EventDTO {
	private int evNum;				//행사번호
	private int epErm;				//행사승인
	private String host;				//주최자
	private String eName;			//행사명
	private Timestamp begin;		//행사시작일
	private Timestamp end;		//행사종료일
	private String location;		//행사위치
	private String eImg;			//행사이미지
	private double lat;				//위도
	private double lng;			//경도
	
	public int getEvNum() {
		return evNum;
	}
	public void setEvNum(int evNum) {
		this.evNum = evNum;
	}
	public int getEpErm() {
		return epErm;
	}
	public void setEpErm(int epErm) {
		this.epErm = epErm;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
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
	public String geteImg() {
		return eImg;
	}
	public void seteImg(String eImg) {
		this.eImg = eImg;
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
	
	
	
	
	
	
	
	

}
