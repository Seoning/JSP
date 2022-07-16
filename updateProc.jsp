<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="sb" class="mypkg.StudentBean" />
<jsp:setProperty property="*" name="sb" />

<jsp:useBean id="sdao" class="mypkg.StudentDao" />

<%String[] hobbyArr = request.getParameterValues("hobby");
	String temp="";
	if(hobbyArr == null){
		temp="선택한 항목 없음";
	}
	else{
		for(int i=0;i<hobbyArr.length;i++){
			temp+=hobbyArr[i]+" "; //temp=수영,게임
					
		}
	}
	sb.setHobby(temp);
	int sum  = sb.getC() + sb.getJava() + sb.getJsp();
	sb.setSum(sum);
	System.out.println(sb.getHobby());
%>

<%
    int update = sdao.updateStu(sb);
    
    String msg;
    if(update>0){
    	msg ="수정성공";
    	response.sendRedirect("select.jsp");
    }
    else{
    	msg ="수정실패";
    	response.sendRedirect("updateForm.jsp");
    }
    
    %>
