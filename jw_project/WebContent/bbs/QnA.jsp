<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwbbs.BbsDAO" />
<%

	// 검색 관련 처리
	String col = utility.checkNull(request.getParameter("col"));
	String word = utility.checkNull(request.getParameter("word"));
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
	
	
	if (col.equals("total")) {
		word = "";
	}

	//페이징 관련 처리

	int nowPage = 1; // 외출
	int recordPerPage = 10;

	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage")); //위험함! numberformatException 가능성	
	}

	//DB에서 가져올 레코드의 순번
	int sno = ((nowPage - 1) * recordPerPage) + 1; //공식임 ㅎ
	int eno = nowPage * recordPerPage;
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<BbsDTO> list = dao.QnAlist(map);
	//전체 레코드 개수(col, word)
	int totalRecord = dao.QnAtotal(map);
%>


<!DOCTYPE html>
<html>
<title>중고나라</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	function read(bbsno) {
		var url = "../bbs/QnAread.jsp";
		url = url + "?bbsno=" + bbsno;
		url = url + "&col=<%=col%>";
		url = url + "&word=<%=word%>";
		url = url + "&nowPage=<%=nowPage%>";
		location.href = url;
	}

	function fileDown(filename) {
		var url = "<%=root%>/download";
		url = url + "?fname=" + fname;
		url = url + "&dir=/bbs/storage";

		location.href = url;
	}
</script>

<body>
	<jsp:include page="../layout/layout.jsp" /><br>


	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<div class="w3-container" style="margin-top: 80px" id="showcase">
			<h1 class="w3-xxlarge">
				<span class="glyphicon glyphicon-question-sign"></span><b> 문의 </b>
			</h1>
			
<hr>
<div align='center'>
			<form method="post" action="./QnAread.jsp">
			<input type="hidden" name="hide" value="<%=request.getParameter("hide")%>">
				<select name="col">
					<option value="id"
						<%if (col.equals("id")) {
				out.print("selected");
			}%>>아이디</option>
					<option value="title"
						<%if (col.equals("title")) {
				out.print("selected");
			}%>>제목</option>
					<option value="content"
						<%if (col.equals("content")) {
				out.print("selected");
			}%>>내용</option>
					<option value="total">전체검색</option>
				</select> <input type="text" name="word" value="<%=word%>" size="35">
				<button>검색</button>
				<%
			if (id != null) {
		%>
		<button type="button" onclick="location.href='../bbs/createForm.jsp'"
			class="w3-button w3-padding-small w3-black w3-right">글 작성 <span class="glyphicon glyphicon-pencil"></span></button>
		<%
			}
		%>
			</form>
			</div>
		</div>
		<hr>
		<br>
		<div align='center'>
		<TABLE style="width:1000px;" class="w3-table-all">
			
				<TR class="w3-black">
					<TH style="width:100px; text-align:center;">번호</TH>
					<TH style="width:500px; text-align:center;">제목</TH>
					<TH style="width:100px; text-align:center;">작성자</TH>
					<TH style="width:100px; text-align:center;">등록일</TH>
					<TH style="width:100px; text-align:center;">조회수</TH>
					<TH style="width:100px; text-align:center;">거래여부</TH>
				</TR>
			
			<%
				if (list.size() == 0) {
			%>
			<tbody>
				<tr>
					<td colspan="6">등록된 글이 없네요.</td>
				</tr>
			</tbody>
			<%
				} else {
					for (int i = 0; i < list.size(); i++) {
						BbsDTO dto = list.get(i);
			%>
				<tr>
					<td style="text-align:center;"><%=dto.getBbsno()%></td>
					<td>
						<%
							/* 							for (int r = 0; r < dto.getIndent(); r++) {
																			out.print("&nbsp;&nbsp;");
																		}
																		if (dto.getIndent() > 0) {
																			out.print("<img src = './'>");
																		} */
						%> <a href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle()%></a>
						<%-- 	<%
							if (utility.compareDate(dto.getWdate())) {
										out.print("<img src = './'>");
									}
						%> --%>
					</td>
					<td><%=dto.getId()%></td>
					<td style="text-align:center;"><%=dto.getWdate()%></td>
					<td style="text-align:center;"><%=dto.getViewcnt()%></td>
					<%
						if (dto.getFin()!=null) {
					%>
					<td style="text-align:center;"><img src='../img/fin.jpg'>
					</td>
					<%
						} else {
					%>
					<td></td>
					<%
						}
					%>
				</tr>
			<%
				}
				}
			%>
		</TABLE>
		</div>
		<div class="w3-container" id="services" style="margin-top: 40px">
		<%int bbs = 4; %>
			<%=utility.paging3(totalRecord, nowPage, recordPerPage, col, word, bbs)%>
		</DIV>
		
	</div>
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
	<jsp:include page="../layout/bottom.jsp" />

</body>
</html>
