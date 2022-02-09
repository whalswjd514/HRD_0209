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
<h1>사원 정보 조회</h1>
<table border=1 id="tab2">
	<tr>
		<th>no</th>
		<th>사번</th>
		<th>성명</th>
		<th>직급</th>
		<th>직책</th>
		<th>연락처</th>
		<th>소속부서</th>
		<th>주소</th>
		<th>관리</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select * from info0209";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(2);
			String position=rs.getString(4);
			String duty=rs.getString(5);
			String phone=rs.getString(6);
			String dept=rs.getString(3);
			if(dept.equals("10")){
				dept="인사부";
			}else if(dept.equals("20")){
				dept="기획부";
			}else if(dept.equals("30")){
				dept="홍보부";
			}else if(dept.equals("40")){
				dept="영업부";
			}else{
				dept="경리부";
			}
			String address=rs.getString(7);
			no++;
%>
	<tr>
		<td><%=no %></td>
		<td><a href="infoUpdate.jsp?id=<%=id %>"><%=id %></a></td>
		<td><%=name %></td>
		<td><%=position %></td>
		<td><%=duty %></td>
		<td><%=phone %></td>
		<td><%=dept %></td>
		<td><%=address %></td>
		<td><a href="infoDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></td>
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