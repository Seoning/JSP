<%@page import="mypkg.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<style>
tr:first-child {
	background-color: lightblue;
}
table{
	border: dashed green;
	margin: auto;
	text-align: center;
}

</style>

<script type="text/javascript">
	function allChecked(){
		//alert(1);
		//alert(myform.rowcheck.length);
		//ac = document.myform.allCheck.checked;
		//rc = document.myform.rowcheck;
		if(myform.allCheck.checked){
			for(i=0; i<myform.rowcheck.length;i++){
				myform.rowcheck[i].checked = true;
			}
		}else{
			for(i=0; i<myform.rowcheck.length;i++){
				myform.rowcheck[i].checked = false;
			}
		}
	}//allChecked
	
	function deleteChecked(){
		//alert(2);
		flag = false;
		for(i=0;i<myform.rowcheck.length;i++){
			if(myform.rowcheck[i].checked){
				flag = true;
				return true;
			}
		}
		if(!flag){
			alert("적어도 하나의 레코드는 선택하세요.");
			return false;
		}
	}//deleteChecked()

	function insert(){
		//alert(3);
		location.href="insertForm.jsp";
	}//insert()

</script>
<jsp:useBean id="sdao" class="mypkg.StudentDao"/>

<%ArrayList<StudentBean> list = sdao.selectAll(); %>
<form name="myform" action="deleteAll.jsp">
<table border="1">
	<tr>
	<th><input type="checkbox" name="allCheck" onClick="allChecked()"></th>
	<td>번호</td>
	<td>아이디</td>
	<td>패스워드</td>
	<td>이름</td>
	<td>연도</td>
	<td>월</td>
	<td>일</td>
	<td>취미</td>
	<td>c언어</td>
	<td>java</td>
	<td>jsp</td>
	<td>sum</td>
	<td>수정</td>
	<td>삭제</td>
	</tr>

<%for(int i=0;i<list.size();i++){ //for(StudentBean sb : int x)
	StudentBean sb = list.get(i);
%>
<tr>
<td><input type="checkbox" name="rowcheck" value="<%=sb.getNum() %>"></td>
<td><%=sb.getNum() %></td>
<td><%=sb.getId() %></td>
<td><%=sb.getPasswd() %></td>
<td><%=sb.getName() %></td>
<td><%=sb.getYear() %></td>
<td><%=sb.getMonth() %></td>
<td><%=sb.getDay() %></td>
<td><%=sb.getHobby()%></td>
<td><%=sb.getC() %></td>
<td><%=sb.getJava() %></td>
<td><%=sb.getJsp() %></td>
<td><%=sb.getSum()%></td>
<td><a href="updateForm.jsp?num=<%=sb.getNum() %>">수정</a></td>
<td><a href="deleteProc.jsp?num=<%=sb.getNum() %>">삭제</a></td>
</tr>
<% }%>
</table><br>
<input type="button" value="삽입" onclick="insert()">
<input type="submit" value="삭제" onclick="return deleteChecked()">
</form>