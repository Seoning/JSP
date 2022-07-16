<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="sdao" class="mypkg.StudentDao"/> 
    
<%
	String userid = request.getParameter("userid");
	System.out.println("userid:" + userid); // choi
	
	boolean isCheck = sdao.searchId(userid); // 있다(true) 없다.(false)
	System.out.println("isCheck:" + isCheck); // choi
	String str;
	if(isCheck){ // 이미 존재하면
		str = "NO";
		out.print(str); 
	}
	else{ // 존재하지 않으면
		str = "YES";
		out.print(str);
	}
	System.out.print("str:"+str);
%>