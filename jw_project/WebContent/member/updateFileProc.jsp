<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwmember.memberDAO" />
<%
	String upDir = application.getRealPath("/member/storage");
	String tempDir = application.getRealPath("/member/temp");

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	String id = upload.getParameter("id");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

	FileItem fileItem = upload.getFileItem("fname");
	String fname = null;
	if (fileItem.getSize() > 0) {
		UploadSave.deleteFile(upDir, oldfile);
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	Map map = new HashMap();

	map.put("id", id);
	map.put("fname", fname);
	boolean flag = dao.updateFile(map);
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
function read(){
	var url = "read.jsp";
	url = url + "?id=<%=id%>";
	location.href = url;
}
</script>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />


	<DIV class="title">사진 변경</DIV>
	<div class="content">
	<%
		if (flag) {
			out.print("사진변경 완료!");
		} else {
			out.print("사진 변경에 실패했습니다.");
		}
	%>
</div>
	<DIV class='bottom'>
		<%
			if (flag) {
		%>
		<input type='button' value='내 정보' onclick="read()">
		<%
			} else {
		%>
		<input type='button' value='다시 시도' onclick="history.back()">
		<%
			}
		%>
	</DIV>



	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
