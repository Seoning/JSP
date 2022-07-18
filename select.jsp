<%@page import="mypkg.FriendsBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table{
		text-align: center;
		border-color: lavender;
		margin : auto;
	}	
	tr:first-child {
		background-color: lavender;
	}
	#delete{
		margin-left:20px;
	}
</style>
<script type="text/javascript">
	function allchecked(){
		//alert(2);
		if(document.myform.allcheck.checked){
			for(i=0;i<document.myform.rowcheck.length;i++){
				myform.rowcheck[i].checked = true;
			}
		}
		else{
			for(i=0;i<document.myform.rowcheck.length;i++){
				myform.rowcheck[i].checked = false;
			}
		}
	}//allchecked

	function deleteChecked(){
		//alert(1);
		flag = false;
		for(i=0;i<myform.rowcheck.length;i++){
			if(myform.rowcheck[i].checked){
				flag = true;
			}
		}
		if(flag == false){
			alert("삭제할 항목을 체크하세요");
			return;
		}
		
	}//deleteChecked
	</script>   

<jsp:useBean id="fdao" class="mypkg.FriendsDao"/>
<%ArrayList<FriendsBean> list = fdao.selectAll();

%>

<form name="myform" action="checkedDelete.jsp">
<table border="1">
<tr>
<th><input type="checkbox" name="allcheck" onclick="allchecked()"></th>
<td>번호</td>
<td>아이디</td>
<td>비밀번호</td>
<td>이름</td>
<td>닉네임</td>
<td>생년</td>
<td>월</td>
<td>일</td>
<td>수정</td>
</tr>

<%for(int i=0;i<list.size();i++){
	FriendsBean fb = list.get(i);
	System.out.print(fb.getByear()); //왜 0이 오지
	%>

<tr>
<td><input type="checkbox" name="rowcheck" value="<%=fb.getNum() %>"></td>
<td><%=fb.getNum() %></td>
<td><%=fb.getId() %></td>
<td><%=fb.getPw() %></td>
<td><%=fb.getName() %></td>
<td><%=fb.getNickname() %></td>
<td><%=fb.getByear() %></td>
<td><%=fb.getBmonth() %></td>
<td><%=fb.getBday()%></td>
<td><a href="updateForm.jsp?num=<%=fb.getNum() %>"> 수정 </a></td>
</tr>
<%} %>
</table><br>
<input type="submit" id="delete" value="삭제하기" onClick="deleteChecked()">
</form>