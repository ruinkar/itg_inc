<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
div#leftMenu {
width:200px;
height:700px;
float:left;
}
div#mainContent {
width:600px;
height:1500px;
float:left;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>EventMain</title>
</head>
<body>
<div id="leftMenu">
	<input type="button" style="width:120px; height:120px; background-color:hotpink" name="postButton" value="포스트형" onclick=""/>
	<input type="button" style="width:120px; height:120px; background-color:lime" name="calendarButton" value="달력형" onclick=""/>
	<input type="button" style="width:120px; height:120px; background-color:cyan" name="mapButton" value="지도형" onclick=""/>
</div>
<div id="mainContent">
	<img src="../images/fonz2.png" style="width:560px; height:400px"></img>
	<br>
	<div>
		<table width="200px" height="200px" border="0" bgcolor="green">
		</table>
	</div>
	<div>
		<table width="200px" height="200px" border="0" bgcolor="yellow" align="left">
		</table>
	</div>
</div> 
</body>
</html>
