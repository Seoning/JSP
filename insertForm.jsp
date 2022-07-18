<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="./js/jquery.js"></script>
<script>
	$(document).ready(function(){
		//alert(1);
		var flag = false;
		$('input[id=dupl]').click(function(){
			//alert(2);
			if($('input[name=id]').val()==""){
				alert("아이디를 입력하세요");
				$('input[name=id]').focus();
				return;
			}
			else{
				var userid = $('input[name=id]').val();
				$.ajax({
					url: "idcheck.jsp" ,
					data: {userid : userid},
					success: function(data){
						if($.trim(data)=="Y"){
							//alert("사용가능한 아이디 입니다.");							
							$('#msg').css('color','blue');
							$('#msg').html('사용가능한 아이디 입니다.');
							flag = true;
							
						}else{
							//alert("이미 존재하는 아이디 입니다.");
							$('#msg').css('color','red');
							$('#msg').html('이미 존재하는 아이디 입니다.');
							flag = false;
						}
					}
					
					
				});//ajax
			}
		});//dupl
		$('#sub').click(function(){
			if(flag == false){
				alert('중복확인 먼저 하세요');
				return false;
			}
		});
		
	});

</script>
<body>
<h3>회원가입</h3>
<form action="insertProc.jsp" method="post" name="myform">

<label>id : </label>
<input type="text" size="20" name="id">
<input type="button" value="중복확인" id="dupl"><span id="msg"></span>
<br>
<label>pw : </label>
<input type="password" size="20" name="pw"><br>
<label>name : </label>
<input type="text" size="20" name="name"><br>
<label>nickname : </label>
<input type="text" size="20" name="nickname"><br>
<label>생년 : </label>
<select name="year">
<%for(int i=2022;i>=1922;i--){%>
	<option value="<%=i%>"> <%=i %></option>
	
<%} %>
</select>
<label>월 : </label>
<select>
<%for(int i=1;i<13;i++){%>
<option value="<%=i%>"><%=i %></option>
<%}%>
</select>
<label>일 : </label>
<select>
<%for(int i=1;i<=31;i++){%>
<option value="<%=i%>"><%=i%></option>
<%} %>
</select><br>

<input type="submit" value="가입" id="sub" onclick="return check()">
</form>
</body>
</html>