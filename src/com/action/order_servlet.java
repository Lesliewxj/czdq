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
import com.orm.Tgoods;
import com.orm.Torder;
import com.service.liuService;


public class order_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("orderMana"))
		{
			orderMana(req, res);
		}
		if(type.endsWith("orderDel"))
		{
			orderDel(req, res);
		}
		if(type.endsWith("orderShouli"))
		{
			orderShouli(req, res);
		}
		if(type.endsWith("orderRes"))
		{
			orderRes(req, res);
		}
		if(type.endsWith("orderDetailHou"))
		{
			orderDetailHou(req, res);
		}
		
		if(type.endsWith("tongjiRes"))
		{
			tongjiRes(req, res);
		}
	}
	
	public void orderMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List orderList=new ArrayList();
		String sql="select * from t_order order by zhuangtai desc";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
                Torder order=new Torder();
				
				order.setId(rs.getString("id"));
				order.setBianhao(rs.getString("bianhao"));
				order.setShijian(rs.getString("shijian"));
				order.setXingming(rs.getString("xingming"));
				
				order.setDianhua(rs.getString("dianhua"));
				order.setSonghuodizhi(rs.getString("songhuodizhi"));
				order.setFukuanfangshi(rs.getString("fukuanfangshi"));
				order.setJine(rs.getInt("jine"));
				
				order.setZhuangtai(rs.getString("zhuangtai"));
				order.setUser_id(rs.getString("user_id"));
				
				orderList.add(order);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("orderList", orderList);
		req.getRequestDispatcher("admin/order/orderMana.jsp").forward(req, res);
	}
	
	
	
	
	
	public void orderDel(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
        String id=req.getParameter("id");
		
		String sql="delete from t_order where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "信息删除完毕");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	public void orderShouli(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
        String id=req.getParameter("id");
		
		String sql="update t_order set zhuangtai='已受理' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "订单受理完毕");
		String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	
	public void orderRes(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String shijian1=req.getParameter("shijian1");
		String shijian2=req.getParameter("shijian2");
		
		List orderList=new ArrayList();
		String sql="select * from t_order where shijian >=? and shijian <=? and zhuangtai='已受理'";
		Object[] params={shijian1,shijian2};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
                Torder order=new Torder();
				
				order.setId(rs.getString("id"));
				order.setBianhao(rs.getString("bianhao"));
				order.setShijian(rs.getString("shijian"));
				order.setXingming(rs.getString("xingming"));
				
				order.setDianhua(rs.getString("dianhua"));
				order.setSonghuodizhi(rs.getString("songhuodizhi"));
				order.setFukuanfangshi(rs.getString("fukuanfangshi"));
				order.setJine(rs.getInt("jine"));
				
				order.setZhuangtai(rs.getString("zhuangtai"));
				order.setUser_id(rs.getString("user_id"));
				
				orderList.add(order);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("orderList", orderList);
		req.getRequestDispatcher("admin/order/orderRes.jsp").forward(req, res);
	}
	
	
	public void orderDetailHou(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String order_id=req.getParameter("order_id");	
		req.setAttribute("orderItemList", liuService.orderItemList(order_id));
		req.getRequestDispatcher("admin/order/orderDetailHou.jsp").forward(req, res);
	}
	
	
	
	public void tongjiRes(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
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
		
		for(int i=0;i<goodsList.size();i++)
		{
			Tgoods goods=(Tgoods)goodsList.get(i);
			goods.setXiaoliang(liuService.getXiaoliang(goods.getId()));
		}
		
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("admin/order/tongjiRes.jsp").forward(req, res);
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
