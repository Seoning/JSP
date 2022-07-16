<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
inputProc.jsp<br>

<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="sb" class="mypkg.StudentBean"/>
<jsp:setProperty property="*" name="sb"/>

<%String[] hobbyArr = request.getParameterValues("hobby");
String temp="";
if(hobbyArr == null){
	temp="선택한 항목 없음";
}
else{
	for(int i=0;i<hobbyArr.length;i++){
		temp+=hobbyArr[i]+" "; //temp=수영,게임
				
	}
}
	sb.setHobby(temp);
int sum  = sb.getC() + sb.getJava() + sb.getJsp();
sb.setSum(sum);
System.out.println(sb.getHobby());
%>
<jsp:useBean id="sdao" class="mypkg.StudentDao"/>


<%int insert = sdao.insertStu(sb);

String msg;
String url;
if(insert>0){
	msg ="가입성공";
	url = "select.jsp";	
}
else{
	msg ="가입실패";
	url = "insertForm.jsp";
}
%>

<script type="text/javascript">

	alert("<%=msg%>");
	location.href = "<%=url%>";

</script>