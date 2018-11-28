<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>

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
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />


	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
		<div class="w3-container" id="contact" style="margin-top: 75px"> 
			<h1 class="w3-xxxlarge w3-text-black">
				<b>할 일</b>
			</h1>

			<hr style="width: 140px; border: 5px solid black" class="w3-round">
				<div class="w3-row-padding">
				<div class="w3-half w3-margin-bottom">
			
			<FORM class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">	
				<ul>
				<li>[member] 수정/삭제 등 디자인 수정 </li>
				<li>LoginProc 디자인 수정</li>
				<li>파일 다운로드</li>
				<li>수정시 파일 유지</li>
				<li>사진 여러장 첨부</li>
				<li>게시판 글 사이즈 / 회원정보 사이즈 </li>
				<li>회원 정보 찾기 (ID / PW)</li>
				<li>문의사항 비밀글 설정 기능 (QnAread에 비밀번호 입력 가능 / 입력시 해제 필요)</li>
				<li></li>
				<li></li>
				<li></li>
				<li>overflow:auto; -> 자동 스크롤</li>
				</ul>

			</form>
		</div>
	</div>
</div>
</div>




	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
