<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>


<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mb" class="mypkg.MovieBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
String []genre = request.getParameterValues("genre");
String temp = "";
if(genre == null){
	temp = "선택한 장르 없음";
}
else{
	for(int j=0;j<genre.length;j++){
		temp += genre[j]+" ";
	}
}
mb.setGenre(temp);
System.out.println(mb.getId());
System.out.println(mb.getGenre());
%>
<jsp:useBean id="mdao" class="mypkg.MovieDao"/>
<%int update = mdao.updateMovie(mb); 

String msg;
String url;
if(update>0){
	msg = "수정 성공";
	url = "select.jsp";
}else{
	msg = "수정 실패";
	url = "updateForm.jsp?num"+mb.getNum();
	
}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>