<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.dunggub.value==""){
			alert("직급을 입력하세요.");
			document.form.dunggub.focus();
		}else if(document.form.salary.value==""){
			alert("급여를 입력하세요.");
			document.form.salary.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<form name="form" method="post" action="addHobong_Process.jsp">
<h1>인사관리 호봉 등록 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th>직급</th>
		<td>
			<select name="dunggub">
				<option value="1">1급</option>
				<option value="2">2급</option>
				<option value="3">3급</option>
				<option value="4">4급</option>
				<option value="5">5급</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>급여</th>
		<td><input type="text" name="salary"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="등록" onclick="check()" id="btn1">
			<input type="reset" value="취소" id="btn1">
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>