<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

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
	for(int i=0;i<genre.length;i++){
		temp += genre[i]+" ";
	}
}
mb.setGenre(temp);
System.out.println(mb.getId());
System.out.println(mb.getGenre());
%>
<jsp:useBean id="mdao" class="mypkg.MovieDao"/>
<%int insert = mdao.insertMovie(mb);


String msg;
String url;
if(insert>0){
	msg = "추가 성공";
	url = "select.jsp";
}else{
	msg = "추가 실패";
	url = "insertForm.jsp";
	
}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>