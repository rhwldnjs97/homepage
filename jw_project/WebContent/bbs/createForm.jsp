<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
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

<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>

<script type="text/javascript">
	function incheck(f) {
		if(f.div.value != "A03" && f.hide.checked){
			alert("비밀글은 문의사항에만 가능합니다.")
			return false;
		}
		if (f.div.value == "0") {
			alert("분류를 설정하세요.");
			return false;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요.");
			f.title.focus();
			return false;
		}
		if (CKEDITOR.instances['content'].getData() == '') {
		      window.alert('내용을 입력해 주세요.');
		      CKEDITOR.instances['content'].focus();
		      return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요.");
			f.passwd.focus();
			return false;
		}
	}
</script>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />
		<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
			<div class="w3-container" id="packages" style="margin-top: 75px">

				<h1 class="w3-xxxlarge w3-text-black">글 작성</h1>
				<hr style="width: 140px; border: 5px solid black" class="w3-round">

				<div class="w3-row-padding">
					<div class="w3-half w3-margin-bottom">

						<FORM name='frm' method='POST' action='./createProc.jsp'
							enctype="multipart/form-data" onsubmit="return incheck(this)"
							style="width: 800px;" class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">

							<h2 class="w3-center">글 작성</h2>

							<div class="w3-row w3-section">
								<div class="w3-col" style="width: 120px">
									<b>분류 : </b>
								</div>
								<div class="w3-rest">
									<select name="div">
										<option value="0" selected>선택하세요</option>
										<option value="A01">판매</option>
										<option value="A02">구매</option>
										<option value="A03">문의</option>
										<option value="A04">공지사항</option>
									</select>
								</div>
							</div>

							<div class="w3-row w3-section">
								<div class="w3-col" style="width: 120px">
									<b>제목 : </b>
								</div>
								<div class="w3-rest">
									<input type="text" name="title" size="42">
								</div>
							</div>

							<div class="w3-row w3-section">
								<div class="w3-col" style="width: 120px">
									<b>내용 : </b>
								</div>
								<div class="w3-rest">
									<textarea rows="10" cols="45" name="content"></textarea>
								</div>
							</div>

							<div class="w3-row w3-section">
								<div class="w3-col" style="width: 120px">
									<b>패스워드 : </b>
								</div>
								<div class="w3-rest">
									<input type="password" name="passwd">
									<label><input type="checkbox" name="hide" value="1">비밀글 설정</label>
								</div>
							</div>

							<div class="w3-row w3-section">
								<div class="w3-col" style="width: 120px">
									<b>파일 : </b>
								</div>
								<div class="w3-rest">
									<input type="file" name="fname">
								</div>
							</div>

							<p class="w3-center">
								<input type='submit' value='등록'
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
