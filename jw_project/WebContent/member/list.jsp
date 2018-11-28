<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwmember.memberDAO" /><%
	//검색관련
	String col = utility.checkNull(request.getParameter("col"));
	String word = utility.checkNull(request.getParameter("word"));
	if (col.equals("total")) {
		word = "";
	}

	//페이징관련
	int nowPage = 1;
	int recordPerPage = 5;
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	//DB에서 가져올 순번
	int sno = ((nowPage - 1) * recordPerPage) - 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int total = dao.total(map);
	List<memberDTO> list = dao.list(map);

	String paging = utility.paging3(total, nowPage, recordPerPage, col, word);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

.search {
	text-align: center;
	margin: 3px auto;
}
</style>
<script type="text/javascript">
	function read(id) {
		var url = "<%=root %>/member/read.jsp";
		url += "?id=" + id;
		location.href = url;
	}
</script>

</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />


	<div class="search">
		<FORM name='frm' method='POST' action='./list.jsp'>
			<select name="col">
				<option value="mname"
					<%if (col.equals("mname")) {
				out.print("selected='selected'");
			}%>>성명</option>
				<option value="email"
					<%if (col.equals("email")) {
				out.print("selected='selected'");
			}%>>이메일</option>
				<option value="id"
					<%if (col.equals("id")) {
				out.print("selected='selected'");
			}%>>아이디</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value='<%=word%>'> <input
				type="submit" value="검색"> <input type="button" value="회원가입"
				onclick="location.href='<%=root %>/member/createForm.jsp'">
		</FORM>
	</div>

	<div class="container">
		<h2>
			<span class="glyphicon glyphicon-th-list"></span> 회원 목록
		</h2>

		<%
			for (int i = 0; i < list.size(); i++) {
				memberDTO dto = list.get(i);
		%>
		<TABLE class="table table-hover">
			<TR>
				<TD rowspan='5' width="30%"><img
					src='<%=root %>/member/storage/<%=dto.getFname()%>' width='100%' height='100%'>
				</TD>
				<TH width="20%">아이디</TH>
				<TD width="50%"><a href="javascript:read('<%=dto.getId()%>')"><%=dto.getId()%></a></TD>
			</TR>
			<TR>
				<TH>성명</TH>
				<TD><%=dto.getMname()%></TD>
			</TR>
			<TR>
				<TH>전화번호</TH>
				<TD><%=dto.getTel()%></TD>
			</TR>
			<TR>
				<TH>이메일</TH>
				<TD><%=dto.getEmail()%></TD>
			</TR>
			<TR>
				<TH>주소</TH>
				<TD><%=dto.getAddress1()%> <%=utility.checkNull(dto.getAddress2())%></TD>
			</TR>
		</TABLE>
		<%
			}
		%>
		<DIV class='bottom'>
			<%=paging%>
		</DIV>

	</div>

	<jsp:include page="../layout/bottom.jsp" flush="false" />

</body>
</html>
