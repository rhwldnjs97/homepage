<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwbbs.BbsDAO" />
<jsp:useBean id="rdao" class="jwreply.ReplyDAO" />

<%
	
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String rcontent = request.getParameter("content");
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
	dao.updateviewcnt(bbsno);
	BbsDTO dto = dao.read(bbsno);
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
	
	ReplyDTO rdto = new ReplyDTO();

	/*댓글처리*/
	String url = "read";//댓글 페이지 매개변수
	
	int nPage = 1;
	
	if(request.getParameter("nPage")!= null) {
		nPage = Integer.parseInt(request.getParameter("nPage"));
	}
	
	int recordPerPage = 3;
	int sno = ((nPage-1)*recordPerPage) + 1;
	int eno = nPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("nPage", nPage);
	map.put("sno", sno);
	map.put("eno", eno);
	map.put("bbsno", bbsno);
	
	List<ReplyDTO> rlist = rdao.list(map);
	int total = rdao.total(bbsno);
	
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	String col= request.getParameter("col");
	String word= request.getParameter("word");

	String paging = utility.rpaging(total, nowPage, recordPerPage, col, word, nPage, url, bbsno);
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
function fileDown(){
	var url = "<%=root%>/download";
	url = url + "?fname=<%=dto.getFname()%>";
	url = url + "&dir=/bbs/storage";

	location.href = url;
}

function input(f){
	
	if(<%=id%> == null){
		if(confirm("로그인 후 이용 가능합니다.")){
			var url = "../member/loginForm.jsp";
			url = url + "?bbsno=<%=bbsno%>";
			url = url + "&nPage=<%=request.getParameter("nPage")%>";
			url = url + "&col=<%=request.getParameter("col")%>";
			url = url + "&word=<%=request.getParameter("word")%>";
			url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
			url += "&flag=../bbs/read";
			
			location.href=url;
			
			return false;
		}else{
			return false;
		}
	}else if(f.rcontent.value==''){
		alert("댓글 내용을 입력해주세요.");
		f.content.focus();
		return false;
	}else{
			rdto.setContent(rcontent);
			rdto.setId(id);
			rdto.setBbsno(bbsno);
			rdao.create(rdto);
	}
	
	var url = "./bbs/read.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	url = url + "&nPage=<%=request.getParameter("nPage")%>";
	url = url + "&col=<%=request.getParameter("col")%>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>";
	
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

					<FORM>

						<ul class="w3-ul w3-light-grey w3-left">

							<li class="w3-dark-grey w3-xlarge w3-padding-32 w3-center">조회</li>

							<li class="w3-padding-16 w3-center"><img
								src="./storage/<%=dto.getFname()%>"
								style="width: 400px; height: 350px;"></li>

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
			<div align='center'>

				<%
					if (id != null) {
				%>
				<button onclick="breply()"
					class="w3-button w3-padding-large w3-black w3-center">답변</button>
				<%
					if (id.equals(dto.getId())) {
				%>
				<button onclick="bupdate()"
					class="w3-button w3-padding-large w3-black w3-center">수정</button>
				<button onclick="bdel()"
					class="w3-button w3-padding-large w3-black w3-center">삭제</button>
				<%
					} else {
						}
					}
				%>
				<input type='button' value='목록' onclick="blist()"
					class="w3-button w3-padding-large w3-black w3-center">
			</div>
			
			<hr>
			
			<%
			for(int n=0; n<rlist.size(); n++){
				rdto = rlist.get(n);
			%>
			<div class = "rlist">
 				<%=rdto.getId()%><br>
 				<p><%=rdto.getContent()%></p>
 				<%=rdto.getRegdate() %>
 			<%
 				if(id==%><%rdto.getId() %><%){
 			%>
 				<span style="float:right">
 	 			수정 / 삭제
 	 			</span>
 	 		<%
 				}
 			%>
 </div>
			<%
			}
			%>
	
	<div style="text-aling:center"><%=paging%></div>
		
	<div class = "rcreate">
	<form name = "rform" action="./read.jsp" method="post" onsubmit="return input(this)">
		<textarea rows="3" cols="30" name="rcontent"></textarea>
		<input type="hidden" name="id" value=<%=id%>>
		<input type="hidden" name="bbsno" value="<%=dto.getBbsno()%>">
		<input type="hidden" name="nPage" value=<%=nPage%>>
		<input type="hidden" name="nowPage" value=<%=request.getParameter("nowPage")%>>
		<input type="hidden" name="col" value=<%=request.getParameter("col")%>>
		<input type="hidden" name="word" value=<%=request.getParameter("word")%>>
		<input type ="submit" value="등록">
	</form>
</div>
		<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
