<%@ page language="java" import="java.util.*,org.bigjava.bean.User" pageEncoding="utf-8"%>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userList.jsp' starting p7age</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!--window.location.href当前页面打开URL页面-->
  <style type="text/css">
	body{color:#ffffff}
	</style>
  <body background="topian/qq.jpg">
  <center> <h3>管理用户</h3></center> 
   <table width="70%" align="center" border="0">
 <%!
  	    // 计算总页数的方法
  	 	// 根据总记录条数和每页显示数量 确定分页页数
  	 	// totalCount: 总条数, 总记录数
  	 	// pageOfCount: 每页显示几条
  	 	// 返回值: 总页数
  	 	public int getTotalPages(int zong, int meiye){
    		int totalPage =0; 
    		totalPage = (zong%meiye ==0)?
    		(zong/meiye):(zong/meiye+1);
    		return totalPage;
		}
  	  %>  	 	 
  	 <%
  	 	// 每页显示条数
  	 	int meiye = 8;
  	 	// 获得总条数
  	 	int zong = 0;	//  select count(*) from user;
  	 	// 总页数
  	 	int totalPage;
  	 	// 当前第几页
  	 	int pageIndex;
  	 	Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/user");
		Connection conn = ds.getConnection();		
		String sql = "select count(*) from user";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();		
		if (rs.next()) {
			zong = rs.getInt(1);
		}		
		// 计算总页数
  	 	totalPage = getTotalPages(zong, meiye);  	  	 	
  	 	// 如果获取不到当前页数, 默认为第一页
  	 	String strPageIndex = request.getParameter("pageIndex");
  	 	if (strPageIndex == null) {
  	 		strPageIndex = "1";
  	 	} 
  	 	pageIndex = Integer.parseInt(strPageIndex);  	 	
  	 	// 特殊处理
  	 	if (pageIndex < 1) pageIndex = 1;
  	 	if (pageIndex > totalPage) pageIndex = totalPage; 	 	
  	 	// sql limit 参数
		int offset, length;	
		offset = meiye * (pageIndex-1);
		length = meiye;		
	    sql = "select * from user limit ?,?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, offset);
		pstmt.setInt(2, length);
		rs = pstmt.executeQuery();				        		
  	  %>  	
  		<tr>
  			<td>用户Id:</td>
  			<td>用户名:</td>
  			<td>密码:</td>
  			<td>性别:</td>
  			<td>爱好:</td>
  			<td>日期:</td>
  			<td>地址:</td>
  			<td>用户类型:</td>
  			<td>修改操作:</td>
  			<td>删除操作:</td>
  			
  		</tr>  
  		<% 
      while(rs.next()){
      %> 
       <tr>
       <td><%=rs.getInt(1) %></td>
       <td><%=rs.getString(2) %></td>
       <td><%=rs.getString(3) %></td>
       <td><%=rs.getString(4) %></td>
       <td><%=rs.getString(5) %></td>
       <td><%=rs.getString(6) %></td>
       <td><%=rs.getString(7) %></td>
        <td><%=rs.getString(8) %></td>
       <td><a href="xiuguan.jsp"><input type="button" value="修改账号"></a></td>
       <td><a href="shanchu.jsp"><input type="button" value="删除账号"></a></td>
       </tr>
       <%
       }          
    %>
    </table></br>  
          <center><a href="userList.jsp?pageIndex=1"><input type="button" value="首页"></a></a>&nbsp;
	 	  <a href="userList.jsp?pageIndex=<%= pageIndex-1%>"><input type="button" value="上一页"></a>
		  <a href="userList.jsp?pageIndex=<%= pageIndex+1%>"><input type="button" value="下一页"></a>
		  <a href="userList.jsp?pageIndex=<%= totalPage%>"><input type="button" value="尾页"></a>
          <a href="index.jsp"><input type="button" value="返回首页"></a></center>           
  </body>
</html>
