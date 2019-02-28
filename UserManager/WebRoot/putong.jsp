<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>My JSP 'putong.jsp' starting page</title>    
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
	.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 6px 3px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    width:280px;
    height:40px;
}
.button2 {    
	background-color: #008CBA;
    color: white;
}
.button2:hover {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
}
	</style> 
  <body background="topian/qq.jpg">
     <table border="0" align="center">
     <center><h3>用户页面</h3>
    	 欢迎您， <%=session.getAttribute("currentUser")%><br/></center>
    	 <tr><td>  性别:  <%=session.getAttribute("xinbie")%></td></tr>
    	 <tr><td> 爱好:  <%=session.getAttribute("aihao")%></td></tr>
    	 <tr><td> 出生日期:<%=session.getAttribute("chushen")%></td></tr>
    	 <tr><td>地址: <%=session.getAttribute("dizhi")%></td></tr>     	    	   	      
    	<tr><td><a href="xiu.jsp"><button class="button button2"/>修改账号</button></a></td></tr>
    	<tr><td><a href="login.jsp"><button class="button button2"/>退出登录</button></a></td></tr>
    	</table>	
  </body>
</html>
