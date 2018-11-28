<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="tmember.TmemberDAO"/>
<% 
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	Map map = new HashMap();
	map.put("name", name);
	map.put("id", id);
	String pw = dao.findPw(map);
	
	if(pw != null){
		out.println("패스워드를 찾았습니다.");
		out.println("패스워드 : "+pw);
	} else {
		out.println("잘못된 정보를 입력하였습니다.");
	}
%> 
