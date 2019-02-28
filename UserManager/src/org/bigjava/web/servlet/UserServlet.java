package org.bigjava.web.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bigjava.bean.User;
import org.bigjava.biz.UserBiz;
import org.bigjava.biz.impl.UserBizImpl;
import org.bigjava.common.CommonUtil;


public class UserServlet extends HttpServlet {
	private UserBiz ub = new UserBizImpl();	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");//防止中文乱码
		// 用户选择的方法		
		String userMethod = req.getParameter("method");								
		// 注册
		if (userMethod.equals("reg") ) {			
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String gender=req.getParameter("gender");
			String[] love=req.getParameterValues("love");
			String shagou="";
			for(int i=0;i<love.length;i++){
				shagou+=love[i]+",";
			}
			String riqi=req.getParameter("riqi");
			String neirong=req.getParameter("neirong");
			String guanli=req.getParameter("guanli");
			if(ub.checkUsername(username)){
				req.setAttribute("errorInfo","用户名已存在!");
				req.getRequestDispatcher("register.jsp").forward(req, resp);
			}else{
			
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setGender(gender);
			user.setLove(shagou);
			user.setRiqi(riqi);
			user.setNeirong(neirong);
			user.setGuanli(guanli);
			ub.register(user);						
			resp.sendRedirect("login.jsp");
			}
		//管理修改
		}else if(userMethod.equals("update")){			
			String username=req.getParameter("username");
			String password=req.getParameter("password");
			String gender=req.getParameter("gender");
			String[] love=req.getParameterValues("love");
			String shagou="";
			for(int i=0;i<love.length;i++){
				shagou+=love[i]+",";
			}
			String riqi=req.getParameter("riqi");
			String neirong=req.getParameter("neirong");
			User user = new User();
			user.setId(Integer.parseInt(req.getParameter("id")));
			user.setUsername(username);			
			user.setPassword(password);
			user.setGender(gender);
			user.setLove(shagou);
			user.setRiqi(riqi);
			user.setNeirong(neirong);
			ub.modify(user);
			req.getRequestDispatcher("login.jsp").forward(req, resp);
			//用户修改
		}else if(userMethod.equals("xiugai")){
			String username=req.getParameter("username");
			String password=req.getParameter("password");
			String gender=req.getParameter("gender");
			String[] ai=req.getParameterValues("love");
			String love="";
			for(int i=0;i<ai.length;i++){
				love+=ai[i]+",";
			}
			
			String riqi=req.getParameter("riqi");
			String neirong=req.getParameter("neirong");
			User user = new User();
			user.setId(Integer.parseInt(req.getParameter("id")));
			user.setUsername(username);			
			user.setPassword(password);
			user.setGender(gender);
			user.setLove(love);
			user.setRiqi(riqi);
			user.setNeirong(neirong);
			ub.modify(user);
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		//修改密码
		else if(userMethod.equals("wang")){
			String formcode = req.getParameter("checkcode");
			String sesscode = (String) req.getSession().getAttribute("sesscode");			
           if(formcode == null || !sesscode.equals(formcode)){
				// 给用户提示，说明验证码输入错误
				req.setAttribute("yan", "验证码错误");
				req.getRequestDispatcher("wang.jsp").forward(req, resp);
				return;
			}
			String username=req.getParameter("username");
			String password=req.getParameter("password");
			String rePassword=req.getParameter("rePassword");
			if(username.equals("")){
				req.setAttribute("bu", "用户名密码不能为空！");
				req.getRequestDispatcher("wang.jsp").forward(req, resp);
				return;
			}	
			if(ub.checkUsername(username)){
				User user=new User();
				user.setUsername(username);
				user.setPassword(password);
				ub.xiu(user);
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}else{		
			req.setAttribute("bu","该用户不存在!");
			req.getRequestDispatcher("wang.jsp").forward(req, resp);
			}
		}
		//删除
		else if(userMethod.equals("sc")){			
			User user = new User();
			user.setId(Integer.parseInt(req.getParameter("id")));			
			ub. banUser(user);
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}		
		//查询所有用户
		else if(userMethod.equals("fetchAll")){			
			List<User> list=ub.arraylist();
			req.setAttribute("userList", list);
			req.getRequestDispatcher("userList.jsp").forward(req, resp);
		}		
			//登录		
		    else if (userMethod.equals("login")) {				
			String username = req.getParameter("username");
			String password = req.getParameter("password");						
			User loginUser = new User();
            loginUser.setUsername(username);
			loginUser.setPassword(password);			
			User user = ub.login(loginUser);
			if (user == null) {				
				req.setAttribute("cuowu","用户名或密码错误!");
				System.out.println("登录失败");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
				return;
			}
			System.out.println(user.getGuanli());
			if(user.getGuanli()== null){				
				resp.sendRedirect("login.jsp");
				return;
			}
			else if(user.getGuanli().equals("用户")){
				req.getSession().setAttribute("idhao", user.getId());
				req.getSession().setAttribute("currentUser", user.getUsername());
				req.getSession().setAttribute("xinbie", user.getGender());
				req.getSession().setAttribute("aihao", user.getLove());
				req.getSession().setAttribute("mima", user.getPassword());			
		   	 	req.getSession().setAttribute("chushen",user.getRiqi());
		   	 	req.getSession().setAttribute("dizhi",user.getNeirong());		   	   		   	    
		   	    //接收user里面的属性
				req.getSession().setAttribute("user", user);			
				String jizhu=req.getParameter("jizhu");
				if("on".equals(jizhu)){
				  //构造Cookie
					Cookie cookies=new Cookie("a2",URLEncoder.encode(username,"utf-8"));//防止中文乱码
					Cookie cookies1=new Cookie("b2",URLEncoder.encode(password,"utf-8"));
					//设置过期时间
					cookies.setMaxAge(30);
					cookies1.setMaxAge(30);
					//储存
					resp.addCookie(cookies);
					resp.addCookie(cookies1);
					System.out.println("登录成功");					
				}
		   	    req.getRequestDispatcher("putong.jsp").forward(req, resp);
				return;
			}				
			//接收user里面的属性
			req.getSession().setAttribute("user", user);			
			String jizhu=req.getParameter("jizhu");
			if("on".equals(jizhu)){
			  //构造Cookie
				Cookie cookies=new Cookie("a2",URLEncoder.encode(username,"utf-8"));//防止中文乱码
				Cookie cookies1=new Cookie("b2",URLEncoder.encode(password,"utf-8"));
				//设置过期时间
				cookies.setMaxAge(30);
				cookies1.setMaxAge(30);
				//储存
				resp.addCookie(cookies);
				resp.addCookie(cookies1);				
			}
			//存储单个用户信息
			System.out.println("登录成功");
			req.getSession().setAttribute("ming", user.getUsername());
			req.getSession().setAttribute("sex", user.getGender());			
			req.getSession().setAttribute("ai", user.getLove());	
	   	 	req.getSession().setAttribute("ri",user.getRiqi());
	   	 	req.getSession().setAttribute("di",user.getNeirong());	
			req.getRequestDispatcher("index.jsp").forward(req, resp);
			return;
			}
		}		
		// setting encoding				
	}

