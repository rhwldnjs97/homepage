<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwbbs.BbsDAO" />
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");
	String oldfile = request.getParameter("oldfile");

	String upDir = application.getRealPath("/bbs/storage");

	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);

	boolean pflag = dao.passCheck(map);
	boolean flag = false;
	if (pflag) {
		flag = dao.delete(bbsno);
	}

	if (flag) {
		UploadSave.deleteFile(upDir, oldfile);
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
<script type="text/javascript">
	function blist() {
		var url = "../main/main.jsp";
		url = url + "?col=<%=request.getParameter("col")%>";
		url = url + "&word=<%=request.getParameter("word")%>";
		url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
</script>
</head>

<body>
	<jsp:include page="/layout/layout.jsp" flush="false" />



	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
		<div class="w3-container" id="services" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">
				<b>삭제결과</b>
			</h1>
			<hr style="width: 50px; border: 5px solid black" class="w3-round">
			<FORM
				class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
				<%
					if (pflag == false) {
						out.print("비밀번호 오류");
				%>
				<DIV class='bottom'>
					<input type='submit' value='다시시도' onclick="history.back()"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
					<input type='button' value='목록' onclick="blist()"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
				</DIV>
				<%
					} else if (flag) {
						out.print("삭제 완료");
				%>
				<DIV class='bottom'>
					<input type='button' value='목록' onclick="blist()"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
				</DIV>
				<%
					} else {
						out.print("삭제 실패");
				%>
				<DIV class='bottom'>
					<input type='submit' value='다시시도' onclick="history.back()"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
					<input type='button' value='목록' onclick="blist()"
						class="w3-button w3-padding-large w3-black w3-margin-bottom">
				</DIV>
				<%
					}
				%>


			</FORM>
		</div>
	</div>





	<jsp:include page="/layout/bottom.jsp" flush="false" />
</body>
</html>
