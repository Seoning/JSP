<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

    <%int num = Integer.parseInt(request.getParameter("num")); %>
    
    <jsp:useBean id="sdao" class="mypkg.StudentDao"/>
    
    <%int delete = sdao.deleteStu(num);
    
    
    String msg;
    String url = "select.jsp";
    if(delete>0){
    	msg ="삭제성공";
    }
    else{
    	msg ="삭제실패";
    }
    
    %>
    
    <script type="text/javascript">

	alert("<%=msg%>");
	location.href = "<%=url%>";

	</script>