<%@ page language="java" import="java.util.*,java.net.*"  pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
     request.setCharacterEncoding("utf-8");
     String name1="";
     String password2="";
     Cookie[] cookies=request.getCookies();
     if(cookies!=null && cookies.length>1){
     for(Cookie cookie :cookies){
     if(cookie.getName().equals("a2")){
          name1=URLDecoder.decode(cookie.getValue(),"utf-8");
          request.setAttribute("name",name1);
          }
          if(cookie.getName().equals("b2")){
          password2=URLDecoder.decode(cookie.getValue(),"utf-8");
          request.setAttribute("password",password2);
            }
            }
            }
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
	
	<script>
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
  <style type="text/css">
    .b1{
    width:180px;
    height:25px;
    }
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
   a{color:#000;
    text-decoration: none;
    }
    a:hover{color:#000;
   txt-decoration:underline;
   }
  </style>
  <body background="topian/qq.jpg">
            <div style="width:300px;height:290px;border:1px solid #ccc;background-color:#FFF0F5;position:absolute;left:600;top:100;">
    	       <br/>
    	    <center><h3>用户管理系统登录页</h3> </center>
    	    <form method="post" action="user">   	   
    	    <table border="0">
    	   <tr><td>用户名:</td><td><input type="text" name="username" required="required" class="b1" id="name1" value="${requestScope.name}" /></td></tr>
    	   <tr><td>密 &nbsp&nbsp&nbsp码:</td><td><input type="password" name="password" id="password1" required="required" class="b1" value="${requestScope.password}"/></td></tr>
    	   <tr><td colspan="2"><input type="checkbox" name="jizhu"/>记住用户名密码 &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp<a href="wang.jsp">忘记密码</td></a></tr>
    	   <tr><td colspan="2"><span style="color:blue;">${requestScope.cuowu}</span></td></tr>      	         	      	      	 
    	   <tr><td colspan="2"><input type="hidden" name="method" value="login" /><input type="submit" value="登录" onclick="return validPwd()" class="a1 button button2"/></td> </tr>   	  
    	   <tr><td colspan="2"><a href="register.jsp"><input type="button" value="注册" class="button button2"/></a></td></tr>		    		
    		</table>
    	     </form>  
    	     </div>    	     
  </body>
</html>
