<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwbbs.BbsDAO" />
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
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
	function inchect(f) {
		if (f.passwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			f.passwd.focus();
			return false;
		}
	}
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
				<b>글 삭제</b>
			</h1>
			<hr style="width: 50px; border: 5px solid black" class="w3-round">

				<br> <br>
				<h2>삭제된 글은 복구할 수 없습니다.</h2>
				<br> <br>

				<div class="content"></div>
				<FORM name='frm' method='POST' action='./deleteProc.jsp'
					onsubmit="return incheck(this)" class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
					<input type="hidden" name="bbsno" value="<%=bbsno%>"> <input
						type="hidden" name="oldfile"
						value="<%=request.getParameter("oldfile")%>"> <input
						type="hidden" name="col" value="<%=request.getParameter("col")%>">
					<input type="hidden" name="word"
						value="<%=request.getParameter("word")%>"> <input
						type="hidden" name="nowPage"
						value="<%=request.getParameter("nowPage")%>">
					<TABLE>
						<TR>
							<TH>패스워드</TH>
							<TD><input type="password" name="passwd"></TD>
						</TR>
						<br />
						<br />
					</TABLE>

					<DIV class='bottom'>
						<input type='submit' value='확인'
							class="w3-button w3-padding-large w3-black w3-margin-bottom">
						<input type='button' value='취소' onclick="history.back()"
							class="w3-button w3-padding-large w3-black w3-margin-bottom">
					</DIV>
				</FORM>
		</div>
	</div>

	<jsp:include page="/layout/bottom.jsp" flush="false" />
</body>
</html>
