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

import com.dao.DB;
import com.orm.TAdmin;
import com.orm.TGuanggao;

public class guanggao_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.endsWith("guanggaoAdd"))
		{
			guanggaoAdd(req, res);
		}
		if(type.endsWith("guanggaoMana"))
		{
			guanggaoMana(req, res);
		}
		if(type.endsWith("guanggaoDel"))
		{
			guanggaoDel(req, res);
		}
		if(type.endsWith("guanggaoDetailHou"))
		{
			guanggaoDetailHou(req, res);
		}
		
		if(type.endsWith("guanggaoAll"))
		{
			guanggaoAll(req, res);
		}
		if(type.endsWith("guanggaoDetailQian"))
		{
			guanggaoDetailQian(req, res);
		}
	}
	
	
	public void guanggaoAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String biaoti=req.getParameter("biaoti");
		String neirong=req.getParameter("neirong");
		String fujian=req.getParameter("fujian");
		
		String shijian=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		
		
		String sql="insert into t_guanggao values(?,?,?,?,?)";
		Object[] params={id,biaoti,neirong,fujian,shijian};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
        
	}
	
	
	

	public void guanggaoMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List guanggaoList=new ArrayList();
		String sql="select * from t_guanggao";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TGuanggao guanggao=new TGuanggao();
				
				guanggao.setId(rs.getString("id"));
				guanggao.setBiaoti(rs.getString("biaoti"));
				guanggao.setNeirong(rs.getString("neirong"));
				guanggao.setFujian(rs.getString("fujian"));
				
				guanggao.setShijian(rs.getString("shijian"));
				
				guanggaoList.add(guanggao);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("guanggaoList", guanggaoList);
		req.getRequestDispatcher("admin/guanggao/guanggaoMana.jsp").forward(req, res);
	}
	
	
	public void guanggaoDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_guanggao where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void guanggaoDetailHou(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		TGuanggao guanggao=new TGuanggao();
		
		String sql="select * from t_guanggao where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			guanggao.setId(rs.getString("id"));
			guanggao.setBiaoti(rs.getString("biaoti"));
			guanggao.setNeirong(rs.getString("neirong"));
			guanggao.setFujian(rs.getString("fujian"));
			
			guanggao.setShijian(rs.getString("shijian"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("guanggao", guanggao);
		req.getRequestDispatcher("admin/guanggao/guanggaoDetailHou.jsp").forward(req, res);
	}
	
	
	public void guanggaoAll(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List guanggaoList=new ArrayList();
		String sql="select * from t_guanggao";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TGuanggao guanggao=new TGuanggao();
				
				guanggao.setId(rs.getString("id"));
				guanggao.setBiaoti(rs.getString("biaoti"));
				guanggao.setNeirong(rs.getString("neirong"));
				guanggao.setFujian(rs.getString("fujian"));
				
				guanggao.setShijian(rs.getString("shijian"));
				
				guanggaoList.add(guanggao);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("guanggaoList", guanggaoList);
		req.getRequestDispatcher("qiantai/guanggao/guanggaoAll.jsp").forward(req, res);
	}
	
	public void guanggaoDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		TGuanggao guanggao=new TGuanggao();
		
		String sql="select * from t_guanggao where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			guanggao.setId(rs.getString("id"));
			guanggao.setBiaoti(rs.getString("biaoti"));
			guanggao.setNeirong(rs.getString("neirong"));
			guanggao.setFujian(rs.getString("fujian"));
			
			guanggao.setShijian(rs.getString("shijian"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("guanggao", guanggao);
		req.getRequestDispatcher("/qiantai/guanggao/guanggaoDetailQian.jsp").forward(req, res);
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
