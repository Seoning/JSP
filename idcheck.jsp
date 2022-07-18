<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String userid = request.getParameter("userid");
System.out.println(userid);
%>
<jsp:useBean id="fdao" class="mypkg.FriendsDao"/>

<%boolean idCheck = fdao.idCheck(userid);
String str=null;
if(idCheck==true){
	str="N";
	out.print(str);
}else{
	str="Y";
	out.print(str);
	
}
System.out.print(str);
%>