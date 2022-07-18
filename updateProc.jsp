<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="fb" class="mypkg.FriendsBean"/>
<jsp:setProperty property="*" name="fb"/>
<jsp:useBean id="fdao" class="mypkg.FriendsDao"/>
<%int update = fdao.update(fb);

String msg;
String url;

if(update>0){
	msg ="수정성공";
	url ="select.jsp";
}else{
	msg ="수정실패";
	url ="updateForm.jsp";
	
}

%>

<script type="text/javascript">

	alert("<%=msg%>");
	location.href="<%=url%>";
</script>