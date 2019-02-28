<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    width:300px;
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
	<script type="text/javascript">
	function fuxuan(){
	var love=document.getElementsByName("love");
	var flag=false;
	for(var i=0;i<love.length;i++){
	  if(love[i].checked){
	  flag=true;
	  break;
	  }
	  if(!flag){
	  alert("爱好最少选择一项!");
	  return false;
	  }	
	  }
	  }		
		function check() {
			var pwd1 = document.getElementsByName("password")[0].value;
			var pwd2 = document.getElementsByName("rePassword")[0].value;
			if (pwd1 != pwd2) {
				alert("两次输入的密码不一致，请重新输入");
				return false;
			}
				return true;
			
		}		
          function validPwd()
        {
       var pwd = document.getElementById('password').value;
     if (pwd.length > 8 || pwd.length < 3)
       {
    alert("密码长度应该在 3 - 8 位");
    return false;
     }
  return true;
     }   
	</script>
  </head>
  
  <body background="topian/qq.jpg">
            
    	<center><h3>用户注册</h3> </center>
    	    
    	    <form method="post" action="user" onsubmit="return check(),fuxuan()">
    	    <table border="0" width="600" align="center">
    	    <tr><td width="20%">用户类型:</td><td><input type="radio" name="guanli" checked="checked" value="用户">普通用户</td></tr>
    		<tr><td>用户名: </td><td><input type="text" name="username" required="required"/> <span style="color:blue;">${requestScope.errorInfo}</span></td></tr>
    		<tr><td>密&nbsp &nbsp&nbsp码: </td><td><input type="password" name="password" required="required" id="password"/></td></tr>
    		<tr><td>确认密码:</td><td><input type="password" name="rePassword" required="required" id="password"/></td></tr>  	
    		<tr><td><input type="radio"	name="gender" checked="checked" value="男">男</td><td><input type="radio" name="gender" value="女">女</td></tr>
    		<tr><td><input type="checkbox" name="love" value="听音乐">听音乐&nbsp</td>
    		<td><input type="checkbox" name="love" value="打游戏">打游戏&nbsp
    		<input type="checkbox" name="love" value="看电影">看电影&nbsp</td></tr>
    		<tr><td>出生日期:</td>
    		<td>
    		<input type="date" value="2000-01-01" name="riqi"/>
    		</td></tr>
    		<tr><td>地址:</td><td>
    		<textarea  name="neirong" rows="2" cols="18"></textarea><br/></td></tr>
    		<tr><td colspan="2"><input type="hidden" name="method" value="reg" />
    		<input type="submit" value="提交" onclick="return validPwd()" class="button button2"/></td></tr>
    		<tr><td colspan="2"><input type = "reset" class="button button2"/></td></tr>
    		<tr><td colspan="2"><a href="login.jsp"><input type="button" value="返回登录" class="button button2"></a></td></tr>
    		</table>    		
    	</form>
    	
  </body>
</html>
