<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<style>
a:link.line{
	text-decoration : none;
}
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


<body>

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index: 3; width: 270px; font-weight: bold;" id="mySidebar">
		<br> <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width: 100%; font-size: 22px">Close Menu</a>
		<div class="w3-container" >
			<h3 class="w3-padding-16">
			<img src="../img/Hlogo.jpg" align="middle">
			</h3>
		</div>
		<div class="w3-bar-block">
			<a href="<%=root%>/main/main.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white line"><span class="glyphicon glyphicon-home"></span> Home</a> 
			<%if(id==null){%>
			<a href="<%=root%>/member/loginForm.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white line"><span class="glyphicon glyphicon-log-in"></span> 로그인</a> 
			<%}else{%>
			<a href="<%=root%>/member/logout.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white line"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a>
			<%} %>
			<a href="<%=root%>/bbs/sellList.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white line"><span class="glyphicon glyphicon-inbox"></span> 판매 게시판</a> 
			<a href="<%=root%>/bbs/buyList.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white line"><span class="glyphicon glyphicon-shopping-cart"></span> 구매 게시판</a> 
			<a href="<%=root%>/bbs/QnA.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white line"><span class="glyphicon glyphicon-question-sign"></span> 문의사항</a> 
			<a href="<%=root%>/bbs/notice.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white line"><span class="glyphicon glyphicon-bullhorn"></span> 공지사항</a>
			<a href="<%=root%>/member/read.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white line">내 정보</a>
			<a href="<%=root %>/admin/jw_project.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white line">할 일</a>
		</div>
	</nav>

	<!-- Top menu on small screens -->
	<header class="w3-container w3-top w3-hide-large w3-black w3-xlarge w3-padding">
		<a href="javascript:void(0)" class="w3-button w3-black w3-margin-right" onclick="w3_open()">☰</a> <span>쓰던거 사고팔기</span>
	</header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>


	<script>
		// Script to open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}

		// Modal Image Gallery
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
			var captionText = document.getElementById("caption");
			captionText.innerHTML = element.alt;
		}
	</script>

</body>
</html>
