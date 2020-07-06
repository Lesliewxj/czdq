package com.orm;

public class Tgoods 
{
	private String id;
	private String catelog_id;
	private String mingcheng;
	private String jieshao;
	
	private String fujian;
	private int shichangjia;
	private String shifoutejia;
	private int tejia;
	
	private String del;
	
	private int xiaoliang;


	public String getCatelog_id()
	{
		return catelog_id;
	}

	public void setCatelog_id(String catelog_id)
	{
		this.catelog_id = catelog_id;
	}

	public String getDel()
	{
		return del;
	}

	public int getXiaoliang() {
		return xiaoliang;
	}

	public void setXiaoliang(int xiaoliang) {
		this.xiaoliang = xiaoliang;
	}

	public String getShifoutejia() {
		return shifoutejia;
	}

	public void setShifoutejia(String shifoutejia) {
		this.shifoutejia = shifoutejia;
	}

	public void setDel(String del)
	{
		this.del = del;
	}

	public String getFujian()
	{
		return fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getJieshao()
	{
		return jieshao;
	}

	public void setJieshao(String jieshao)
	{
		this.jieshao = jieshao;
	}

	public String getMingcheng()
	{
		return mingcheng;
	}

	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}

	public int getShichangjia()
	{
		return shichangjia;
	}

	public void setShichangjia(int shichangjia)
	{
		this.shichangjia = shichangjia;
	}

	public int getTejia()
	{
		return tejia;
	}

	public void setTejia(int tejia)
	{
		this.tejia = tejia;
	}
		
}
