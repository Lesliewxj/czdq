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
import com.orm.Tgoods;
import com.service.liuService;


public class goods_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("goodsAdd"))
		{
			goodsAdd(req, res);
		}
		if(type.endsWith("goodsMana"))
		{
			goodsMana(req, res);
		}
		if(type.endsWith("goodsDel"))
		{
			goodsDel(req, res);
		}
		if(type.endsWith("goodsDetailHou"))
		{
			goodsDetailHou(req, res);
		}
		if(type.endsWith("tejiaShezhi"))
		{
			tejiaShezhi(req, res);
		}
		
		
		if(type.endsWith("goodsNew"))
		{
			goodsNew(req, res);
		}
		if(type.endsWith("goodsByCatelog"))
		{
			goodsByCatelog(req, res);
		}
		if(type.endsWith("goodsDetailQian"))
		{
			goodsDetailQian(req, res);
		}
		if(type.endsWith("goodsRes"))
		{
			goodsRes(req, res);
		}
		
		if(type.endsWith("goodsAllTejia"))
		{
			goodsAllTejia(req, res);
		}
	}
	
	public void goodsAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=String.valueOf(new Date().getTime());
		String catelog_id=req.getParameter("catelog_id");
		String mingcheng=req.getParameter("mingcheng");
		String jieshao=req.getParameter("jieshao");
		
		String fujian=req.getParameter("fujian");
		int shichangjia=Integer.parseInt(req.getParameter("shichangjia"));
		String shifoutejia="否";
		int tejia=Integer.parseInt(req.getParameter("shichangjia"));

		String del="no";
		
		String sql="insert into t_goods values(?,?,?,?,?,?,?,?,?)";
		Object[] params={id,catelog_id,mingcheng,jieshao,fujian,shichangjia,shifoutejia,tejia,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void goodsMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getString("catelog_id"));
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				
				goods.setFujian(rs.getString("fujian"));
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setShifoutejia(rs.getString("shifoutejia"));
				goods.setTejia(rs.getInt("tejia"));
				
				goods.setDel(rs.getString("del"));
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("admin/goods/goodsMana.jsp").forward(req, res);
	}
	
	
	
	public void goodsDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String sql="update t_goods set del='yes' where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void goodsDetailHou(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
        String id=req.getParameter("id");
		
		req.setAttribute("goods", liuService.getGoods(id));
		req.getRequestDispatcher("admin/goods/goodsDetailHou.jsp").forward(req, res);
	}
	
	
	public void tejiaShezhi(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		int tejia=Integer.parseInt(req.getParameter("tejia"));
		System.out.println(id+"^^");
		String sql="update t_goods set shifoutejia='是', tejia=? where id=?";
		Object[] params={tejia,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "操作成功");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	public void goodsNew(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' and shifoutejia='否' order by id desc";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getString("catelog_id"));
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				
				goods.setFujian(rs.getString("fujian"));
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setShifoutejia(rs.getString("shifoutejia"));
				goods.setTejia(rs.getInt("tejia"));
				
				goods.setDel(rs.getString("del"));
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		if(goodsList.size()>4)
		{
			goodsList=goodsList.subList(0, 4);
		}
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("qiantai/goods/goodsNew.jsp").forward(req, res);
	}
	
	
	
	
	public void goodsByCatelog(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
        String catelog_id=req.getParameter("catelog_id");
		
		req.setAttribute("goodsList", liuService.goodsByCatelog(catelog_id));
		req.getRequestDispatcher("qiantai/goods/goodsByCatelog.jsp").forward(req, res);
	}
	
	public void goodsDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String id=req.getParameter("id");
		
		req.setAttribute("goods", liuService.getGoods(id));
		req.getRequestDispatcher("qiantai/goods/goodsDetailQian.jsp").forward(req, res);
	}
	
	
	public void goodsRes(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int jiage1=Integer.parseInt(req.getParameter("jiage1"));
		int jiage2=Integer.parseInt(req.getParameter("jiage2"));
		String mingcheng=req.getParameter("mingcheng").trim();
		
		List goodsList=new ArrayList();
		StringBuffer sql=new StringBuffer("select * from t_goods where del='no' and shifoutejia='否'");
		sql.append(" and mingcheng like '%"+mingcheng+"%'");
		sql.append(" and tejia >="+jiage1);
		sql.append(" and tejia <="+jiage2);
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql.toString(), params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getString("catelog_id"));
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				
				goods.setFujian(rs.getString("fujian"));
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setShifoutejia(rs.getString("shifoutejia"));
				goods.setTejia(rs.getInt("tejia"));
				
				goods.setDel(rs.getString("del"));
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		System.out.println(goodsList.size()+"YYY");
		req.getRequestDispatcher("qiantai/goods/goodsRes.jsp").forward(req, res);
	}
	
	
	public void goodsAllTejia(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' and shifoutejia='是'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getString("id"));
				goods.setCatelog_id(rs.getString("catelog_id"));
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				
				goods.setFujian(rs.getString("fujian"));
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setShifoutejia(rs.getString("shifoutejia"));
				goods.setTejia(rs.getInt("tejia"));
				
				goods.setDel(rs.getString("del"));
				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("qiantai/goods/goodsAllTejia.jsp").forward(req, res);
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
