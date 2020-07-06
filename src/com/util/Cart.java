package com.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.orm.Tgoods;
import com.orm.TorderItem;



public class Cart
{

	protected Map<String, TorderItem> items;

	public Cart()
	{

		if (items == null)
		{
			items = new HashMap<String, TorderItem>();
		}
	}

	public void addGoods(String goodsId, TorderItem orderItem)
	{

		if (items.containsKey(goodsId))
		{

			TorderItem _orderitem = items.get(goodsId);
			_orderitem.setGoods_quantity(_orderitem.getGoods_quantity()+ orderItem.getGoods_quantity());
			items.put(goodsId, _orderitem);
		} 
		else
		{

			items.put(goodsId, orderItem);
		}
	}
	
	public void delGoods(String goodsId)
	{
		items.remove(goodsId);
	}
	

	public void updateCart(String goodsId, int quantity)
	{

		TorderItem orderItem = items.get(goodsId);
		orderItem.setGoods_quantity(quantity);
		items.put(goodsId, orderItem);
	}

	public int getTotalPrice()
	{

		int totalPrice = 0;
		for (Iterator it = items.values().iterator(); it.hasNext();)
		{

			TorderItem orderItem = (TorderItem) it.next();
			Tgoods goods = orderItem.getGoods();
			int quantity = orderItem.getGoods_quantity();
			totalPrice += goods.getTejia()* quantity;
		}
		return totalPrice;
	}

	public Map<String, TorderItem> getItems()
	{
		return items;
	}

}
