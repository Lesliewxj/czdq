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
import com.orm.TLiuyanban;
import com.orm.Tuser;
import com.service.liuService;


public class liuyanban_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
        if(type.endsWith("liuyanbanAdd"))
		{
			liuyanbanAdd(req, res);
		}
        if(type.endsWith("liuyanbanMana"))
		{
			liuyanbanMana(req, res);
		}
		if(type.endsWith("liuyanbanDel"))
		{
			liuyanbanDel(req, res);
		}
		if(type.endsWith("liuyanbanHuifu"))
		{
			liuyanbanHuifu(req, res);
		}
		if(type.endsWith("liuyanbanAll"))
		{
			liuyanbanAll(req, res);
		}
		if(type.endsWith("liuyanbanDetail"))
		{
			liuyanbanDetail(req, res);
		}
		
		
	}
	
	
	public void liuyanbanAdd(HttpServletRequest req,HttpServletResponse res)
	{
		
		HttpSession session=req.getSession();
		Tuser user=(Tuser)session.getAttribute("user");
		
		String id=String.valueOf(new Date().getTime());
		String neirong=req.getParameter("neirong");
		String liuyanshi=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		String user_id="0";
		
		String huifu="";
		String huifushi="";
		
		String sql="insert into t_liuyanban values(?,?,?,?,?,?)";
		Object[] params={id,neirong,liuyanshi,user_id,huifu,huifushi};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "留言完毕");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void liuyanbanMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List liuyanbanList=new ArrayList();
		String sql="select * from t_liuyanban order by liuyanshi";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TLiuyanban liuyanban=new TLiuyanban();
				
				liuyanban.setId(rs.getString("id"));
				liuyanban.setNeirong(rs.getString("neirong"));
				liuyanban.setLiuyanshi(rs.getString("liuyanshi"));
				liuyanban.setUser_id(rs.getString("user_id"));
				
				liuyanban.setHuifu(rs.getString("huifu"));
				liuyanban.setHuifushi(rs.getString("huifushi"));
			
				//liuyanban.setUser(liuService.get_user(rs.getString("user_id")));
				liuyanbanList.add(liuyanban);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("liuyanbanList", liuyanbanList);
		req.getRequestDispatcher("admin/liuyanban/liuyanbanMana.jsp").forward(req, res);
	}
	
	public void liuyanbanDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String sql="delete from t_liuyanban where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void liuyanbanHuifu(HttpServletRequest req,HttpServletResponse res)
	{
		String huifu=req.getParameter("huifu");
		String huifushi=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		String id=req.getParameter("id");
		
		String sql="update t_liuyanban set huifu=?,huifushi=? where id=?";
		Object[] params={huifu,huifushi,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "回复完毕完毕");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}

	public void liuyanbanAll(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List liuyanbanList=new ArrayList();
		String sql="select * from t_liuyanban order by liuyanshi";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TLiuyanban liuyanban=new TLiuyanban();
				
				liuyanban.setId(rs.getString("id"));
				liuyanban.setNeirong(rs.getString("neirong"));
				liuyanban.setLiuyanshi(rs.getString("liuyanshi"));
				liuyanban.setUser_id(rs.getString("user_id"));
				
				liuyanban.setHuifu(rs.getString("huifu"));
				liuyanban.setHuifushi(rs.getString("huifushi"));
			
				//liuyanban.setUser(liuService.get_user(rs.getString("user_id")));
				
				liuyanbanList.add(liuyanban);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("liuyanbanList", liuyanbanList);
		req.getRequestDispatcher("qiantai/liuyanban/liuyanbanAll.jsp").forward(req, res);
	}
	
	public void liuyanbanDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		
		req.setAttribute("liuyanban", get_liuyanban(id));
		req.getRequestDispatcher("qiantai/liuyanban/liuyanbanDetail.jsp").forward(req, res);
	}
	
	
	public TLiuyanban get_liuyanban(String id)
	{
		TLiuyanban liuyanban=new TLiuyanban();
		
		String sql="select * from t_liuyanban where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				liuyanban.setId(rs.getString("id"));
				liuyanban.setNeirong(rs.getString("neirong"));
				liuyanban.setLiuyanshi(rs.getString("liuyanshi"));
				liuyanban.setUser_id(rs.getString("user_id"));
				
				liuyanban.setHuifu(rs.getString("huifu"));
				liuyanban.setHuifushi(rs.getString("huifushi"));
			
				//liuyanban.setUser(liuService.get_user(rs.getString("user_id")));
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return liuyanban;
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
