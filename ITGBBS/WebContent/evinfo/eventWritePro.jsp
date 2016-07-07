<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="base.model.*, java.sql.Timestamp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");
%>

<%-- <jsp:useBean id="article" class="base.model.EventDTO"/>
<jsp:setProperty name="article" property="*"/> --%>
<%-- <jsp:setProperty property="location" name="article" value="aas"/> --%>

<%
	/* 	System.out.println(article.geteName()); */
/*일반 게시판 테이블*/
	BDTO bDTO = new BDTO();

	/* int aNum = 888;
	bDTO.setaNum(aNum); */
	
	String writer = "aaa";
	bDTO.setWriter(writer);
	
	int category = 1;
	bDTO.setCategory(category);
	
	Timestamp aDate = new Timestamp(System.currentTimeMillis());
	bDTO.setaDate(aDate);
	
	String ip = request.getRemoteAddr();
	bDTO.setIp(ip);
	
	String title = request.getParameter("title");
	bDTO.setTitle(title);
	
	String aContent = request.getParameter("aContent");
	bDTO.setaContent(aContent);
	
	String aFile = "test";
	bDTO.setaFile(aFile);
	
	int readCount = 0;
	bDTO.setReadCount(readCount);
	
	String tag1 = request.getParameter("tag1");
	bDTO.setTag1(tag1);
	
	String tag2 = request.getParameter("tag2");
	bDTO.setTag2(tag2);
	
	String tag3 = request.getParameter("tag3");
	bDTO.setTag3(tag3);
	
	String tag4 = request.getParameter("tag4");
	bDTO.setTag4(tag4);
	
	String tag5 = request.getParameter("tag5");
	bDTO.setTag5(tag5);
	
	int pNum = 0;
	bDTO.setpNum(pNum);
	
	System.out.println("anum = " + bDTO.getaNum() + "\n" +
	"writer = " + bDTO.getWriter() + "\n" +
	"category = " + bDTO.getCategory() + "\n" +
	"adate = " + bDTO.getaDate() + "\n" +
	"ip = " + bDTO.getIp() + "\n" + 
	"title = " + bDTO.getTitle() + "\n" +
	"acontent = " + bDTO.getaContent() + "\n" + 
	"afile = " + bDTO.getaFile() + "\n" +
	"readcount = " + bDTO.getReadCount() + "\n" + 
	"tag1 = " + bDTO.getTag1() + "\n" +
	"tag2 = " + bDTO.getTag2() + "\n" +
	"tag3 = " + bDTO.getTag3() + "\n" +
	"tag4 = " + bDTO.getTag4() + "\n" +
	"tag5 = " + bDTO.getTag5() + "\n" +
	"pnum = " + bDTO.getpNum() + "\n");
	
	BDAO board = new BDAO();
	board.insertBoard(bDTO);
	
/*행사게시판 테이블*/	
	EventDTO eventDTO = new EventDTO();

	/* int evNum = aNum;
	eventDTO.setEvNum(evNum); */
	
	int epErm = 100;
	eventDTO.setEpErm(epErm);
	
	String host = request.getParameter("host");
	eventDTO.setHost(host);
	
	String eName = request.getParameter("eName");
	eventDTO.seteName(eName);
	
	Timestamp begin = new Timestamp(System.currentTimeMillis());
	eventDTO.setBegin(begin);
	
	Timestamp end = new Timestamp(System.currentTimeMillis());
	eventDTO.setEnd(end);
	
	String location = request.getParameter("location");
	eventDTO.setLocation(location);
	
	String eImg = request.getParameter("eImg");
	eventDTO.seteImg("test");

	double lat = 37.444;
	eventDTO.setLat(lat);

	double lng = 41.522;
	eventDTO.setLng(lng);

	System.out.println("evNum = " + eventDTO.getEvNum() + "\n" + "eperm = " + eventDTO.getEpErm() + "\n"
			+ "host = " + eventDTO.getHost() + "\n" + "ename = " + eventDTO.geteName() + "\n" + "begin = "
			+ eventDTO.getBegin() + "\n" + "end = " + eventDTO.getEnd() + "\n" + "location = "
			+ eventDTO.getLocation() + "\n" + "eImg = " + eventDTO.geteImg() + "\n" + "lat = "
			+ eventDTO.getLat() + "\n" + "lng = " + eventDTO.getLng());

	EventDAO event = new EventDAO();
	event.insertEvent(eventDTO);

	response.sendRedirect("eventMain.jsp");
%>
