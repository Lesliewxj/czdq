package com.orm;

/**
 * TOrder generated by MyEclipse Persistence Tools
 */

public class Torder implements java.io.Serializable
{

	private String id;
	private String bianhao;
	private String shijian;
	private String xingming;
	
	private String dianhua;
	private String songhuodizhi;
	private String fukuanfangshi;
	private int jine=0;
	
	private String zhuangtai;
	private String user_id;

	// Constructors

	/** default constructor */
	public Torder()
	{
	}

	public String getBianhao()
	{
		return bianhao;
	}

	public void setBianhao(String bianhao)
	{
		this.bianhao = bianhao;
	}

	public String getFukuanfangshi()
	{
		return fukuanfangshi;
	}

	public void setFukuanfangshi(String fukuanfangshi)
	{
		this.fukuanfangshi = fukuanfangshi;
	}


	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public int getJine()
	{
		return jine;
	}

	public void setJine(int jine)
	{
		this.jine = jine;
	}


	public String getXingming() {
		return xingming;
	}

	public void setXingming(String xingming) {
		this.xingming = xingming;
	}

	public String getDianhua() {
		return dianhua;
	}

	public void setDianhua(String dianhua) {
		this.dianhua = dianhua;
	}

	public String getShijian()
	{
		return shijian;
	}

	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}

	public String getSonghuodizhi()
	{
		return songhuodizhi;
	}

	public void setSonghuodizhi(String songhuodizhi)
	{
		this.songhuodizhi = songhuodizhi;
	}


	public String getUser_id()
	{
		return user_id;
	}

	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}

	public String getZhuangtai()
	{
		return zhuangtai;
	}

	public void setZhuangtai(String zhuangtai)
	{
		this.zhuangtai = zhuangtai;
	}

	
}