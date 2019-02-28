package org.bigjava.biz.impl;
import java.util.List;
import org.bigjava.bean.User;
import org.bigjava.biz.UserBiz;
import org.bigjava.dao.UserDao;
import org.bigjava.dao.impl.UserDaoImpl;

public class UserBizImpl implements UserBiz {
	
	private UserDao ud = new UserDaoImpl();

	@Override
	public void register(User user) {//注册
		ud.addUser(user);
	}

	@Override
	public void banUser(User aUser) {//删除
		 ud.delUser(aUser);
	}

	@Override
	public User login(User user) {//登录		
		return ud.getUser(user);
	}

	public void modify(User user) {//修改
		 ud.updateUser(user);
	}
	public void xiu(User user){//修改密码
		ud.wangUser(user);
	}
	
	public boolean checkUsername(String name){//查找用户是否存在
		return ud.chahao(name);
	}
	
	public List<User> arraylist() {	
		return ud.arrarlist();
	}
	
	public User selectID(int id) {//通过id查找用户
		return ud.selectID(id);
	}
	
	}
	
