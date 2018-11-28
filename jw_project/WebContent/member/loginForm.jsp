<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String c_id = ""; // ID 저장 여부를 저장하는 변수, Y
	String c_id_val = ""; // ID 값

	Cookie[] cookies = request.getCookies();
	Cookie cookie = null;

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			cookie = cookies[i];

			if (cookie.getName().equals("c_id")) {
				c_id = cookie.getValue(); // Y 
			} else if (cookie.getName().equals("c_id_val")) {
				c_id_val = cookie.getValue(); // user1... 
			}
		}
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
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />


	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
		<div class="w3-container" id="contact" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">
				<b>로그인</b>
			</h1>

			<hr style="width: 140px; border: 5px solid black" class="w3-round">
			<div class="w3-row-padding">
				<div class="w3-half w3-margin-bottom">

					<FORM name='frm' method='POST'
						action='<%=root%>/member/loginProc.jsp'
						class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
						<div class="w3-section">
							<label>아이디</label> <input class="w3-input w3-border" type="text"
								name="id" value='<%=c_id_val%>' required>
							<%
								if (c_id.equals("Y")) { // id 저장 상태라면
							%>
							<input type='checkbox' name='c_id' value='Y' checked='checked'>
							ID 저장
							<%
								} else {
							%>
							<input type='checkbox' name='c_id' value='Y'> ID 저장
							<%
								}
							%>
						</div>

						<div class="w3-section">
							<label>비밀번호</label> <input class="w3-input w3-border"
								type="password" name="passwd" required>
						</div>

						<p class="w3-center">
							<input type='submit' value='로그인'
								class="w3-button w3-padding-large w3-black w3-margin-bottom">

							<input type='button' value='회원가입'
								onclick="location.href='agreement.jsp'"
								class="w3-button w3-padding-large w3-black w3-margin-bottom">
							<input type='button' value='계정 찾기'
								onclick="location.href='idPasswdFind.jsp'"
								class="w3-button w3-padding-large w3-black w3-margin-bottom">
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
