<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
checkedDelete.jsp<br>

<%String [] rowcheckArr = request.getParameterValues("rowcheck");
String temp="";
for(int i=0;i<rowcheckArr.length;i++){
	temp += rowcheckArr[i]+" ";
}

%>

temp : <%=temp%>

<jsp:useBean id="fdao" class="mypkg.FriendsDao"/>
<%int deleteChecked = fdao.deleteChecked(rowcheckArr);

String msg;
String url = "select.jsp";
if(deleteChecked>0){
	msg ="삭제성공";
}else{
	
	msg ="삭제실패";
}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href ="<%=url%>"

</script>