package org.bigjava.dao;

import org.bigjava.bean.User;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;
/**
 * 数据访问
 * @author Lenovo
 *
 */
public interface UserDao {
	/**
	 * 添加
	 * @param user
	 */
	public void addUser(User user);	
	/**
	 * 删除
	 * @param user
	 * @return
	 */
	public void delUser(User user);
	/**
	 * 修改
	 * @param user
	 * @return
	 */
	public void updateUser(User user);
	/*
	 * 修改密码
	 */
	public void  wangUser(User user);
	/**
	 * 查询登录
	 * @param user
	 * @return
	 */
	public User getUser(User user);
	/*
	 * jstl方法查询所有用户信息
	 */	
	public boolean chahao(String name);
	/**
	 * 查询全部
	 * @author pengxin
	 *
	 */        
	public java.util.List<User> arrarlist();	
	/**
	 * 通过ID获取用户
	 * @author pengxin
	 */	
	public User selectID(int id);
		
}
