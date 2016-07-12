<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="legacy.member.*,legacy.model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:if test="${check==1}">
<meta http-equiv="Refresh" content="0;url=/ITGBBS/member/Login2.do?check=${check}">
</c:if>
<c:if test="${check==0}">
<script>
	alert("입력이 잘못되었습니다. \n다시 확인요망");
	history.back()
</script>
</c:if>
