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
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String dunggub=request.getParameter("dunggub");
	
	try{
		String sql="select * from hobong0209 where dunggub=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dunggub);
		rs=pstmt.executeQuery();
		if(rs.next()){
			dunggub=rs.getString(1);
			String salary=rs.getString(2);
%>
<form name="form" method="post" action="hobongUpdate_Process.jsp">
<h1>인사관리 호봉 수정 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th>직급</th>
		<td>
			<select name="dunggub">
				<option value="1" <%if(dunggub.equals("1")){%>selected<%}%>>1급</option>
				<option value="2" <%if(dunggub.equals("2")){%>selected<%}%>>2급</option>
				<option value="3" <%if(dunggub.equals("3")){%>selected<%}%>>3급</option>
				<option value="4" <%if(dunggub.equals("4")){%>selected<%}%>>4급</option>
				<option value="5" <%if(dunggub.equals("5")){%>selected<%}%>>5급</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>급여</th>
		<td><input type="text" name="salary" value="<%=salary %>"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="수정" onclick="check()" id="btn1">
			<input type="reset" value="취소" id="btn1">
		</td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>