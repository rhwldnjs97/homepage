<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="jwbbs.BbsDAO" />
<jsp:useBean id="dto" class="jwbbs.BbsDTO" />

<%
	String tempDir = application.getRealPath("/bbs/temp");
	String upDir = application.getRealPath("/bbs/storage");
	String id = (String) session.getAttribute("id");
	
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	dto.setId(id);
	/* dto.setId(UploadSave.encode(upload.getParameter("id"))); */

	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setDiv(upload.getParameter("div"));
	dto.setHide(upload.getParameter("hide"));
	
	FileItem fileItem = upload.getFileItem("fname");

	int filesize = (int) fileItem.getSize();

	String fname = null;

	if (filesize > 0) {
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	
	dto.setFname(fname);
	dto.setFilesize(filesize);
	
	boolean flag = dao.create(dto);
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

<script type="text/javascript">
	function main() {
		var url = "../main/main.jsp";
		location.href = url;
	}
</script>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />
<div class="w3-main" style="margin-left: 340px; margin-right: 40px">


		<div class="w3-container" id="services" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">
				<b>글 등록</b>
			</h1>
			<hr style="width: 50px; border: 5px solid black" class="w3-round">

		<%
			if (flag) {
				out.print("글이 등록되었습니다.");
			} else {
				out.print("글 등록에 실패했습니다.");
			}
		%>

		<input type='button' value='메인' onclick="main()"> <input
			type='button' value='계속 등록' onclick="location.href='createForm.jsp'">

</div>
</div>


	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
