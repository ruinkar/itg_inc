<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 정상적으로 데이터 입력 -->
<c:if test="${check}">
<!-- content="대기시간;이동할 페이지" -->
	<meta http-equiv="Refresh" content="0;url=list.do?pageNum=${pageNum}">
</c:if>
<c:if test="${!check}">
	<script>
	alert('올바른 암호를 입력하세요');
	history.back();
	</script>
</c:if>
