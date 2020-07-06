package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TAdmin;
import com.orm.Tlianjie;

public class lianjie_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("lianjieAdd"))
		{
			lianjieAdd(req, res);
		}
		
		if(type.endsWith("lianjieMana"))
		{
			lianjieMana(req, res);
		}
		if(type.endsWith("lianjieDel"))
		{
			lianjieDel(req, res);
		}
	}
	
	
	
	
	public void lianjieAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String mingcheng=req.getParameter("mingcheng");
		String www=req.getParameter("www");
		
		String sql="insert into t_lianjie(mingcheng,www) values(?,?)";
		Object[] params={mingcheng,www};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void lianjieMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List lianjieList=new ArrayList();
		String sql="select * from t_lianjie";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tlianjie lianjie=new Tlianjie();
				lianjie.setId(rs.getInt("id"));
				lianjie.setMingcheng(rs.getString("mingcheng"));
				lianjie.setWww(rs.getString("www"));
				lianjieList.add(lianjie);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("lianjieList", lianjieList);
		req.getRequestDispatcher("admin/lianjie/lianjieMana.jsp").forward(req, res);
	}
	
	public void lianjieDel(HttpServletRequest req,HttpServletResponse res)
	{
		String sql="delete from t_lianjie where id="+Integer.parseInt(req.getParameter("id"));
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
