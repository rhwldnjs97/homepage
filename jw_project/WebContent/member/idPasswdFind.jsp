<%@ include file="../ssi/ssi.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="jwmember.memberDAO" />
<%
	String c_id = (String) request.getAttribute("c_id");
	String c_id_val = (String) request.getAttribute("c_id_val");
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
$.ajaxSetup({
    error: function(jqXHR, exception) {
        if (jqXHR.status === 0) {
            alert('Not connect.\n Verify Network.');
        }
        else if (jqXHR.status == 400) {
            alert('Server understood the request, but request content was invalid. [400]');
        }
        else if (jqXHR.status == 401) {
            alert('Unauthorized access. [401]');
        }
        else if (jqXHR.status == 403) {
            alert('Forbidden resource can not be accessed. [403]');
        }
        else if (jqXHR.status == 404) {
            alert('Requested page not found. [404]');
        }
        else if (jqXHR.status == 500) {
            alert('Internal server error. [500]');
        }
        else if (jqXHR.status == 503) {
            alert('Service unavailable. [503]');
        }
        else if (exception === 'parsererror') {
            alert('Requested JSON parse failed. [Failed]');
        }
        else if (exception === 'timeout') {
            alert('Time out error. [Timeout]');
        }
        else if (exception === 'abort') {
            alert('Ajax request aborted. [Aborted]');
        }
        else {
            alert('Uncaught Error.n' + jqXHR.responseText);
        }
    }
});
function idfind(){
	
		var f = document.frm;
		var mname = f.mname.value;
		var email = f.email.value;
		alert(mname);
		alert(email);
		var url = "./idfind_jquery.jsp";
		// ajax로 비동기 통신
		$.ajax({
			url : url,
			dataType : 'text',
			data : {"mname" : mname, "email" : email},
			
			success : function(data){
				$("#idresult").text(data.trim()).css("color","red");
			}
		});
}
function pwfind(){
	
		var f = document.frm2;
		var id = f.id.value;
		var mname2 = f.mname2.value;
		alert(id);
		alert(mname2);
		var url = "./pwfind_jquery.jsp";
		// ajax로 비동기 통신
		$.ajax({
			url : url,
			dataType : 'text',
			data : {"id" : id, "mname2" : mname2},
			
			success : function(data){
				$("#pwresult").text(data.trim()).css("color","red");
			}
		});
}
</script>

</head> 

<body>
<jsp:include page="/layout/layout.jsp" flush="false"/>

 	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
		<div class="w3-container" id="contact" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-black">
				<b>ID / 비밀번호 찾기</b>
			</h1>

			<hr style="width: 140px; border: 5px solid black" class="w3-round">
			<div class="w3-row-padding">
				<div class="w3-half w3-margin-bottom">
				<table><tr><td>
					<FORM name='frm' class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
						<div class="w3-section">
							<label>이름</label> <input type="text" name="mname" required="required">
						</div>

						<div class="w3-section">
							<label>email</label> <input type="email" name="email" required="required">
						</div>

						<p class="w3-center">
							<input type='button' value='찾기' onclick="idfind()"
								class="w3-button w3-padding-large w3-black w3-margin-bottom">
							<input type='reset' value='취소'
								class="w3-button w3-padding-large w3-black w3-margin-bottom">
						</p>
						<div id="idresult"></div>
					</form>
					</td><td>
					
					<FORM name='frm2' class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
						<div class="w3-section">
							<label>이름</label> <input type="text" name="mname2" required="required">
						</div>

						<div class="w3-section">
							<label>ID</label> <input type="text" name="id" required="required">
						</div>

						<p class="w3-center">
							<input type='button' value='찾기' onclick="pwfind()" class="w3-button w3-padding-large w3-black w3-margin-bottom">
							<input type='reset' value='취소'
								class="w3-button w3-padding-large w3-black w3-margin-bottom">
						</p>
						<div id="pwresult"></div>
					</form>
					
					
					</td></tr></table>
				</div>
			</div>
		</div>
	</div>
 
<jsp:include page="/layout/bottom.jsp" flush="false"/>
</body>
</html> 
