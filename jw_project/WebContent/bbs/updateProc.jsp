<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="jwbbs.BbsDAO" />
<jsp:useBean id="dto" class="jwbbs.BbsDTO" />

<%
	String tempDir = application.getRealPath("/bbs/temp");
	String upDir = application.getRealPath("/bbs/storage");
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	//form값
	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setFin(upload.getParameter("fin"));

	//hidden값
	dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));

	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String nowPage = upload.getParameter("nowPage");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

	//업로드 파일
	FileItem fileItem = upload.getFileItem("fname");
	int filesize = (int) fileItem.getSize();
	String fname = null;

	Map map = new HashMap();
	map.put("bbsno", dto.getBbsno());
	map.put("passwd", dto.getPasswd());

	boolean pflag = dao.passCheck(map);

	boolean flag = false;

	if (pflag) {
		if (filesize > 0) {
			if (oldfile != null) {
				UploadSave.deleteFile(upDir, oldfile);
			}
			fname = UploadSave.saveFile(fileItem, upDir);
		}

		dto.setFname(fname);
		dto.setFilesize(filesize);

		flag = dao.update(dto);
	}
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
</style>

<script type="text/javascript">
	function blist() {
		var url = "../main/main.jsp";
		url = url + "?col=<%=col%>";
		url = url + "&word=<%=word%>";
		url = url + "&nowPage=<%=nowPage%>";
		location.href = url;
	}
</script>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />

	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
		<div class="w3-container" id="services" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">
				<b>수정결과</b>
			</h1>
			<hr style="width: 50px; border: 5px solid black" class="w3-round">
			<FORM
				class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
				<%
					if (pflag == false) {
						out.print("비밀번호 오류");
				%>
				<DIV class='bottom'>
					<input type='button' value='홈' onclick="blist()"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
					<input type='button' value='다시 시도' onclick="history.back()"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
				</DIV>
				<%
					} else if (flag) {
						out.print("글 수정에 성공했습니다.");
				%>
				<DIV class='bottom'>
					<input type='button' value='홈' onclick="blist()"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
				</DIV>
				<%
					} else {
						out.print("글 수정에 실패했습니다.");
				%>
				<DIV class='bottom'>
					<input type='button' value='홈' onclick="blist()"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
					<input type='button' value='다시 시도' onclick="history.back()"
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
