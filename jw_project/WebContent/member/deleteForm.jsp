<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	if (id == null) {
		id = (String) session.getAttribute("id");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
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

		<div class="w3-container" id="packages" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">회원 탈퇴</h1>
			<hr style="width: 50px; border: 5px solid black" class="w3-round">


			<FORM name='frm' method='POST' action='./deleteProc.jsp'>
				<input type="hidden" name="id" value="<%=id%>"
					class="w3-button w3-block w3-padding-large w3-black w3-margin-bottom">
				<b>탈퇴된 계정은 복구할 수 없습니다.<br> 그래도 탈퇴하시겠습니까?</b> <br> <input type='submit'
					value='예' class="w3-button w3-section w3-black w3-ripple"> <input type='button' value='아니오'
					onclick="history.back()"
					class="w3-button w3-section w3-black w3-ripple">
			</FORM>

		</div>
	</div>

	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
