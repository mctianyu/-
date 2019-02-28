package org.bigjava.dao;
import java.io.IOException;
import java.sql.*;

public class UserDaolei {
       protected Connection conn=null;
       protected PreparedStatement pstmt=null;
       protected ResultSet rs=null;       
       private final String a1="com.mysql.jdbc.Driver";
       private final String b1="jdbc:mysql://localhost:3306/mybd?characterEncoding=utf-8";
       private final String c1="root";
       private final String d1="123456";
      /**
       * 获得JDBC连接
       * 链接对象
       */
   		public Connection getConnection()throws Exception{
   			Class.forName(a1);
   			conn =DriverManager.getConnection(b1,c1,d1);
   			return conn;
   		}
   		/**
   		 * 释放资源
   		 */
   		public void fan(){
   			if(conn!=null){
   				try{
   					conn.close();
   				}catch(Exception ex){
   					ex.printStackTrace();
   				}
   			}if(pstmt!=null){
   				try{
   					pstmt.close();
   				}catch(Exception ex){
   					ex.printStackTrace();
   				}
   			}
   			if(rs!=null){
   				try{
   					rs.close();
   				}catch(Exception ex){
   					ex.printStackTrace();
   				}
   			}	
   		}
   		/**
   		 * 添删改方法
   		 */
   		public int executeUpdate(String sql,Object[] objects)throws Exception{
   			conn=this.getConnection();
   			pstmt=conn.prepareStatement(sql);
   			if(objects!=null&&objects.length>0){
   				for(int i=0;i<objects.length;i++){
   					pstmt.setObject((i+1), objects[i]);
   				}
   			}
   			int row=pstmt.executeUpdate();
   			return row;
   		}
   		public ResultSet executeQuery(String sql,String[] objects)throws Exception{
   			conn=this.getConnection();
   			pstmt=conn.prepareStatement(sql);
   			if(objects!=null&&objects.length>0){
   				for(int i=0;i<objects.length;i++)
   					pstmt.setObject((i+1), objects[i]);
   				}
   				return pstmt.executeQuery();
   			}
}

