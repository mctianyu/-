<%@ page language="java" import="java.util.*,org.bigjava.bean.User" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xiuguan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
    User editUser=(User)request.getSession().getAttribute("user");   
   %>
   <script type="text/javascript" charset="utf-8">
       function $(){
           return document.getElementsByName(arguments[0]);
        }
        function initial(){
       var objId=$("id")[0];
       var objName=$("username")[0];
       var objPass=$("password")[0];
       var objSex=$("gender");
       var objAi=$("love");
       var objRi=$("riqi")[0];
       var objAddress=$("neirong")[0];
       
            objId.value = '<%=editUser.getId() %>';
			objName.value = '<%=editUser.getUsername() %>';
			objPass.value = '<%=editUser.getPassword() %>';
			objRi.value = '<%=editUser.getRiqi() %>';
			// 性别
			var gender = '<%=editUser.getGender() %>';
			for (var i=0; i<objSex.length; i++) {
				if (objSex[i].value == gender) {
					objSex[i].checked = true;
				}
			}			
			// 爱好
			var strHobby = '<%= editUser.getLove() %>';
			var hobbys = strHobby.split(",");
			
			for (var i=0; i<hobbys.length; i++) {
				var currentHobby = hobbys[i];
				
				for (var j=0; j<objAi.length; j++) {
					
					if (currentHobby == objAi[j].value) {
						objAi[j].checked = true;
						break;
					}
				}
			}						
			// 家庭住址
			objAddress.innerText= '<%=editUser.getNeirong() %>';			
		}				               
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
  <body background="topian/qq.jpg" onload="initial()">
       <center><h3>修改用户</h3></center>
    	<form method="post" action="user" onsubmit="return check(),fuxuan()">
    	    <table border="0" width="600" align="center">   	    
    	    <tr><td width="20%">id:</td><td> <input type="text" name="id" readonly="readonly"   value=""/></td></tr>    
    		<tr><td>用户名:</td><td> <input type="text" name="username"  required="required" value=""/></td></tr>    		
    		<tr><td>修改密码: </td><td><input type="password" name="password"  id="password" required="required" value=""/></td></tr>	
    		<tr><td>确认密码:</td><td><input type="password" name="rePassword" required="required" id="password" value=""/></td></tr>  	
    		<tr><td><input type="radio"	name="gender" checked="checked" value="男">男</td><td><input type="radio"	name="gender"value="女">女</td></tr>
    		<tr><td><input type="checkbox" name="love" value="听音乐">听音乐&nbsp</td>
    		<td><input type="checkbox" name="love" value="打游戏">打游戏&nbsp
    		<input type="checkbox" name="love" value="看电影">看电影&nbsp</td></tr>
    		<tr><td>出生日期:</td>
    		<td><input type="date" name="riqi"/></td></tr>
    	    <tr><td>地址:</td>
    		<td><textarea  name="neirong" rows="2" cols="18" ><%= editUser.getNeirong()  %></textarea></td></tr>    		
    		<tr><td colspan="2"><input type="hidden" name="method" value="update" />
    		<input type="submit" value="提交" onclick="return validPwd()" class="button button2"/></td></tr>
    		<tr><td colspan="2"><input type = "reset" class="button button2"/></tr>
    		<tr><td colspan="2"><a href="index.jsp"><input type="button" value="返回首页" class="button button2"></a></td></tr>
    		</table>    		 
    	</form>    	       
  </body>
</html>
