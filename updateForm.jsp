<%@page import="mypkg.FriendsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));

%>
num : <%=num%>
<jsp:useBean id="fdao" class="mypkg.FriendsDao"/>
<%FriendsBean fb = fdao.selectupdate(num); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>닉네임 변경</h3>
<form name="myform" action="updateProc.jsp">
<input type="hidden" size="20" name="num" value="<%=fb.getNum()%>">&nbsp;
<label>nickname : </label>
<input type="text" size="20" name="nickname" value="<%=fb.getNickname()%>">&nbsp;
<input type="submit" value="수정하기">
</form>
</body>
</html>