package model;

import java.sql.Timestamp;

/**
 * event(행사게시판) 테이블의 DTO 클래스
 * @author oh
 * 
 * enum -> evnum으로 수정 
 */


public class EventDTO {

	private int evnum;	//행사번호
	private int eperm;	//행사승인
	private String host;	//주최자
	private String ename;	//행사명
	private Timestamp begin;	//행사시작일
	private Timestamp end;	//행사종료일
	private String location;	//행사위치
	private String eimg;	//행사이미지
	private int  lat;	//위도
	private int  lng;	//경도

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
	public void setBeign(Timestamp begin) {
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
	public int getLat() {
		return lat;
	}
	public void setLat(int lat) {
		this.lat = lat;
	}
	public int getLng() {
		return lng;
	}
	public void setLng(int lng) {
		this.lng = lng;
	}	
	 

}
