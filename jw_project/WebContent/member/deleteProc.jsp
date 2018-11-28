<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwmember.memberDAO" />
<%
	String upDir = application.getRealPath("/member/storage");
	String id = request.getParameter("id");
	String oldfile = dao.getFname(id);
	boolean flag = dao.delete(id);

	if (flag) {
		if (oldfile != null && !oldfile.equals("member.jpg")) {
			UploadSave.deleteFile(upDir, oldfile);
		}
		session.invalidate();
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
			<h1 class="w3-xxxlarge w3-text-black">회원 탈퇴 처리</h1>
			<hr style="width: 50px; border: 5px solid black" class="w3-round">

		<%
			if (flag) {
				out.print("탈퇴되었습니다.");
				
			} else {
				out.print("탈퇴에 실패했습니다.");
			}
		%>
		<input type='submit' value='홈' onclick="location.href='../index.jsp'" class="w3-button w3-block w3-padding-large w3-black w3-margin-bottom">
		<input type='button' value='다시시도' onclick="history.back()" class="w3-button w3-block w3-padding-large w3-black w3-margin-bottom">

</div>
</div>

	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
