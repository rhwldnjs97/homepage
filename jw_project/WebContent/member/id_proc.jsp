<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwmember.memberDAO" />
<%
	String id = request.getParameter("id");
	boolean flag = dao.duplicateId(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function use() {
		opener.frm.id.value = '<%=id%>';
		self.close();
	}
</script>
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
	<div class="w3-container" id="services" style="margin-top: 75px">
		<h1 class="w3-xxxlarge w3-text-black">
			<b>ID 확인</b>
		</h1>
		<hr style="width: 50px; border: 5px solid black" class="w3-round">
		입력된 ID:<%=id%>
		<br> <br>
		<%
			if (flag) {
				out.print("이미 사용 중인 ID 입니다.<br><br>");
			} else {
				out.print("사용 가능한 ID 입니다.<br><br>");
				out.print("<button onclick='use()'>사용</button>");
			}
		%>
		<input type='button' value='닫기' onclick="window.close()">
	</div>





</body>
</html>
