<%@page import="mypkg.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br>

<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
System.out.println("num:"+num);
%>
<jsp:useBean id="mdao" class="mypkg.MovieDao"/>
<%MovieBean mb = mdao.getMovieByNum(num);
System.out.println("id:"+mb.getId());
%>

<body>
<h2>수정 </h2>
	<form action="updateProc.jsp" method="post" name="myform">
		<table border="1" width="700px">
		<tr>
		<input type="hidden" name="num" value="<%=mb.getNum()%>">
			<td>아이디</td>
			<td>
				<input type="text" name="id" value="<%=mb.getId()%>">
			</td>  
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=mb.getName()%>"></td> 
		</tr> 
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" value="<%=mb.getAge()%>"></td> 
		</tr>
		<tr>
			<td>좋아하는 장르</td>
			<td>
				
				<input type="checkbox" name="genre" value="공포" <%if(mb.getGenre().contains("공포")){ %> checked <%} %>>공포
				<input type="checkbox" name="genre" value="다큐" <%if(mb.getGenre().contains("다큐")){ %> checked <%} %>>다큐
				<input type="checkbox" name="genre" value="액션" <%if(mb.getGenre().contains("액션")){ %> checked <%} %>>액션 
				<input type="checkbox" name="genre" value="애니메이션" <%if(mb.getGenre().contains("애니메이션")){ %> checked <%} %>>애니메이션
			</td> 
			
		</tr>

		<tr>
			<td>즐겨보는 시간대</td>
			<td>
				<select name="time">
					<!-- <option value="08~10">08~10</option>
					<option value="10~12">10~12</option>
					<option value="12~14">12~14</option>
					<option value="14~16">14~16</option>
					<option value="16~18">16~18</option>
					<option value="18~20">18~20</option> -->
					
					<%for(int i=8;i<20;i=i+2){
					%>
					<option value="<%=i %>~<%=i+2%>" <%if(mb.getTime().equals(i+"~"+(i+2))){%>selected <%} %>><%=i %>~<%=i+2%></option>
					<% }%>
				</select>
			</td> 
		</tr>
		
		<tr>
			<td>동반 관객수</td>
			<td> 
				 <input type="radio" name="partner" value="1" <%if(mb.getPartner()==1){ %> checked <% }%>>1
				<input type="radio" name="partner" value="2" <%if(mb.getPartner()==2){ %> checked <% }%>>2 
				<input type="radio" name="partner" value="3" <%if(mb.getPartner()==3){ %> checked <% }%>>3 
				<input type="radio" name="partner" value="4" <%if(mb.getPartner()==4){ %> checked <% }%>>4 <br><br>

			</td>
		</tr>
		
		<tr>
			<td>영화관 개선사항</td>
			<td>
				<textarea name="memo" cols="40" rows="3" >value는 여기에 넣기</textarea> 
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="수정하기" id="sub">
			</td>
		</tr>
		</table>
	</form>

</body>