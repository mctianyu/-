<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shanchu.jsp' starting page</title>
    
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
          <table align="center">
      <tr><td> <h3>输入需要要删除的账号的id</h3></td></tr>
       <td><form method="post" action="user" required="required">
    id:<input type="text" name="id"></input>
       <input type="hidden" name="method" value="sc" /></td></tr>
    		<tr><td><input type="submit" value="提交" class="button button2"><td></tr>
    		<tr><td><a href="index.jsp"><input type="button" value="返回首页" class="button button2"></a></td></tr>
    		</form>
    		</table>
  </body>
</html>
