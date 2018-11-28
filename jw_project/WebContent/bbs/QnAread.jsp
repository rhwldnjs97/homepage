<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwbbs.BbsDAO" />

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String id = (String) session.getAttribute("id");
	String passwd = request.getParameter("passwd");
	String grade = (String) session.getAttribute("grade");
	dao.updateviewcnt(bbsno);
	BbsDTO dto = dao.read(bbsno);

	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
	String hide = dto.getHide();
	
	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);

	boolean flag = dao.passCheck(map);
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
function blist(){
	var url = "../main/main.jsp";
	url = url + "?col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
function bupdate(){
	var url = "updateForm.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	url = url + "&col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
function bdel(){
	var url = "deleteForm.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	url = url + "&oldfile=<%=dto.getFname()%>";
	url = url + "&col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;	
}
function breply(){
	var url = "replyForm.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	url = url + "&col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;	
}
function passCheck(){
	var url = "QnAread.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	url = url + "&col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;	
}
function fileDown(){
	var url = "<%=root%>/download";
	url = url + "?fname=<%=dto.getFname()%>";
	url = url + "&dir=/bbs/storage";
	
	location.href=url;
}

</script>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />

	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<div class="w3-container" id="packages" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">글 정보</h1>
			<hr style="width: 50px; border: 5px solid black" class="w3-round">

			<div class="w3-row-padding">
				<div class="w3-half w3-margin-bottom">
<%if(hide == null || flag){ %>
					<FORM>
						<ul class="w3-ul w3-light-grey w3-left">

							<li class="w3-dark-grey w3-xlarge w3-padding-32 w3-center">조회</li>

							<li class="w3-padding-16 w3-center"><img
								src="./storage/<%=dto.getFname()%>" style="width:400px;height:350px;"></li>

							<li class="w3-padding-16"><b>제목 : </b> <%=dto.getTitle()%></li>

							<li class="w3-padding-16"><b>내용 : </b> <%=content%></li>

							<li class="w3-padding-16"><b>ID :</b> <%=dto.getId()%></li>

							<li class="w3-padding-16"><b>조회수 : </b> <%=dto.getViewcnt()%>
							</li>

							<li class="w3-padding-16"><b>등록일 :</b> <%=dto.getWdate()%></li>

							<li class="w3-padding-16"><b>다운로드 :</b> <%
 	if (dto.getFname() != null) {
 %> <a href="javascript:fileDown()"> <span
									class="glyphicon glyphicon-download-alt"></span> Download
							</a> (<%=(dto.getFilesize() / 1024)%> KB) <%
 	} else {
 		out.print("No file");
 	}
 %></li>


						</ul>
					</FORM>

				</div>
			</div>
			<div align = 'center'>

				<%
					if (id != null) {
				%>
			<button onclick="breply()" class="w3-button w3-padding-large w3-black w3-center">답변</button>
			<%
					if (id.equals(dto.getId())) {
				%>
			<button onclick="bupdate()" class="w3-button w3-padding-large w3-black w3-center">수정</button>
			<button onclick="bdel()" class="w3-button w3-padding-large w3-black w3-center">삭제</button>
			<%
					} else {
						}
					}
				%>

			<input type='button' value='목록' onclick="blist()"
				class="w3-button w3-padding-large w3-black w3-center">
			</div>
<%}else{ %>


<br> <br>
				<h2>비밀글 입니다.<br>패스워드를 입력해주세요.</h2>
				<br> <br>

				<div class="content"></div>
				<FORM class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin"  
					name='frm' method='POST' onsubmit="passCheck(this)" action='./QnAread.jsp'>
					<input type="hidden" name="bbsno" value="<%=bbsno%>"> <input
						type="hidden" name="col" value="<%=request.getParameter("col")%>">
					<input type="hidden" name="word"
						value="<%=request.getParameter("word")%>"> <input
						type="hidden" name="nowPage"
						value="<%=request.getParameter("nowPage")%>">
						<input type="hidden" name="hide" value=<%=hide%>>
					<TABLE>
						<TR>
							<TH>패스워드</TH>
							<TD><input type="password" name="passwd"></TD>
						</TR>
						<br />
						<br />
					</TABLE>

					<DIV class='bottom'>
						<button type="submit" class="w3-button w3-padding-large w3-black w3-center">확인</button>
						<input type='button' value='취소' onclick="history.back()"
							class="w3-button w3-padding-large w3-black w3-margin-bottom">
					</DIV>
				</FORM>




<%} %>
			<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
