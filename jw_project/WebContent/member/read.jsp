<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwmember.memberDAO" />
<%
	String id = request.getParameter("id");
	if (id == null) {
		id = (String) session.getAttribute("id");
	}
	memberDTO dto = dao.read(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
	function updateFile() {
		var url = "updateFileForm.jsp";
		url += "?id  =<%=id%>";
		url += "&oldfile=<%=dto.getFname()%>";
		location.href = url;
	}

	function updatePasswd() {
		var url = "updatePasswdForm.jsp";
		url += "?id=<%=id%>";
		location.href = url;
	}
	function updateInfo() {
		var url = "updateInfoForm.jsp";
		url += "?id=<%=id%>";
		location.href = url;
	}

	function mlist() {
		var url = "../main/main.jsp";
		location.href = url;
	}

	function mdel() {
		var url = "deleteForm.jsp";
		url += "?id=<%=id%>";
		location.href = url;
	}
</script>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />

	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<div class="w3-container" id="packages" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">내 정보</h1>
			<hr style="width: 50px; border: 5px solid black" class="w3-round">


			<div class="w3-row-padding">
				<div class="w3-half w3-margin-bottom">

					<FORM name='frm' method='POST' action='./pcreateProc.jsp'
						enctype="multipart/form-data" onsubmit="return inputCheck(this)">

						<ul class="w3-ul w3-light-grey w3-left">

							<li class="w3-dark-grey w3-xlarge w3-padding-32 w3-center" ><%=dto.getMname()%>님의
								회원정보</li>

							<li class="w3-padding-16 w3-center"><img
								src="./storage/<%=dto.getFname()%>"></li>

							<li class="w3-padding-16"><b>아 이 디 : </b> <%=dto.getId()%></li>

							<li class="w3-padding-16"><b>이    름 : </b> <%=dto.getMname()%></li>

							<li class="w3-padding-16"><b>전화번호 :</b> <%=dto.getTel()%></li>

							<li class="w3-padding-16"><b>이 메 일 : </b> <%=dto.getEmail()%>
							</li>

							<li class="w3-padding-16"><b>우편번호 :</b> <%=dto.getZipcode()%>
							</li>

							<li class="w3-padding-16"><b>주    소 :</b> <%=dto.getAddress1()%>
								<%=utility.checkNull(dto.getAddress2())%></li>
							<li class="w3-padding-16"><b>생 성 일 :</b> <%=dto.getMdate()%></li>


						</ul>
				</div>
			</div>


			<input type='button' value='정보수정' onclick="updateInfo()"
				class="w3-button w3-padding-large w3-black w3-center">
			<input type='button' value='사진 수정' onclick="updateFile()"
				class="w3-button w3-padding-large w3-black w3-center">
			<input type='button' value='패스워드 변경' onclick="updatePasswd()"
				class="w3-button w3-padding-large w3-black w3-center">
			<input type='button' value='회원탈퇴' onclick="mdel()"
				class="w3-button w3-padding-large w3-black w3-center">
			<input type='button' value='메인으로' onclick="mlist()"
				class="w3-button w3-padding-large w3-black w3-center">
			</FORM>
		</div>

	</div>

	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
