<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${check}">
	<meta http-equiv="Refresh" content="0;url=list.do">
</c:if>

<c:if test="${!check}">
	<script>
		alert("통신 상의 문제로 게시글을 삭제할 수 없습니다.\n 관리자에게 문의해주세요.");
		history.go(-1);
	</script>
</c:if>