<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery.js">></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert(1);
		var flag = false;
		$('#id_check').click(function(){ 
			//alert(2);
			if($('input[name="id"]').val()==""){
				alert('아이디를 입력하세요');
				'input[name="id"]'.val().focus();
				return;
			}
			else{
				var userid = $('input[name="id"]').val();
				$.ajax({
					url : "id_check_proc.jsp",
					type:'post',
					data : {userid:userid},
					success : function(data){
						if($.trim(data)=='YES'){ //trim...빼먹지말자. 한시간 반 날렸다.
			                $('#idmessage').html("사용할 수 있는 아이디입니다.");
							$('#idmessage').css('color','blue');
							flag = true;
						}else{
							$('#idmessage').css('color','red');
			                $('#idmessage').html("사용할 수 없는 아이디입니다.");
							flag = false;
						}
					}
					
				});//ajax	
			}
			
		});//id_check
		$('#sub').click(function(){
			//alert(3);
			if(flag == false){
				alert('아이디 중복체크 먼저 하세요');
				return false;
			}
		});
	});//ready

</script>

</head>
<body>
	<h2>회원가입 insertForm.jsp</h2>
	<form action="inputProc.jsp" method="post">
		아이디 : <input type="text" name="id" value="IU">
				<input type="button" value="중복체크" id="id_check">
				<span id="idmessage"></span>
				<br><br>  
		비밀번호 :
		<input type="password" name="passwd" value="1234"><br><br>  
		이름 
		: <input type="text" name="name" value="아이유"><br><br>  
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
					<option value="<%=i%>"><%=i%></option>
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
					<option value="<%=i %>"><%=i %></option>
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
					<option value="<%=i%>"><%=i%></option>
				<%
				}//for()
				%>
                
                
        </select> 일 <br>

		<br> 취미 : 
		<input type="checkbox" name="hobby" value="달리기">달리기
		<input type="checkbox" name="hobby" value="수영">수영 
		<input type="checkbox" name="hobby" value="게임">게임 
		<input type="checkbox" name="hobby" value="영화">영화<br> <br><br> 

		[점수입력]<br> 
		C언어 : 	<input type="text" name="c" size="10">
		JAVA : <input type="text" name="java" size="10">
		JSP : <input type="text" name="jsp" size="10"><br><br>  
		<input type="submit" value="가입하기" id="sub" onclick="return checkIn()">
	</form>

</body> 
</html>

