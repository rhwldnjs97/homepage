<%@ include file="../ssi/ssi.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="jwmember.memberDAO"/>

<%
String email = request.getParameter("email");
boolean flag = dao.duplicateId(email);


if(flag){
	out.print("중복");
}else{
	out.print("사용가능");
}

%>