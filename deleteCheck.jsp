<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteCheck.jsp<br>
<%request.setCharacterEncoding("UTF-8");
String[] rowcheckArr = request.getParameterValues("rowcheck");
String temp="";
for(int i=0;i<rowcheckArr.length;i++){
	temp += rowcheckArr[i]+" ";
}

System.out.println(temp);
%>

<jsp:useBean id="mdao" class="mypkg.MovieDao"/>

<%int deleteCheck = mdao.deleteCheck(rowcheckArr);

String msg;
String 	url = "select.jsp";
if(deleteCheck>0){
	msg = "삭제 성공";
}else{
	msg = "삭제 실패";
}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>