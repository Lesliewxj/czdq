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
import com.orm.TTupian;



public class tupian_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.endsWith("tupianAdd"))
		{
			tupianAdd(req, res);
		}
		if(type.endsWith("tupianMana"))
		{
			tupianMana(req, res);
		}
		if(type.endsWith("tupianDel"))
		{
			tupianDel(req, res);
		}
	}
	
	
	public void tupianAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String xinwenId=req.getParameter("xinwenId");
		String jieshao=req.getParameter("jieshao").trim();
		String fujian=req.getParameter("fujian").trim();
		
		
		
		String sql="insert into t_tupian(id,xinwenId,jieshao,fujian) values(?,?,?,?)";
		Object[] params={id,xinwenId,jieshao,fujian};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "信息添加完毕");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
        
	}
	
	
	public void tupianMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String xinwenId=req.getParameter("xinwenId");
		
		List tupianList=new ArrayList();
		String sql="select * from t_tupian where xinwenId=?";
		Object[] params={xinwenId};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TTupian tupian=new TTupian();
				
				tupian.setId(rs.getString("id"));
				tupian.setXinwenId(rs.getString("xinwenId"));
				tupian.setJieshao(rs.getString("jieshao"));
				tupian.setFujian(rs.getString("fujian"));
				
				tupianList.add(tupian);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("tupianList", tupianList);
		req.setAttribute("xinwenId", xinwenId);
		req.getRequestDispatcher("admin/tupian/tupianMana.jsp").forward(req, res);
	}
	
	public void tupianDel(HttpServletRequest req,HttpServletResponse res)
	{
		String sql="delete from t_tupian where id=?";
		Object[] params={req.getParameter("id")};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
        req.setAttribute("msg", "信息删除完毕");
		
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
