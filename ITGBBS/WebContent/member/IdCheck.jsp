<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="member.*" %> 
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID중복을 체크</title>
<link href="style.css" rel="stylesheet"
         type="text/css">
</head>
<body bgcolor="#5d2c96">
  <%
    //xhr객체가 받을 xml형태로 받을 수있도록
    response.setContentType
                    ("text/xml;charset=utf-8");
    String outString="";
    boolean result=false;//중복id체크유무
    String id=request
                        .getParameter("id");
    //System.out.println("id받은값 출력"+id);
    //메서드 호출
    MemberDAO memMgr=
                          new MemberDAO();
    result=memMgr.checkId(id);
    System.out.println("result="+result);
    //---------------------------------------
    if(result==true){
    	outString="<font color='red'><b>"+
       "이미 사용중인 아이디입니다</b></font>";
    }else{//사용가능한 아이디 인경우
    	outString="<font color='blue'><b>"+
       "사용이 가능한 아이디입니다</b></font>";
    }
    //---------------------------------------
    out.println(outString);//전송
    System.out.println
                     ("outString="+outString);
  %>
</body>
</html>
