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
<h1>수당 정보 조회</h1>
<hr>
<table border=1 id="tab2">
	<tr>
		<th>no</th>
		<th>사원번호</th>
		<th>이름</th>
		<th>가족수당</th>
		<th>직책수당</th>
		<th>근속수당</th>
		<th>기타수당</th>
		<th>수당합계</th>
		<th>구 분</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select a.id,a.name,to_char(b.gajok,'999,999,999'),to_char(b.jikchak,'999,999,999'),to_char(b.gunsok,'999,999,999'),to_char(b.gitasudang,'999,999,999'),to_char(gajok+jikchak+gunsok+gitasudang,'999,999,999') from info0209 a,sudang0209 b where a.id=b.id";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(2);
			String gajok=rs.getString(3);
			String jikchak=rs.getString(4);
			String gunsok=rs.getString(5);
			String gitasudang=rs.getString(6);
			String sum=rs.getString(7);
			no++;
%>
	<tr>
		<td align="center"><%=no %></td>
		<td align="center"><%=id %></td>
		<td align="center"><%=name %></td>
		<td align="right"><%=gajok %></td>
		<td align="right"><%=jikchak %></td>
		<td align="right"><%=gunsok %></td>
		<td align="right"><%=gitasudang %></td>
		<td align="right"><%=sum %></td>
		<td align="center">
				<a href="sudangUpdate.jsp?id=<%=id %>">수정</a> / 
				<a href="sudangDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
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
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>