package com.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.DB;
import com.orm.TGuanggao;
import com.orm.TTupian;
import com.orm.TXinwen;
import com.orm.Tcatelog;
import com.orm.Tgoods;
import com.orm.Tlianjie;
import com.orm.Torder;
import com.orm.TorderItem;
import com.orm.Tuser;


public class liuService
{
	public static List catelogList()
	{
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
	
	
	public static List guanggaoList()
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
		return guanggaoList;
	}
	
	
	
	public static List xinwenQian7()
	{
		List xinwenList=new ArrayList();
		String sql="select * from t_xinwen";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TXinwen xinwen=new TXinwen();
				
				xinwen.setId(rs.getString("id"));
				xinwen.setBiaoti(rs.getString("biaoti"));
				xinwen.setJieshao(rs.getString("jieshao"));
				xinwen.setFabushi(rs.getString("fabushi"));
				
				xinwenList.add(xinwen);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		if(xinwenList.size()>7)
		{
			xinwenList=xinwenList.subList(0, 7);
		}
		return xinwenList;
	}
	
	public static List lianjieList()
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
		return lianjieList;
	}
	
	
	public static List getTupianByxinwen(String xinwenId)
	{
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
		return tupianList;
	}
	
	public static Tgoods getGoods(String id)
	{
		Tgoods goods=new Tgoods();
		
		String sql="select * from t_goods where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			goods.setId(rs.getString("id"));
			goods.setCatelog_id(rs.getString("catelog_id"));
			goods.setMingcheng(rs.getString("mingcheng"));
			goods.setJieshao(rs.getString("jieshao"));
			
			goods.setFujian(rs.getString("fujian"));
			goods.setShichangjia(rs.getInt("shichangjia"));
			goods.setShifoutejia(rs.getString("shifoutejia"));
			goods.setTejia(rs.getInt("tejia"));
			
			goods.setDel(rs.getString("del"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return goods;
	}
	
	
	public static List goodsNew()
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' order by id desc";
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
		return goodsList;
	}
	
	
	
	
	public static List goodsByCatelog(String catelog_id)
	{
		List goodsList=new ArrayList();
		String sql="select * from t_goods where del='no' and catelog_id=? and shifoutejia='·ñ' order by id desc";
		Object[] params={catelog_id};
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
		return goodsList;
	}
	
	
	
	public static void saveOrder(Torder order)
	{
		String sql="insert into t_order(id,bianhao,shijian,xingming,dianhua,songhuodizhi,fukuanfangshi,jine,zhuangtai,user_id) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params={order.getId(),order.getBianhao(),order.getShijian(),order.getXingming(),order.getDianhua(),order.getSonghuodizhi(),order.getFukuanfangshi(),order.getJine(),order.getZhuangtai(),order.getUser_id()};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	public static void saveOrderItem(String id,String order_id,String goods_id,int goods_quantity)
	{
		String sql="insert into t_orderitem(id,order_id,goods_id,goods_quantity) values(?,?,?,?)";
		Object[] params={id,order_id,goods_id,goods_quantity};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	public static void updateGoodsKucun(String goods_id,int goods_quantity)
	{
		String sql="update t_goods set kucun=kucun-? where id=?";
		Object[] params={goods_quantity,goods_id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
	}
	
	
	public static List orderList(String user_id)
	{
		List orderList=new ArrayList();
		String sql="select * from t_order where user_id=?";
		Object[] params={user_id};
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
		return orderList;
	}
	
	
	public static List orderItemList(String order_id)
	{
		List orderitemList=new ArrayList();
		String sql="select * from t_orderitem where order_id=?";
		Object[] params={order_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TorderItem orderItem=new TorderItem();
				
				orderItem.setId(rs.getString("id"));
				orderItem.setGoods(getGoods(rs.getString("goods_id")));
				orderItem.setGoods_quantity(rs.getInt("goods_quantity"));
				
				orderitemList.add(orderItem);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return orderitemList;
	}
	
	
	public static String panduan_zhanghao(String loginname)
	{
		String s="meizhan";
		
		String sql="select * from t_user where del='no' and loginname=?";
		Object[] params={loginname.trim()};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				s="yizhan";
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return s;
	}
	
	
	public static List goodsPaihang4()
	{
		List goodsList=new ArrayList();
		String sql="select sum(goods_quantity),goods_id from t_orderitem group by goods_id order by sum(goods_quantity) desc";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				goodsList.add(getGoods(rs.getString(2)));
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
		return goodsList;
	}
	
	
	public static int getXiaoliang(String goodsId)
	{
		int i=0;
		
		String sql="select sum(goods_quantity) from t_orderitem where goods_id=?";
		Object[] params={goodsId};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				i=i+rs.getInt(1);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return i;
	}
	
	
	public static Tuser get_user(String id)
	{
		Tuser user=new Tuser();
		
		String sql="select * from t_user where id=?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				user.setId(rs.getString("id"));
				user.setUserName(rs.getString("userName"));
				user.setUserPw(rs.getString("userPw"));
				user.setUserRealname(rs.getString("userRealname"));
				
				user.setUserSex(rs.getString("userSex"));
				user.setUserAge(rs.getString("userAge"));
				user.setUserAddress(rs.getString("userAddress"));
				user.setUserTel(rs.getString("userTel"));
				
				user.setDel(rs.getString("del"));
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return user;
	}
}
