<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwmember.memberDAO" />
<%
	String id = request.getParameter("id");
	memberDTO dto = dao.read(id);

	String oldpasswd = dto.getPasswd();
	Map map = new HashMap();
	map.put("id", id);
	map.put("oldpasswd", oldpasswd);
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
	function inputCheck(f) {
		if (f.passwd.value != f.repasswd.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			f.passwd.focus();
			return false;
		}
<%boolean flag = dao.passwdCheck(map);
			if (!flag) {%>
	alert("현재의 비밀번호가 일치하지않습니다.");
	return false;
<%}%>
	}
</script>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />


	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
		<div class="w3-container" id="packages" style="margin-top: 75px">

			<h1 class="w3-xxxlarge w3-text-black">비밀번호 변경</h1>
			<hr style="width: 185px; border: 5px solid black" class="w3-round">

			<div class="w3-row-padding">
				<div class="w3-half w3-margin-bottom">

					<FORM name='frm' method='POST' action='./updatePasswdProc.jsp'
						onsubmit="return inputCheck(this)"
						class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
						<input type="hidden" name="id"
							value="<%=request.getParameter("id")%>">
						<h2 class="w3-center">비밀번호 변경</h2>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>현재 비밀번호 입력</b>
							</div>
							<div class="w3-rest">
								<input type="text" name="oldpasswd">
							</div>
						</div>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>변경할 비밀번호 입력</b>
							</div>
							<div class="w3-rest">
								<input type="password" name="passwd">
							</div>
						</div>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>비밀번호 재확인</b>
							</div>
							<div class="w3-rest">
								<input type="password" name="repasswd">
							</div>
						</div>
						<p class="w3-center">
							<input type='submit' value='수정'
								class="w3-button w3-section w3-black w3-ripple"> <input
								type='button' value='취소' onclick="history.back()"
								class="w3-button w3-section w3-black w3-ripple">
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
