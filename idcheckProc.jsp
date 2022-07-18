<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String userid = request.getParameter("userid");
System.out.println("userid:"+userid);
%>
<jsp:useBean id="mdao" class="mypkg.MovieDao"/>
<%boolean idcheck = mdao.idCheck(userid);
String str=null;
if(idcheck==true){
	str="N";
	out.print(str);
}else{
	str="Y";
	out.print(str);
	
}
System.out.println("str: "+str);
%>

