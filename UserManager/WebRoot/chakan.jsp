  <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'chakan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->	
  </head>
  <style type="text/css">
	body{color:#ffffff}
	.a1{font-size:18}
	#myInput {
    background-image: url('https://static.runoob.com/images/mix/searchicon.png'); /* 搜索按钮 */
    background-position: 10px 12px; /* 定位搜索按钮 */
    background-repeat: no-repeat; /* 不重复图片 */
    width: 100%;
    font-size: 16px;
    padding: 12px 20px 12px 40px;
    border: 1px solid #ddd;
    margin-bottom: 12px; 
}
 
#myTable {
    border-collapse: collapse; 
    width: 100%; 
    border: 1px solid #ddd;
    font-size: 18px; 
}
 
#myTable th, #myTable td {
    text-align: left;
    padding: 12px;
}
 
#myTable tr {
    /* 表格添加边框 */
    border-bottom: 1px solid #ddd; 
}
 
#myTable tr.header, #myTable tr:hover {
    /* 表头及鼠标移动过 tr 时添加背景 */
    background-color: pink;
}
td{
style="width:10%;"
}
	</style>
	<script type="text/javascript">
	   function myFunction() {
       // 声明变量
      var input, filter, table, tr, td, i;
      input = document.getElementById("myInput");
      filter = input.value.toUpperCase();
      table = document.getElementById("myTable");
      tr = table.getElementsByTagName("tr");
 
  // 循环表格每一行，查找匹配项
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
	</script>
            <body background="topian/qq.jpg">   
             <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
             url="jdbc:mysql://localhost/mybd?characterEncoding=utf-8" user="root"  password="123456"/>
             <sql:query dataSource="${snapshot}" var="result">
             SELECT * from user;
             </sql:query>
               <center><h2>用户个人信息</h2>
               <input type="text" id="myInput" onkeyup="myFunction()" placeholder="搜索用户名..." style="width:50%;">              
                  <table border="0"  id="myTable" style="width:60%;">
           <tr class="a1" class="header" >   
           <td >名字:</td>
           <td >性别:</td>
           <td >爱好:</td>
           <td >出生:</td>
           <td >地址:</td>
           </tr>        
    <c:forEach var="row" items="${result.rows}" >
   <tr>   
   <td><c:out value="${row.username}"/></td>
   <td><c:out value="${row.gender}"/></td>
   <td><c:out value="${row.love}"/></td>
    <td><c:out value="${row.riqi}"/></td>
   <td><c:out value="${row.neirong}"/></td>
   </tr>   
   </c:forEach>     
   <tr><td colspan="5"><a href="index.jsp"><center><input type="button" value="返回首页"></center></a></td></tr>   
   </table>  
   </center> 
  </body>
  </html>
