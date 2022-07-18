<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="fb" class="mypkg.FriendsBean"/>
<jsp:setProperty property="*" name="fb"/>

<jsp:useBean id="fdao" class="mypkg.FriendsDao"/>
<%int insertFriends = fdao.insertFriends(fb); 

String msg;
String url;
if(insertFriends>0){
	msg = "가입성공";
	url ="select.jsp";
}else{
	msg = "가입실패";
	url ="insertForm.jsp";
}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href = "<%=url%>";
</script>

