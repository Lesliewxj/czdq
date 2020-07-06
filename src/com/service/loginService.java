package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;


import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.DB;
import com.orm.TAdmin;
import com.orm.Tcatelog;
import com.orm.Tuser;
import com.util.Cart;




public class loginService
{
	public String login(String userName,String userPw,int userType)
	{
		System.out.println(userType+"UUU"); 
		
		WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession(); 
		 
		 String result="no";
		 
		
		
		
		if(userType==0)//ϵͳ����Ա��½
		{
			String sql="select * from t_admin where userName=? and userPw=?";
			Object[] params={userName,userPw};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			try 
			{
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false)
				{
					 result="no";
				}
				else
				{
					 result="yes";
					 TAdmin admin=new TAdmin();
					 admin.setUserId(rs.getInt("userId"));
					 admin.setUserName(rs.getString("userName"));
					 admin.setUserPw(rs.getString("userPw"));
					 
					 session.setAttribute("userType", 0);
		             session.setAttribute("admin", admin);
				}
				rs.close();
			} 
			catch (SQLException e)
			{
				System.out.println("��¼ʧ�ܣ�");
				e.printStackTrace();
			}
			finally
			{
				mydb.closed();
			}
			
		}
		
		
		if(userType==1)
		{
			String sql="select * from t_user where userName=? and userPw=? and del='no'";
			Object[] params={userName,userPw};
			DB mydb=new DB();
			try
			{
				mydb.doPstm(sql, params);
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false)
				{
					result="no";
				}
				if(mark==true)
				{
					 result="yes";
					 
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
					
					 
					 session.setAttribute("userType", 1);
		             session.setAttribute("user", user);
		             
		             Cart cart=new Cart();
					 session.setAttribute("cart", cart);
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			mydb.closed();
		}
		if(userType==2)
		{
			
		}
		return result;
	}
	
	
	
	
	public String userlogin(String userName,String userPw,int userType)
	{
		    WebContext ctx = WebContextFactory.get(); 
		    HttpSession session=ctx.getSession();
		    String result="no";
		
			String sql="select * from t_user where loginname=? and loginpw=? and del='no'";
			Object[] params={userName,userPw};
			DB mydb=new DB();
			try
			{
				mydb.doPstm(sql, params);
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false)
				{
					result="no";
				}
				if(mark==true)
				{
					 result="yes";
					 
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
					
					 
					 session.setAttribute("userType", 1);
		             session.setAttribute("user", user);
		             
		             Cart cart=new Cart();
					 session.setAttribute("cart", cart);
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			mydb.closed();
		return result;
	}
	
	
	public String userLogout()
    {
    	try 
		{
			Thread.sleep(100);
		} 
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		
		session.setAttribute("userType", null);
        session.setAttribute("user", null);
		
		return "yes";
    }
	
	
    public String adminPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		
		String sql="update t_admin set userPw=? where userId=?";
		Object[] params={userPwNew,admin.getUserId()};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		
		return "yes";
    }
    
    
    public List catelogAll()
    {
    	try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	List catelogList=new ArrayList();
		String sql="select * from t_catelog where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tcatelog catelog=new Tcatelog();
				catelog.setId(rs.getString("id"));
				catelog.setName(rs.getString("name"));
				catelogList.add(catelog);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return catelogList;
    }
}
