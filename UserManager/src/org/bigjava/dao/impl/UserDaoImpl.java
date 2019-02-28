package org.bigjava.dao.impl;
import java.sql.*;
import java.util.*;
import org.bigjava.bean.User;
import org.bigjava.dao.UserDao;
import org.bigjava.dao.UserDaolei;
public class UserDaoImpl extends UserDaolei implements UserDao {	
    private final String a1="com.mysql.jdbc.Driver";
    private final String b1="jdbc:mysql://localhost:3306/mybd?characterEncoding=utf-8";
    private final String c1="root";
    private final String d1="123456";         
	@Override
	//注册用户
	public void addUser(User user) {
		String sql ="insert into user(username,password,gender,love,riqi,neirong,guanli) "
				+ "values(?,?,?,?,?,?,?)";
		try {
					int row=executeUpdate(sql, new String[]{user.getUsername(),user.getPassword(),user.getGender(),user.getLove(),user.getRiqi(),user.getNeirong(),user.getGuanli()});
					System.out.println("注册用户");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			fan();		
		}
	}	
       //修改用户
	@Override
	public void updateUser(User user) {		
	try{				
		String sql = "update user set username=?,password=?, gender=?, " +
				"love=?,riqi=?, neirong=? where id=?";
		int row=executeUpdate(sql, new Object[]{user.getUsername(),user.getPassword(),user.getGender(),user.getLove(),user.getRiqi(),user.getNeirong(),user.getId()});
		System.out.println("修改用户");
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		fan();
	}
	}
	public void wangUser(User user) {		
		try{
			
			String sql = "update user set password=?  where username=?";
			int row=executeUpdate(sql, new Object[]{user.getPassword(),user.getUsername()});
			System.out.println("修改密码");
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			fan();
		}
		}
	//查询用户
	public User getUser(User user) {		
		String sql ="select * from user "
				+ " where username=? and password = ?";
		User u = null;
		try {
			ResultSet rs=executeQuery(sql,new String[]{user.getUsername(),user.getPassword()});
			if (rs.next()) {
				u = new User(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			fan();	
		}
		System.out.println(">>登录");
		return u;
	}
	  public boolean chahao(String name){
		  String sql = "select 1 from user"
					+ " where username=?";
			boolean flag = false;
			try{
				Class.forName(a1);
				conn = DriverManager.getConnection(b1,c1,d1);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,name);
				rs=pstmt.executeQuery();
				if(rs.next()){
					//查询到相同的用户名
					flag=true;
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
					fan();			
			}		
					return flag;
				}		 	  
     //删除
	@Override
	public void delUser(User user) {
		try{		
			String sql = " delete from user where id=?";
			int row=executeUpdate(sql, new Object[]{user.getId()});
			System.out.println("删除用户");
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			fan();
		}		
		}
	/**
	 * 查询全部用户
	 * @author pengxin
	 */
	public List<User> arrarlist() {
		ArrayList<User> al=new ArrayList<User>();//用list存user的值
		Connection conn=null;
		PreparedStatement pstmt=null;		
		try {
			
			String sql="select * from user";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybd","root","123456");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setPassword(rs.getString(3));
				u.setGender(rs.getString(4));
				u.setLove(rs.getString(5));
				u.setRiqi(rs.getString(6));
				u.setNeirong(rs.getString(7));
				u.setGuanli(rs.getString(8));
				al.add(u);
			}			
			return al;
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			fan();
		}		
		return null;
	}	
	@Override
	/**
	 * 通过ID获取用户
	 */
	public User selectID(int id) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			String sql="select * from user where id=?";
			Class.forName("com.jdbc.mysql.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mybd","root","123456");
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);			
			rs=pstmt.executeQuery();			
			if (rs.next()) {
				User u = new User();
				u.setId(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setPassword(rs.getString(3));
				u.setGender(rs.getString(4));
				u.setLove(rs.getString(5));
				u.setRiqi(rs.getString(6));
				u.setNeirong(rs.getString(7));
				System.out.println("id获取用户成功");
				return u;
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally { 
			if(rs!=null) {
				try {
					rs.close();
				} catch(Exception ex) {
					ex.printStackTrace();
				}
			}
			fan();
		}
		return null;
	}	
}
			
	  

	  
	
	  


