package org.bigjava.biz;
import java.util.List;

import org.bigjava.bean.User;

public interface UserBiz {

	/**
	 *	注册
	 * @param user
	 */
	public void register(User user);
	
	/**
	 * 删除
	 * @param aUser
	 * @return
	 */
	public void banUser(User aUser);
	
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**	
	 * 修改
	 * @param user
	 * @return
	 */
	public void modify(User user);
	/*
	 * 修改密码
	 */
	public void xiu(User user);
	/*
	 * 校用户是否存在
	 */
	public boolean checkUsername(String name);		
		public List<User> arraylist();
		
		public User selectID(int id);//通过id获取用户				

		
}
