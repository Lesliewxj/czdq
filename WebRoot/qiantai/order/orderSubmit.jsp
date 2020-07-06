<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%String path = request.getContextPath();%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link type="text/css" href="<%=path %>/css/style.css" rel="stylesheet" />
	
	<script type="text/javascript" src="<%=path %>/js/jquery-1.2.6.pack.js"></script>
	
	<style rel="stylesheet" type="text/css">
	
    </style>

	<script type="text/javascript">
		
	</script>	
</head>
  
<body>
	<jsp:include flush="true" page="/qiantai/head.jsp"></jsp:include>
	
	<div class="banner" style="background:url(<%=path %>/images/tou.jpg)"></div> 
	
	<div class="content">
		<div class="container">
			<!-- left -->
			<div class="f-l span270">
			    <div class="sidebar">
					<div class="title"><h2 class="f-l">用户登陆</h2><a class="f-r more" href="#">&nbsp;</a></div>
					<div class="newslist">
						<jsp:include flush="true" page="/qiantai/user/userLogin.jsp"></jsp:include>
					</div>
				</div>
				
				<jsp:include flush="true" page="/qiantai/left.jsp"></jsp:include>
			</div>
			<!-- left -->
			
			<!-- right -->
			<div class="f-r span658">
				<div class="titlebox"><h2 class="f-l">订单提交</h2><a class="f-r" href="#">&nbsp;</a></div>
				<div class="about">
				         <table width="99%" border="0" cellpadding="11" cellspacing="1" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
								              <tr style="height: 43px;">
								                  <td align="left" style="color: red">恭喜您，订单提交成功！${requestScope.msg }</td>
								              </tr>
								              <tr style="height: 43px;">
								                  <td style="font-size: 13px;">订单编号：${requestScope.order.bianhao }</td>
								              </tr>
								              <tr style="height: 43px;">
								                  <td style="font-size: 13px;">下单时间：${requestScope.order.shijian }</td>
								              </tr>
								              <tr style="height: 43px;">
								                  <td style="font-size: 13px;">收货姓名：${requestScope.order.xingming }</td>
								              </tr>
								              
								              
								              <tr style="height: 43px;">
								                  <td style="font-size: 13px;">联系电话：${requestScope.order.dianhua }</td>
								              </tr>
								              <tr style="height: 43px;">
								                  <td style="font-size: 13px;">送货地址：${requestScope.order.songhuodizhi }</td>
								              </tr>
								              <tr style="height: 43px;">
								                  <td style="font-size: 13px;">支付状态：${requestScope.order.fukuanfangshi }</td>
								              </tr>
								              <tr style="height: 43px;">
								                  <td style="font-size: 13px;">总金额：${requestScope.order.jine }</td>
								              </tr>
								              
								              
								              <tr style="height: 43px;">
								                  <td style="font-size: 13px;">订单状态：${requestScope.order.zhuangtai }</td>
								              </tr>
					        			</table>
				</div>
			</div>
			<!-- right -->
			<div class="clear"></div>
			<div class="blank20"></div>
		</div>
	</div>
	
	
	<jsp:include flush="true" page="/qiantai/down.jsp"></jsp:include>
	
</body>
</html>
