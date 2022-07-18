<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert(1);
		var duplication = false;
		$('input[id="check"]').click(function(){
			//alert(2);
			if($('input[name="id"]').val()==""){
				alert('아이디를 입력하세요');
				$('input[name="id"]').focus();
				return;
			}else{
				var userid = $('input[name="id"]').val();
				$.ajax({
					url : "idcheckProc.jsp",
					data:{userid:userid},
					success : function(data){
						//alert(data);
						if($.trim(data)=="Y"){
							//alert('사용할 수 있는 아이디');
							$('#idmsg').css('color','blue');
							$('#idmsg').html("사용 가능한 아이디");
							duplication = true;
						}else{
							//alert('이미 사용되고 있는 아이디');
							$('#idmsg').css('color','red');
							$('#idmsg').html("사용 불가능한 아이디");
							duplication = false;
						}
					}
				});//ajax
			}
		});//idcheck
		$('#sub').click(function(){
			if(duplication == false){
				alert('아이디 중복확인 누락');
				return false;
			}
		});
		
	});
</script>
</head>
<body>
<h2>영화 선호도 조사 </h2>
	<form action="insertProc.jsp" method="post" name="myform">
		<table border="1" width="700px">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" value="IU">
				<input type="button" value="중복확인" onclick="idcheck()" id="check">
				<span id="idmsg"></span>
			</td>  
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="아이유"></td>
			
		</tr> 
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" value="23"></td> 
		</tr>
		<tr>
			<td>좋아하는 장르</td>
			<td>
				<input type="checkbox" name="genre" value="공포">공포
				<input type="checkbox" name="genre" value="다큐">다큐 
				<input type="checkbox" name="genre" value="액션">액션 
				<input type="checkbox" name="genre" value="애니메이션">애니메이션
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
					<option value="<%=i %>~<%=i+2%>"><%=i %>~<%=i+2 %></option>
					<% }%>
				</select>
			</td> 
		</tr>
		
		<tr>
			<td>동반 관객수</td>
			<td> 
				 <input type="radio" name="partner" value="1">1
				<input type="radio" name="partner" value="2">2 
				<input type="radio" name="partner" value="3">3 
				<input type="radio" name="partner" value="4">4 <br><br>

			</td>
		</tr>
		
		<tr>
			<td>영화관 개선사항</td>
			<td>
				<textarea name="memo" cols="40" rows="3">value는 여기에 넣기</textarea> 
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="가입하기" id="sub" onclick="return checking()">
			</td>
		</tr>
		</table>
	</form>

</body>
</html>