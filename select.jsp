<%@page import="mypkg.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table{
		border-color: blue;
		text-align: center;
	}
	tr:first-child{
		background-color: yellow;
	}
</style>
<script type="text/javascript">
 function allchecked(){
	//alert(1);
 	if(myform.allcheck.checked){
 		for(i=0;i<myform.rowcheck.length;i++){
 			myform.rowcheck[i].checked = true;
 		}
 	}else{
 		for(i=0;i<myform.rowcheck.length;i++){
 			myform.rowcheck[i].checked = false;
 		}
 	}
 }//allchecked
 
 function selectCheck(){
	 //alert(2);
	flag = false;
	for(i=0;i<myform.rowcheck.length;i++){
		if(myform.rowcheck[i].checked){
			flag = true;
		}
	}
	if(flag == false){
		alert('삭제할 항목을 선택하세요');
		return false;
	}
 }//selectCheck
 
 function inserting(){
	 location.href = "insertForm.jsp";
 }//inserting
</script>

<jsp:useBean id="mdao" class="mypkg.MovieDao"/>
<%ArrayList<MovieBean> lists = mdao.selectAll();
%>
<form action="deleteCheck.jsp" name="myform">
<input type="submit" value="삭제"  onclick="return selectCheck()">
<input type="button" value="추가" onclick="inserting()">
<table border="1">
<tr>
<th><input type="checkbox" name="allcheck" onclick="allchecked()"></th> <!-- name과 function이름 중복되면 안됨 -->
<td>번호</td>
<td>아이디</td>
<td>이름</td>
<td>나이</td>
<td>좋아하는 장르</td>
<td>즐겨보는 시간대</td>
<td>동반관객수</td>
<td>개선사항</td>
<td>수정</td>
<td>삭제</td>
</tr>

<tr>
<%for(int i=0;i<lists.size();i++){
	MovieBean mb = lists.get(i);
	%>

<td><input type="checkbox" name="rowcheck" value="<%=mb.getNum()%>"></td>
<td><%=mb.getNum()%></td>
<td><%=mb.getId()%></td>
<td><%=mb.getName()%></td>
<td><%=mb.getAge()%></td>
<td><%=mb.getGenre()%></td>
<td><%=mb.getTime()%></td>
<td><%=mb.getPartner()%></td>
<td><%=mb.getMemo()%></td>

<td><a href="updateForm.jsp?num=<%=mb.getNum()%>">수정</a></td>
<td><a href="deleteProc.jsp?num=<%=mb.getNum()%>">삭제</a></td>
	
</tr>
<%} %>
</table>
</form>