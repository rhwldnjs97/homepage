<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwmember.memberDAO" />
<jsp:useBean id="dto" class="jwmember.memberDTO" />
<%
	String upDir = "/member/storage";
	upDir = application.getRealPath(upDir);

	UploadSave upload = (UploadSave) request.getAttribute("upload");

	dto.setId(upload.getParameter("id"));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setTel(upload.getParameter("tel"));
	dto.setEmail(upload.getParameter("email"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	FileItem fileItem = upload.getFileItem("fname");

	int size = (int) fileItem.getSize();
	
	String fname = null;
	
	if (size > 0) {
		fname = UploadSave.saveFile(fileItem, upDir);
	} else {
		fname = "member.jpg";
	}

	dto.setFname(fname);

	boolean flag = dao.create(dto);
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
<script type="text/javascript">
	function mlist() {
		var url = "list.jsp";
		location.href = url;
	}
</script>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />

	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<div class="w3-container" id="services" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">
				<b>회원가입 처리</b>
			</h1>
			<hr style="width: 50px; border: 5px solid black" class="w3-round">

				<%
					if (flag) {
						out.print("가입하신걸 환영합니다.");
				%>
					<input type='button' value='로그인'
						onclick="location.href='loginForm.jsp'"> <input
						type='button' value='홈' onclick="location.href='../main/main.jsp'">
					<input type='button' value='목록' onclick="mlist()">
				<%
					} else {
						out.print("회원가입에 실패하였습니다.");
				%>

					<input type='submit' value='다시시도' onclick="history.back()">
					<input type='button' value='홈'
						onclick="location.href='../main/main.jsp'">
				<%
					}
				%>
			</div>
			</div>

			<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
