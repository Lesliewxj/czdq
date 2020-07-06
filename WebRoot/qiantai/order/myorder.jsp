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
		function orderDetailQian(order_id)
        {
                var strUrl="<%=path %>/buy?type=orderDetailQian&order_id="+order_id;
                var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
		     
        }
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
				<div class="titlebox"><h2 class="f-l">订单信息</h2><a class="f-r" href="#">&nbsp;</a></div>
				<div class="about">
				         <c:forEach items="${requestScope.orderList}" var="order">
						               <fieldset style="width:95%; margin-left:5px;"><legend class="fieldtitle"></legend>
											<table class="bill" width="97%" cellpadding="4" cellspacing="4">
											    <tr style="display: none">
											        <td style="font-size: 13px;">订单ID：${order.id}</td>
											    </tr>
											    <tr style="height: 33px;">
											        <td style="font-size: 13px;">订单编号：${order.bianhao}</td>
											    </tr>
											    <tr style="height: 33px;">
											        <td style="font-size: 13px;">下单时间：${order.shijian}</td>
											    </tr>
											    <tr style="height: 33px;">
											        <td style="font-size: 13px;">收货姓名：${order.xingming}</td>
											    </tr>
											    
											    
											    <tr style="height: 33px;">
											        <td style="font-size: 13px;">联系电话：${order.dianhua}</td>
											    </tr>
											    <tr style="height: 33px;">
											        <td style="font-size: 13px;">送货地址：${order.songhuodizhi}</td>
											    </tr>
											    <tr style="height: 33px;">
											        <td style="font-size: 13px;">付款方式：${order.fukuanfangshi}</td>
											    </tr>
											    <tr style="height: 33px;">
											        <td style="font-size: 13px;">总金额：${order.jine}&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" style="color: red" onclick="orderDetailQian(${order.id})"/>订单明细</a></td>
											    </tr>
											    
											    
											    <tr style="height: 33px;">
											        <td style="font-size: 13px;">订单状态：${order.zhuangtai}</td>
											    </tr>
											</table>
									   </fieldset>
									   <br/>
									   </c:forEach> 
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
