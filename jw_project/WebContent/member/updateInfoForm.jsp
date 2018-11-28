<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="jwmember.memberDAO" />

<%
	String id = request.getParameter("id");
	memberDTO dto = dao.read(id);
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					fullAddr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				if (data.userSelectedType === 'R') {
					//법정동명이 있을 경우 추가한다.
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('sample6_address').value = fullAddr;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('sample6_address2').focus();
			}
		}).open();
	}
</script>

<script type="text/javascript">
	$.ajaxSetup({
		error : function(jqXHR, exception) {
			if (jqXHR.status === 0) {
				alert('Not connect.\n Verify Network.');
			} else if (jqXHR.status == 400) {
				alert('Server understood the request, but request content was invalid. [400]');
			} else if (jqXHR.status == 401) {
				alert('Unauthorized access. [401]');
			} else if (jqXHR.status == 403) {
				alert('Forbidden resource can not be accessed. [403]');
			} else if (jqXHR.status == 404) {
				alert('Requested page not found. [404]');
			} else if (jqXHR.status == 500) {
				alert('Internal server error. [500]');
			} else if (jqXHR.status == 503) {
				alert('Service unavailable. [503]');
			} else if (exception === 'parsererror') {
				alert('Requested JSON parse failed. [Failed]');
			} else if (exception === 'timeout') {
				alert('Time out error. [Timeout]');
			} else if (exception === 'abort') {
				alert('Ajax request aborted. [Aborted]');
			} else {
				alert('Uncaught Error.n' + jqXHR.responseText);
			}
		}
	});


	function inputCheck(f) {
		if (f.id.value == "") {
			alert("아이디를 입력해 주세요.");
			f.id.focus();
			return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			f.passwd.focus();
			return false;
		}
		if (f.repasswd.value == "") {
			alert("비밀번호 확인을 입력해 주세요.");
			f.repasswd.focus();
			return false;
		}
		if (f.passwd.value != f.repasswd.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			f.passwd.focus();
			return false;
		}
		if (f.mname.value == "") {
			alert("이름을 입력해 주세요.");
			f.mname.focus();
			return false;
		}
		if (f.email.value == "") {
			alert("이메일을 입력해 주세요.");
			f.email.focus();
			return false;
		}
	}

	function idCheck(id) {
		if (id == "") {
			alert("아이디를 입력해주세요");
			document.frm.id.focus();
		} else {
			var url = "id_jquery.jsp";
			$.ajax({
				url : url,
				dataType : 'text',
				data : {
					"id" : id
				},

				success : function(data) {
					$("#idCheck").text(data.trim()).css("color", "red");
				}
			});
		/* var url = "id_proc.jsp";
		url += "?id=" + id;

		wr = window.open(url, "아이디검색", "width=500, height=500");
		wr.moveTo((window.screen.width - 500) / 2, (window.screen.height - 500) / 2); */
		}
	}
	function emailCheck(email) {
		if (email == "") {
			alert("이메일을 입력해 주세요");
			document.frm.email.focus();
		} else {
			var url = "email_jquery.jsp";
			$.ajax({
				url : url,
				dataType : 'text',
				data : {
					"email" : email
				},

				success : function(data) {
					$("#emailCheck").text(data.trim()).css("color", "red");
				}
			});
		/* var url = "email_proc.jsp";
		url += "?email=" + email;
		wr = window.open(url, "이메일중복확인", "width=500, height=500");
		wr.moveTo((window.screen.width - 500) / 2, (window.screen.height - 500) / 2); */
		}
	}
</script>
</head>

<body>
	<jsp:include page="../layout/layout.jsp" flush="false" />

	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
		<div class="w3-container" id="packages" style="margin-top: 75px">

			<h1 class="w3-xxxlarge w3-text-black">정보수정</h1>
			<hr style="width: 185px; border: 5px solid black" class="w3-round">

			<div class="w3-row-padding">
				<div class="w3-half w3-margin-bottom">

						<FORM name='frm' method='POST' action='./updateInfoProc.jsp' onsubmit="return inputCheck(this)"
						class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
						<input type="hidden" name="id" value="<%=dto.getId()%>">
						<h2 class="w3-center">회원정보 입력</h2>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>*아이디 : </b>
							</div>
							<div class="w3-rest">
								<%=dto.getId()%>
							</div>
						</div>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>*이름 : </b>
							</div>
							<div class="w3-rest">
								<input type="text" class="w3-input w3-border" name="mname"
									size="15" value="<%=dto.getMname()%>">
							</div>
						</div>

						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>전화번호 :</b>
							</div>
							<div class="w3-rest">
								<input type="text" class="w3-input w3-border" name="tel"
									size="15" value="<%=dto.getTel() %>">
							</div>
						</div>
						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>*이메일 : </b>
							</div>
							<div class="w3-rest">
								<input class="w3-input w3-border" type="email" name="email" size="15" value="<%=dto.getEmail()%>"> <input
									type="button" value="Email중복확인"
									onclick="emailCheck(document.frm.email.value)">
								<div id="emailCheck"></div>
							</div>
						</div>
						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>우편번호 :</b>
							</div>
							<div class="w3-rest">
								<input type="text" class="w3-input w3-border"
								name="zipcode" size="7" id="sample6_postcode" placeholder="우편번호" value="<%=dto.getZipcode()%>">
								<input type="button" value="우편번호찾기"
								onclick="sample6_execDaumPostcode()">
							</div>
						</div>
						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 120px">
								<b>주소 :</b>
							</div>
							<div class="w3-rest">
								<input type="text" class="w3-input w3-border"
								name="address1" size="40" id="sample6_address" placeholder="주소" value="<%=dto.getAddress1()%>">
								<input type="text" class="w3-input w3-border" name="address2" size="40"
								id="sample6_address2" placeholder="상세주소" value="<%=dto.getAddress2()%>">
							</div>
						</div>

						<p class="w3-center">
							<input type='submit' value='수정' class="w3-button w3-section w3-black w3-ripple">
							<input type='reset' value='취소' class="w3-button w3-section w3-black w3-ripple">
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/bottom.jsp" flush="false" />
</body>
</html>
