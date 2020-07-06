package com.orm;

/**
 * TTupian entity. @author MyEclipse Persistence Tools
 */

public class TTupian implements java.io.Serializable
{

	// Fields

	private String id;
	private String xinwenId;
	private String jieshao;
	private String fujian;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXinwenId() {
		return xinwenId;
	}
	public void setXinwenId(String xinwenId) {
		this.xinwenId = xinwenId;
	}
	public String getJieshao()
	{
		return jieshao;
	}
	public void setJieshao(String jieshao)
	{
		this.jieshao = jieshao;
	}
	public String getFujian()
	{
		return fujian;
	}
	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

}