<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>

<%
int num = Integer.parseInt(request.getParameter("num"));
System.out.println("num:"+num);
%>
<jsp:useBean id="mdao" class="mypkg.MovieDao"/>
<%int delete = mdao.deleteMovie(num);

String msg;
String 	url = "select.jsp";
if(delete>0){
	msg = "삭제 성공";
}else{
	msg = "삭제 실패";
	
}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>