<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->	
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
  </head> 
       <body background="topian/qq.jpg">
       <table border="0" align="center">  
       <center><h3>用户管理系统首页</h3>  		    	        
                  欢迎您，<%=session.getAttribute("ming")%>管理员</br> </center>  
         <tr><td>性别:<%=session.getAttribute("sex")%></td></tr>
          <tr><td> 爱好:<%=session.getAttribute("ai")%></td></tr>
          <tr><td>日期:<%=session.getAttribute("ri")%></td></tr>
          <tr><td>地址:<%=session.getAttribute("di")%></td></tr>
         <tr><td><a href="chakan.jsp"><button class="button button2"/>查询全部账号信息</button></a></td></tr>                              
         <tr><td><a href="user?method=fetchAll"><button class="button button2"/>管理用户</button></a></td></tr>
         <tr><td><a href="login.jsp"><button class="button button2"/>退出登录</button></a></td></tr>                                                                            
         </table> 
  </body>
</html>
