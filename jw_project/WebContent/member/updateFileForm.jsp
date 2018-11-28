<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>

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
		<div class="w3-container" id="packages" style="margin-top: 75px">

			<h1 class="w3-xxxlarge w3-text-black">파일 수정</h1>
			<hr style="width: 185px; border: 5px solid black" class="w3-round">

			<div class="w3-row-padding">
				<div class="w3-half w3-margin-bottom">

					<FORM name='frm' method='POST' action='./updateFileProc.jsp'
						enctype="multipart/form-data"
						class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
						<input type="hidden" name="id"
							value="<%=request.getParameter("id")%>"> <input
							type="hidden" name="oldfile"
							value="<%=request.getParameter("oldfile")%>">

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>기존 사진 : </b>
							</div>
							<div class="w3-rest">
								<img src="./storage/<%=request.getParameter("oldfile")%>">
							</div>
						</div>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>수정할 사진 : </b>
							</div>
							<div class="w3-rest">
								<input type="file" name="fname" class="w3-input w3-border">
							</div>
						</div>

						<input type='submit' value='수정'
							class="w3-button w3-section w3-black w3-ripple"> <input
							type='button' value='취소' onclick="history.back()"
							class="w3-button w3-section w3-black w3-ripple">
					</FORM>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
