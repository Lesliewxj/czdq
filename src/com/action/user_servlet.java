package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.Tuser;


public class user_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.endsWith("userReg"))
		{
			userReg(req, res);
		}
		if(type.endsWith("userMana"))
		{
			userMana(req, res);
		}
		if(type.endsWith("userDel"))
		{
			userDel(req, res);
		}
		if(type.endsWith("userEditMe"))
		{
			userEditMe(req, res);
		}
	}
	
	
	public void userReg(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String userName=req.getParameter("userName");
		String userPw=req.getParameter("userPw");
		String userRealname=req.getParameter("userRealname");
		
		String userSex=req.getParameter("userSex");
		String userAge=req.getParameter("userAge");
		String userAddress=req.getParameter("userAddress");
		String userTel=req.getParameter("userTel");
		
		String del="no";
		
		String sql="insert into t_user values(?,?,?,?,?,?,?,?,?)";
		Object[] params={id,userName,userPw,userRealname,userSex,userAge,userAddress,userTel,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "注册成功，请登录");
		req.setAttribute("path", "qiantai/default.jsp");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
        
	}
	
	

	public void userMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List userList=new ArrayList();
		String sql="select * from t_user where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tuser user=new Tuser();
				
				user.setId(rs.getString("id"));
				user.setUserName(rs.getString("userName"));
				user.setUserPw(rs.getString("userPw"));
				user.setUserRealname(rs.getString("userRealname"));
				
				user.setUserSex(rs.getString("userSex"));
				user.setUserAge(rs.getString("userAge"));
				user.setUserAddress(rs.getString("userAddress"));
				user.setUserTel(rs.getString("userTel"));
				
				user.setDel(rs.getString("del"));
				
				userList.add(user);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin/user/userMana.jsp").forward(req, res);
	}
	
	
	public void userDel(HttpServletRequest req,HttpServletResponse res)
	{
        String id=req.getParameter("id");
		
		String sql="update t_user set del='yes' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void userEditMe(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String userName=req.getParameter("userName");
		String userPw=req.getParameter("userPw");
		String userRealname=req.getParameter("userRealname");
		
		String userSex=req.getParameter("userSex");
		String userAge=req.getParameter("userAge");
		String userAddress=req.getParameter("userAddress");
		String userTel=req.getParameter("userTel");
		
		String del="no";
		
		String sql="update t_user set userName=?,userPw=?,userRealname=?,userSex=?,userAge=?,userAddress=?,userTel=? where id=?";
		Object[] params={userName,userPw,userRealname,userSex,userAge,userAddress,userTel,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "信息修改成功，重新登陆后生效");
		
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
