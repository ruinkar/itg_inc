<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.error_class {
    color: #ff0000;
    overflow-y: hidden;
    height: 1.5em;
}
</style>

<script>
$(function(){
	$("textarea[name=acontent]").summernote({
		height: 500
	});
});
</script>

<center><b>글수정</b>
<br>
<form:form method="post" enctype="multipart/form-data" name="writeForm" 
           action="updateForm.do?anum=${article.anum}&pageNum=${pageNum}" 
           modelAttribute="command">
<%-- <input type="hidden" size="10" maxlength="10" name="anum" value="${article.anum}">
<input type="hidden" size="10" maxlength="10" name="pageNum" value="${pageNum}">
<input type="hidden" size="10" maxlength="10" name="writer" value="${article.writer}"></td>
 <input type="hidden" name="afile" value="${article.afile}">
 --%>
<form:hidden path="anum"/>
<form:hidden path="writer"/>
<form:hidden path="afile"/>
<table width="400" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center" class="table table-bordered table-hover">
  <tr>
                    
                    <td width="70" bgcolor="#b0e0e6" align="center">이 름</td>
                    <td width="330">${command.writer}
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">제 목</td>
                    <td width="330">
                        <!-- 신규 게시물 --> 
                        <div class="col-xs-4">
                        <%-- <input  class="form-control" type="text" size="40" maxlength="50"name="title" value="${article.title}"> --%>
                        <form:input path="title"  cssClass="form-control" />
                        </div>
                        <div class="col-xs-4">
                        <form:errors path="title" cssClass="error_class" element="div"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">행사명</td>
                    <td width="330">
                        <!-- 신규 게시물 -->
                        <div class="col-xs-4"> 
                        <%-- <input  class="form-control" type="text" size="40" maxlength="50" name="evtitle" value="${article.evtitle}"> --%>
                        <form:input readonly="true" path="evtitle"  cssClass="form-control" />
                       </div>
                        <%-- <input  class="form-control" type="hidden" size="40" maxlength="50" name="evnum" value="${article.evnum}"> --%>
                        <form:hidden path="evnum"  cssClass="form-control" />
                        <div class="col-xs-4">
                        <input  class="form-control" type="button" value="행사찾기" onClick="eventCheck()">
                        </div>
                        <div class="col-xs-4"> 
                        <form:errors path="evnum" cssClass="error_class" element="div"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">태그</td>
                    <td width="330">
                        <!-- 신규 게시물 --> 
                       <div class="col-xs-2">
                        <!-- <input class="form-control" type="text" size="5" maxlength="5" name="tag1"> -->
                        <form:input path="tag1" cssClass="form-control"/>
                    </div>
                    <div class="col-xs-2">
                        <!-- <input class="form-control" type="text" size="5" maxlength="5"
                            name="tag2"> -->
                        <form:input path="tag2" cssClass="form-control"/>
                    </div>
                    <div class="col-xs-2">
                        <!-- <input class="form-control" type="text" size="5" maxlength="5"
                            name="tag3"> -->
                        <form:input path="tag3" cssClass="form-control"/>
                    </div>
                    <div class="col-xs-2">
                        <!-- <input class="form-control" type="text" size="5" maxlength="5"
                            name="tag4"> -->
                        <form:input path="tag4" cssClass="form-control"/>
                    </div>
                    <div class="col-xs-2">
                        <!-- <input class="form-control" type="text" size="5" maxlength="5"
                            name="tag5"> -->
                        <form:input path="tag5" cssClass="form-control"/>
                    </div>

                    </td>
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">점수</td>
                    <td width="330">
                    
                    <%-- <input  class="form-control" type="text" size="8" maxlength="12" name="rating" value="${article.rating}"> --%>
                    <%-- <input id="input-21b" name="rating" value="${article.rating}" type="number" class="rating" min=0 max=5 step=0.1 data-size="lg"> --%>
                    <%-- <input id="rating" name="rating" value="${article.rating}" > --%>
                    <form:input path="rating"  data-show-clear="false"  class="rating rating-loading" type="text" data-min="0" data-max="5" data-step="0.1" data-size="lg" />
                    <form:errors path="rating" cssClass="error_class" element="div"/>
                    </td>
                    
                    
                </tr>

                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">내 용</td> 
                    <td width="330"><div class="col-xs-12">
                    <form:errors path="acontent" cssClass="error_class" element="div"/>
                    <%-- <textarea  class="form-control" name="acontent" rows="13" cols="40">${article.acontent}</textarea> --%>
                    <form:textarea path="acontent" cssClass="form-control" />
                    </div>
                    </td>
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">첨부파일</td>
                    <td width="330">
                    <div class="col-xs-4">
                    <input  class="form-control" type="file" name="upload">
                    </div>
				    <c:if test="${!empty command.afile }">
				        (${command.afile })파일이 등록되어 있습니다.<br>
				    </c:if>
    
                </tr>
  <tr>      
   <td colspan=2 bgcolor="#b0e0e6" align="center"> 
     <input type="submit" value="글수정" >
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='list.do?pageNum=${pageNum}'">
   </td>
 </tr>
 </table>
</form:form>     
  
