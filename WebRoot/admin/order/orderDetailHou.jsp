<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base target="_self">
    <title>My JSP 'orderDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
	
	<style type="text/css">
        
    </style>
	
  </head>
  
  <body class="body" leftmargin="0" rightmargin="0">
     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="left" style="margin-top:8px">
          <tr align="left" bgcolor="#FAFAF1" height="22">
              <td class="blackTitle">商品名称</td>
              <td class="blackTitle">购买数量</td>
              <td class="blackTitle">购买价格</td>
          </tr>
		  <c:forEach items="${requestScope.orderItemList}" var="orderItem">
		  <tr class="text" align="left" bgcolor="#FFFFFF">
			  <td>${orderItem.goods.mingcheng}</td>
			  <td>${orderItem.goods_quantity}</td>
			  <td>${orderItem.goods.tejia}</td>
		  </tr>
		  </c:forEach>
  	</table>
  </body>
</html>
