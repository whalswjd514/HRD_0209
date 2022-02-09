<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<h1>호봉 정보 조회</h1>
<table border=1 id="tab1">
	<tr>
		<th>no</th>
		<th>등급</th>
		<th>급여</th>
		<th>구분</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select dunggub,to_char(salary,'999,999,999') from hobong0209";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		String dunggub_name="";
		while(rs.next()){
			String dunggub=rs.getString(1);
			if(dunggub.equals("1")){
				dunggub_name="1급";
			}else if(dunggub.equals("2")){
				dunggub_name="2급";
			}else if(dunggub.equals("3")){
				dunggub_name="3급";
			}else if(dunggub.equals("4")){
				dunggub_name="4급";
			}else{
				dunggub_name="5급";
			}
			String salary=rs.getString(2);
			no++;
%>
	<tr>
		<td><%=no %></td>
		<td><%=dunggub_name %></td>
		<td align="right"><%=salary %></td>
		<td align="center">
			<a href="hobongUpdate.jsp?dunggub=<%=dunggub %>">수정</a> / 
			<a href="hobongDelete.jsp?dunggub=<%=dunggub %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
		</td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>