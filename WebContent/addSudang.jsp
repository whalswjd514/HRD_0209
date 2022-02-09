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
   String name=request.getParameter("name");
   String gajok=request.getParameter("gajok");
   String jikchak=request.getParameter("jikchak");
   String gunsok=request.getParameter("gunsok");
   String gitasudang=request.getParameter("gitasudang");
   
   if(id==null){
      id="";
      name="";
      gajok="0";
      jikchak="0";
      gunsok="0";
      gitasudang="0";
   }else{
   try{
      String sql="select id,name from info0209 where id=?";
      pstmt=conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs=pstmt.executeQuery();
      if(rs.next()){
         id=rs.getString(1);
         name=rs.getString(2);
      }else{
%>
         <script>
            alert("등록되지 않은 코드입니다.");
         </script>
<%
      }
   }catch(SQLException e){
      System.out.println("데이터 읽기 실패");
      e.printStackTrace();
   }   
   }
   
%>
<form name="form" method="post" action="addSudang.jsp">
<h1>수당 정보 등록</h1>
<table border=1 id="tab1">
   <tr>
      <th id="th1">사원번호</th>
      <td><input type="text" name="id" value="<%=id %>" onchange="changesubmit();"></td>
      <th id="th1">이름</th>
      <td><input type="text" name="name" value="<%=name %>" onchange="changesubmit();"></td>
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
         <input type="submit" value="저장" id="btn1" onclick="check()">
      </td>
   </tr>
</table>
</form>
<script>
   function check(){
      if(document.form.name.value==""){
         alert("이름을 입력하세요.");
         document.form.name.focus();
      }else{
         form.action="addSudang_Process.jsp";
      }
   }
   
   function changesubmit(){
      document.form.submit();
   }
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>