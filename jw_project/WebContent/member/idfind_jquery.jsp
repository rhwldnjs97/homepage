<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="jwmember.memberDAO" />
<% 
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	
	Map map = new HashMap();
	map.put("name", name);
	map.put("email", email);
	String id = dao.findId(map);
	
	if(id != null){
		out.println("ID를 찾았습니다.");
		out.println("ID : "+id);
	} else {
		out.println("잘못된 정보를 입력하였습니다.");
	}
%> 
