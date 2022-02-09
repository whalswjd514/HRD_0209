<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String dunggub=request.getParameter("dunggub");
	String salary=request.getParameter("salary");
	
	try{
		String sql="update hobong0209 set salary=? where dunggub=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(2, dunggub);
		pstmt.setString(1, salary);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
		%>
		<script>
			alert("수정이 완료되었습니다.");
			location.href="hobongSelect.jsp";
		</script>
		<%
	}catch(SQLException e){
		System.out.println("데이터 수정 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("수정이 실패되었습니다.");
			history.back(-1);
		</script>
</body>
</html>