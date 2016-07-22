<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script language="JavaScript">

  function deleteSave(){	
	
	return true;
  }

</script>

<center><b>글삭제</b>
<br>
<form method="POST" name="delForm"  action="deleteForm.do" 
   onsubmit="return deleteSave()"> 
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center  bgcolor="#b0e0e6">
  </tr>
  <tr height="30">
	   <td><input type="hidden" name="anum" value="${anum}"></td>
	   <td><input type="hidden" name="pageNum" value="${pageNum}"></td>
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

