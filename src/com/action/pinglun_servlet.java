package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DB;
import com.orm.Tpinglun;
import com.orm.Tuser;
import com.service.liuService;



public class pinglun_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.endsWith("pinglunAdd"))
		{
			pinglunAdd(req, res);
		}
		if(type.endsWith("pinglunAll"))
		{
			pinglunAll(req, res);
		}
		if(type.endsWith("pinglunMana"))
		{
			pinglunMana(req, res);
		}
		if(type.endsWith("pinglunDel"))
		{
			pinglunDel(req, res);
		}
	}
	
	
	public void pinglunAdd(HttpServletRequest req,HttpServletResponse res)
	{
		HttpSession session=req.getSession();
		Tuser user=(Tuser)session.getAttribute("user");
		
		String neirong=req.getParameter("neirong");
		String shijian=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		String goods_id=req.getParameter("goods_id");
		String user_id=user.getId();
		
		
		String sql="insert into t_pinglun(neirong,shijian,goods_id,user_id) values(?,?,?,?)";
		Object[] params={neirong,shijian,goods_id,user_id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "评论完毕");
		
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void pinglunAll(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String goods_id=req.getParameter("goods_id");
		
		List pinglunList=new ArrayList();
		String sql="select * from t_pinglun where goods_id=? order by shijian desc";
		Object[] params={goods_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tpinglun pinglun=new Tpinglun();
				
				pinglun.setId(rs.getInt("id"));
				pinglun.setNeirong(rs.getString("neirong"));
				pinglun.setShijian(rs.getString("shijian"));
				pinglun.setGoods_id(rs.getString("goods_id"));
				
				pinglun.setUser_id(rs.getString("user_id"));
				pinglun.setUser(liuService.get_user(rs.getString("user_id")));
				
				pinglunList.add(pinglun);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("pinglunList", pinglunList);
		
		req.setAttribute("pinglunList", pinglunList);
		req.getRequestDispatcher("qiantai/pinglun/pinglunAll.jsp").forward(req, res);
	}
	
	
	public void pinglunMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String goods_id=req.getParameter("goods_id");
		
		List pinglunList=new ArrayList();
		String sql="select * from t_pinglun where goods_id=? order by shijian desc";
		Object[] params={goods_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tpinglun pinglun=new Tpinglun();
				
				pinglun.setId(rs.getInt("id"));
				pinglun.setNeirong(rs.getString("neirong"));
				pinglun.setShijian(rs.getString("shijian"));
				pinglun.setGoods_id(rs.getString("goods_id"));
				
				pinglun.setUser_id(rs.getString("user_id"));
				
				pinglun.setUser(liuService.get_user(rs.getString("user_id")));
				
				pinglunList.add(pinglun);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("pinglunList", pinglunList);
		
		req.setAttribute("pinglunList", pinglunList);
		req.getRequestDispatcher("admin/pinglun/pinglunMana.jsp").forward(req, res);
	}
	
	
	public void pinglunDel(HttpServletRequest req,HttpServletResponse res)
	{
		String sql="delete from t_pinglun where id="+req.getParameter("id");
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		
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
