<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp<br>
<%String rowcheckArr[] = request.getParameterValues("rowcheck"); %>
rowcheckArr.length : <%= rowcheckArr.length%>
<%String temp="";
for(int i=0; i<rowcheckArr.length;i++){
	temp += rowcheckArr[i]+" ";
}
%><br>
temp : <%=temp %>

<jsp:useBean id="sdao" class="mypkg.StudentDao"/>
<%int checkedDelete = sdao.checkedDelete(rowcheckArr); 

String msg;
String url = "select.jsp";
if(checkedDelete>0){
	msg ="삭제되었습니다.";	
}else{
	msg ="삭제가 실패 되었습니다.";		
}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>



















<%-- <%String rowcheckArr[] = request.getParameterValues("rowcheck");
String temp="";
for(int i=0;i<rowcheckArr.length;i++){
	temp += rowcheckArr[i]+" ";
}

System.out.println(temp);
%>
<jsp:useBean id="sdao" class="mypkg.StudentDao"/>

<% int deleteCheckedData = sdao.deleteCheckedData(rowcheckArr); 

out.print(deleteCheckedData);
%> --%>
<%-- <%

String msg;
String url;
if(deleteCheckedData>0){
	msg ="삭제성공";
	url = "select.jsp";	
}
else{
	msg ="삭제실패";
	url = "select.jsp";
}
%>

<script type="text/javascript">

	alert("<%=msg%>");
	location.href = "<%=url%>";

</script>
 --%>