package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.orm.Tgoods;
import com.orm.Torder;
import com.orm.TorderItem;
import com.orm.Tuser;
import com.service.liuService;
import com.util.Cart;

public class buy_servlet extends HttpServlet
{
	
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("addToCart"))
		{
			addToCart(req, res);
		}
		if(type.endsWith("orderSubmit"))
		{
			orderSubmit(req, res);
		}
		if(type.endsWith("myorder"))
		{
			myorder(req, res);
		}
		if(type.endsWith("orderDetailQian"))
		{
			orderDetailQian(req, res);
		}
	}
	
	
	public void addToCart(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String goods_id=req.getParameter("goods_id");
		int quantity=Integer.parseInt(req.getParameter("quantity"));
		Tgoods goods=liuService.getGoods(goods_id);
		
		TorderItem orderItem=new TorderItem();
		orderItem.setGoods(goods);
		orderItem.setGoods_quantity(quantity);
		
		HttpSession session=req.getSession();
		Cart cart =(Cart)session.getAttribute("cart");
		cart.addGoods(goods_id, orderItem);
		
		session.setAttribute("cart", cart);
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "qiantai/cart/mycart.jsp");
		
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
		
	}
	
	
	
	public void orderSubmit(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		Cart cart =(Cart)session.getAttribute("cart");
		Tuser user=(Tuser)session.getAttribute("user");
		
		String id=String.valueOf(new Date().getTime());
		String bianhao=new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		String shijian=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String xingming=req.getParameter("xingming");
		
		String dianhua=req.getParameter("dianhua");
		String songhuodizhi=req.getParameter("songhuodizhi");
		String fukuanfangshi=req.getParameter("fukuanfangshi");
		int jine=cart.getTotalPrice();;
		
		String zhuangtai="待受理";
		String user_id=user.getId();
		
		/*if(user.getDengji().equals("普通会员"))
		{
			jine=cart.getTotalPrice();
			req.setAttribute("msg", "");
		}
		if(user.getDengji().equals("高级会员"))
		{
			jine=(int)(cart.getTotalPrice() * 0.85);
			req.setAttribute("msg", "您是高级会员，8.5折");
		}*/
		
		Torder order=new Torder();
		
		order.setId(id);
		order.setBianhao(bianhao);
		order.setShijian(shijian);
		order.setXingming(xingming);
		
		order.setDianhua(dianhua);
		order.setSonghuodizhi(songhuodizhi);
		order.setFukuanfangshi(fukuanfangshi);
		order.setJine(jine);
		
		order.setZhuangtai(zhuangtai);
		order.setUser_id(user.getId());
		
		
		liuService.saveOrder(order);
		
		for (Iterator it = cart.getItems().values().iterator(); it.hasNext();)
		{

			TorderItem orderItem = (TorderItem) it.next();
			
			String id1=String.valueOf(new Date().getTime());
			String order_id=id;
			String goods_id=orderItem.getGoods().getId();
			int goods_quantity=orderItem.getGoods_quantity();
			liuService.saveOrderItem(id1, order_id, goods_id, goods_quantity);
			
			//liuService.updateGoodsKucun(goods_id, goods_quantity);
		}
		
		cart.getItems().clear();
		session.setAttribute("cart", cart);
		
		req.setAttribute("order", order);
		req.getRequestDispatcher("qiantai/order/orderSubmit.jsp").forward(req, res);
	}
	
	
	public void myorder(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		Tuser user=(Tuser)session.getAttribute("user");
		
		req.setAttribute("orderList", liuService.orderList(user.getId()));
		req.getRequestDispatcher("qiantai/order/myorder.jsp").forward(req, res);
	}
	
	public void orderDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String order_id=req.getParameter("order_id");	
		req.setAttribute("orderItemList", liuService.orderItemList(order_id));
		req.getRequestDispatcher("qiantai/order/orderDetailQian.jsp").forward(req, res);
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
