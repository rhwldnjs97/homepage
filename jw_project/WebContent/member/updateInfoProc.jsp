<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwmember.memberDAO" />
<%
	String id = request.getParameter("id");
	String mname = request.getParameter("mname");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");

	Map map = new HashMap();

	map.put("id", id);
	map.put("mname", mname);
	map.put("tel", tel);
	map.put("email", email);
	map.put("zipcode", zipcode);
	map.put("address1", address1);
	map.put("address2", address2);
	boolean flag = dao.updateInfo(map);
%>
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
<script type="text/javascript">
function read(){
	var url = "read.jsp";
	url = url + "?id=<%=id%>";
	location.href = url;
	}
</script>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />

	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
		<div class="w3-container" id="services" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">
				<b>정보 수정 결과</b>
			</h1> 
			<hr style="width: 50px; border: 5px solid black" class="w3-round">
			<FORM
				class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
		<%
			if (flag) {
				out.print("정보 수정 완료!");
				%>
				<br>
				<input type='button' value='내 정보' onclick="read()" class="w3-button w3-padding-large w3-black w3-margin-bottom">
				<%
			} else {
				out.print("정보 수정에 실패했습니다.");
				%>
				<br>
				<input type='button' value='다시 시도' onclick="history.back()" class="w3-button w3-padding-large w3-black w3-margin-bottom">
				<%
			}
		%>
			</FORM>
		</div>
	</div>



	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
