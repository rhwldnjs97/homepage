<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="jwbbs.BbsDAO" />

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = dao.read(bbsno);
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
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>

<script type="text/javascript">
	function incheck(f) {
		if (f.div.value == "0") {
			alert("분류를 설정하세요.");
			return;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요.");
			f.title.focus();
			return;
		}
		if (CKEDITOR.instances['content'].getData() == '') {
		      window.alert('내용을 입력해 주세요.');
		      CKEDITOR.instances['content'].focus();
		      return;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요.");
			f.passwd.focus();
			return;
		}
		f.submit();
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

					<FORM name='frm' method='POST' action='./updateProc.jsp'
						enctype="multipart/form-data" onsubmit="return incheck(this)"
						style="width: 800px;"
						class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
						<input type="hidden" name="bbsno" value="<%=dto.getBbsno()%>">
						<input type="hidden" name="col"
							value="<%=request.getParameter("col")%>"> <input
							type="hidden" name="word"
							value="<%=request.getParameter("word")%>"> <input
							type="hidden" name="nowPage"
							value="<%=request.getParameter("nowPage")%>"> <input
							type="hidden" name="oldfile" value="<%=dto.getFname()%>">
						<h2 class="w3-center">글 작성</h2>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>분류 : </b>
							</div>
							<div class="w3-rest">
								<select name="div">
								<%
								switch(dto.getDiv()){
								case "A01" :
								%>
										<option value="0">선택하세요</option>
										<option value="A01" selected>판매</option>
										<option value="A02">구매</option>
										<option value="A03">문의</option>
										<option value="A04">공지사항</option>
								<%
								break;
								case "A02" :
								%>
										<option value="0">선택하세요</option>
										<option value="A01">판매</option>
										<option value="A02" selected>구매</option>
										<option value="A03">문의</option>
										<option value="A04">공지사항</option>
								<%
								break;
								case "A03" :
								%>
										<option value="0">선택하세요</option>
										<option value="A01">판매</option>
										<option value="A02">구매</option>
										<option value="A03" selected>문의</option>
										<option value="A04">공지사항</option>
								<%
								break;
								case "A04" :
								%>
									<option value="0">선택하세요</option>
										<option value="A01">판매</option>
										<option value="A02">구매</option>
										<option value="A03">문의</option>
										<option value="A04" selected>공지사항</option>
								<%
								break;
								default :
									%>
									<option value="0" selected>선택하세요</option>
									<option value="A01">판매</option>
									<option value="A02">구매</option>
									<option value="A03">문의</option>
									<option value="A04">공지사항</option>
									<%
								}
								%>
								</select>
							</div>
						</div>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>제목 : </b>
							</div>
							<div class="w3-rest">
								<input type="text" name="title" size="42"
									value="<%=dto.getTitle()%>">
							</div>
						</div>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>내용 : </b>
							</div>
							<div class="w3-rest">
								<textarea rows="10" cols="45" name="content"><%=dto.getContent()%></textarea>
							</div>
						</div>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>패스워드 : </b>
							</div>
							<div class="w3-rest">
								<input type="password" name="passwd">
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

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>거래여부 : </b>
							</div>
							<div class="w3-rest">
								<label><input type="checkbox" name="fin" value="1">거래
									완료</label>
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
