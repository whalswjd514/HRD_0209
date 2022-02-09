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
<%
   request.setCharacterEncoding("utf-8");
   PreparedStatement pstmt=null;
   ResultSet rs=null;
   String id=request.getParameter("id");
   
   try{
	   String sql="select a.id,a.name,b.gajok,b.jikchak,b.gunsok,b.gitasudang from info0209 a,sudang0209 b where a.id=b.id and a.id=?";
   	   pstmt=conn.prepareStatement(sql);
   	   pstmt.setString(1, id);
   	   rs=pstmt.executeQuery();
   	   if(rs.next()){
   		   String name=rs.getString(2);
   		   String gajok=rs.getString(3);
   		   String jikchak=rs.getString(4);
   		   String gunsok=rs.getString(5);
   		   String gitasudang=rs.getString(6);
%>
<form name="form" method="post" action="sudangUpdate_Process.jsp">
<h1>수당 정보 등록</h1>
<table border=1 id="tab1">
   <tr>
      <th id="th1">사원번호</th>
      <td><input type="text" name="id" value="<%=id %>"></td>
      <th id="th1">이름</th>
      <td><input type="text" name="name" value="<%=name %>"></td>
   </tr>
   <tr>
      <th id="th1">가족수당</th>
      <td><input type="text" name="gajok" value="<%=gajok %>"></td>
      <th id="th1">직책수당</th>
      <td><input type="text" name="jikchak" value="<%=jikchak %>"></td>
   </tr>
   <tr>
      <th id="th1">근속수당</th>
      <td colspan=3><input type="text" name="gunsok" value="<%=gunsok %>"></td>
   </tr>
   <tr>
      <th id="th1">기타수당</th>
      <td colspan=3><input type="text" name="gitasudang" value="<%=gitasudang %>"></td>
   </tr>
   <tr>
      <td colspan=4 align=center>
         <input type="button" value="목록" id="btn1" onclick="location.href='sudangSelect.jsp'">
         <input type="submit" value="수정" id="btn1" onclick="check()">
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
<script>
   function check(){
      if(document.form.name.value==""){
         alert("이름을 입력하세요.");
         document.form.name.focus();
      }else{
         document.form.submit();
      }
   }
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>