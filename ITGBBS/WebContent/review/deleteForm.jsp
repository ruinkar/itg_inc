<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">

  function deleteSave(){	
	
	return true;
  }

</script>
</head>

<body bgcolor="#e0ffff">
<center><b>글삭제</b>
<br>
<form method="POST" name="delForm"  action="deletePro.do?pageNum=${pageNum}" 
   onsubmit="return deleteSave()"> 
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center  bgcolor="#b0e0e6">
  </tr>
  <tr height="30">
     
	   <td><input type="hidden" name="anum" value="${anum}"></td>
 </tr>
 <tr height="30">
    <td align=center bgcolor="<%--=value_c--%>">
      <input type="submit" value="글삭제" >
      <input type="button" value="글목록"
       onclick="document.location.href='list.do?pageNum=${pageNum}'">
   </td>
 </tr>  
</table> 
</form>
</center>
</body>
</html> 