<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'wang.jsp' starting page</title>
    
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
.b1{
 width:180px;
 height:25px;
 }
 body{color:#ffffff}
  </style>
   <script type="text/javascript">
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
     function show(){
		var img = document.getElementById("imgId");
		img.src = "/UserManager/checkcode?time="+new Date().getTime();
	}
	</script>        
	  
  <body background="topian/qq.jpg">
      <br/><br/><br/><br/><br/><br/> 
      
     <form method="post" action="user" onsubmit="return check()">
     <table border="0" width="400" align="center">
     <tr><td  colspan="2"><h3>找回密码</h3></td></tr>
     <tr><td>用户名:&nbsp&nbsp &nbsp<input type="text" name="username" class="b1"></td><td><span style="color:red;">${requestScope.bu}</span></td></tr>
    <tr><td> 新密码:&nbsp &nbsp&nbsp<input type="password" name="password" id="password" class="b1"/></td><td></td></tr>
     <tr><td>确认密码:<input type="password" name="rePassword" id="password" class="b1"/></td><td></td></tr> 
     <tr><td>验证码:&nbsp &nbsp&nbsp<input type="text" name="checkcode"  class="b1"/><td><img id="imgId" src="/UserManager/checkcode" onclick="show()"><span style="color:red;">${requestScope.yan}</span></td></tr>     	       
     <tr><td><input type="hidden" name="method" value="wang" /><input type="submit" value="提交" onclick="return validPwd()" class="button button2"></td></tr>
    <tr><td><a href="login.jsp"><input type="button" value="返回登录" class="button button2"></a></td></tr> 			               		       
     </table>
     </form>
  </body>
</html>
