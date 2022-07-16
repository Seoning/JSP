<%@page import="mypkg.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num")); 
%>

<jsp:useBean id="sdao" class="mypkg.StudentDao"/>

<%StudentBean sb = sdao.getStuByNum(num); 
System.out.println(sb.getNum());
%>


<body>
	<h2>회원수정 insertForm.jsp</h2>
	<form action="updateProc.jsp" method="post">
		<input type="hidden" name="num" value="<%=sb.getNum()%>"><br>
		아이디 : <input type="text" name="id" value="<%=sb.getId()%>"><br><br>  
		비밀번호 :
		<input type="password" name="passwd" value="<%=sb.getPasswd()%>"><br><br>  
		이름
		: <input type="text" name="name" value="<%=sb.getName()%>"><br><br>  
		생년월일 :
		<select name="year">
			<!-- <option value="2013">2013</option>
			<option value="2012">2012</option>
			<option value="2011">2011</option>
			<option value="2010">2010</option>
			<option value="2009">2009</option>
			<option value="2008">2008</option>  -->
			
			<%
				for(int i=2022;i>=1930; i--){
			%>					
					<option value="<%=i%>" <%if(sb.getYear() == i){ %> selected <%} %>><%=i%></option>
			<%					
				}//for
			%>
			
		</select> 년 
		
		<select name="month">
			<!-- <option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option> -->
			<%
				//1월 ~ 12월
				for(int i=1; i<=12; i++) {
			%>
					<option value="<%=i%>" <%if(sb.getMonth() == i){ %> selected <%} %>><%=i%></option>
			<%
				}
			%>
		</select> 월
		
		<select name="day">
               <!--  <option value = "1">1</option>
                <option value = "2">2</option>
                <option value = "3">3</option>
                <option value = "4">4</option>
                <option value = "5">5</option>  
                <option value = "6">6</option> -->
              <%
				for(int i=1; i<=31; i++){
				%>
					<option value="<%=i%>" <%if(sb.getDay() == i){ %> selected <%} %>><%=i%></option>
				<%
				}//for()
				%>
                
            </select> 일 <br>

		<br> 취미 : 
		
		
		<input type="checkbox" name="hobby" value="달리기" <%if(sb.getHobby().contains("달리기")){ %> checked <%} %>>달리기
		<input type="checkbox" name="hobby" value="수영" <%if(sb.getHobby().contains("수영")) { %> checked <%} %>>수영 
		<input type="checkbox" name="hobby" value="게임" <%if(sb.getHobby().contains("게임")) { %> checked <%} %>>게임 
		<input type="checkbox" name="hobby" value="영화" <%if(sb.getHobby().contains("영화")) { %> checked <%} %>>영화<br> <br><br>
		
		
		[점수입력]<br> 
		C언어 : 	<input type="text" name="c" size="10" value="<%=sb.getC()%>">
		JAVA : <input type="text" name="java" size="10" value="<%=sb.getJava()%>">
		JSP : <input type="text" name="jsp" size="10" value="<%=sb.getJsp()%>"><br><br>  
		<input type="submit" value="수정하기">
	</form>

</body>
