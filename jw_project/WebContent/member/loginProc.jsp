<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<<jsp:useBean id="dao" class="jwmember.memberDAO" />
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	Map map = new HashMap();
	map.put("id", id);
	map.put("pw", passwd);

	boolean flag = dao.loginCheck(map);
	
	
	
	if (flag) {
		String grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif
}

body {
	font-size: 16px;
}

.w3-half img {
	margin-bottom: -6px;
	margin-top: 16px;
	opacity: 0.8;
	cursor: pointer
}

.w3-half img:hover {
	opacity: 1
}
</style>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />
	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">


		<div class="w3-container" id="services" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">
				<b>로그인 처리</b>
			</h1>
			<hr style="width: 50px; border: 5px solid black" class="w3-round">
			<FORM
				class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
				<%
					if (flag) {
				%>
				<br>
				<br>
				<h2>로그인이 되었습니다.</h2>
				<br>
				<br>
				<%
					/* out.print("로그인이 되었습니다."); */
				%>
				<DIV class='bottom'>
					<input type="button" value="홈"
						onclick="location.href='../main/main.jsp'"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
				</DIV>
				<%
					} else {
						out.print("ID 또는 비밀번호가 일치하지 않습니다.");
				%>
				<DIV class='bottom'>
					<input type="button" value="홈"
						onclick="location.href='../main/main.jsp'"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
					<input type='button' value='다시시도' onclick="history.back()"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
				</DIV>
				<%
					}
				%>
			</FORM>
		</div>


	</div>
	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
