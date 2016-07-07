<%@page import="model.BoardDTO"%>
<%@page import="model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//Register.jsp->ZipCheck()->
//ZipCheck.jsp?check=y
 request.setCharacterEncoding("utf-8");

String check=request.
                           getParameter("check");
String event=request.
                           getParameter("evdata"); 
//검색된 값을 받아옴
ReviewDAO rvdao=new ReviewDAO();
Vector<BoardDTO> evList=rvdao.evRead(event);
int totalList=evList.size();
System.out.println("검색된수="+totalList);
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트 검색</title>
<link href="style.css" rel="stylesheet"
         type="text/css">
<script language="JavaScript" src="script.js"></script>
<script>
function sendevent(evTitle , evNum){
	//우편번호에 대입
	//opener->부모창을 가리키는 예약어
	//opener.document.폼객체명.입력양식.value=값;
	opener.document.writeForm.
	evnum.value=evNum;
	opener.document.writeForm.
	evtitle.value=evTitle;
	//자식창(우편번호검색창)
	self.close();
	}

</script>
</head>
<body bgcolor="#FFFFCC">
  <center>
    <b>행사 찾기</b>
    <table>
    <!--ZipCheck.jsp?area3='미아2동'&check=n  -->
   <form name="evForm" method="post"
             action="eventCheck.jsp">
        <tr>
        <td><br>
        행사정보 입력:<input type="text"
                                    name="evdata">
        <input type="button" value="검색"
                   onclick="evCheck()">
        </td>
        </tr>    
        <!-- 특정jsp에 매개변수를 전달 -->
        <input type="hidden" name="check"
                                          value="n">
   </form>
  <!-- 검색버튼을 눌렀다면 -->
  <% if(check.equals("n"))  { 
	       //찾은 레코드가 없다면 //zipcodeList.size()==0
           if(evList.isEmpty()) {  %>
      <tr><td align="center">
            <br>검색된 레코드가 없습니다.
          </td>
      </tr>
   <%  }else { %>
   <tr><td align="center"><br>
   *검색후 ,아래 행사명을 클릭하면 자동으로
     입력됩니다</td></tr>
  <%
    for(int i=0;i<totalList;i++){
     BoardDTO bdbean=
    		        evList.elementAt(i);
     String evData=bdbean.getTitle();
     int evNum =bdbean.getAnum();
       %>
  <tr><td>
  <a href="JavaScript:sendevent('<%=evData%>',
                                                    '<%=evNum%>')">
  <%=evData%>&nbsp;
  </a><br>
  <% 
            }//for
         }//inner if
       }//outer if
   %>
    </td></tr>
    <tr><td align="center"><br>
<a href="JavaScript:this.close()">닫기</a>                      
    </table>
  </cente>
</body>
</html>