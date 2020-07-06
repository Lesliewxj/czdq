<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
            function orderDetailHou(order_id)
	        {
	                 var url="<%=path %>/order?type=orderDetailHou&order_id="+order_id;
	                 var n="";
	                 var w="700px";
	                 var h="400px";
	                 var s="resizable:no;help:no;status:no;scroll:yes";
				     openWin(url,n,w,h,s);
	        }
	        
	       function orderDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/order?type=orderDel&id="+id;
               }
           }
           
           function orderShouli(id)
           {
               if(confirm('您确定受理订单吗？'))
               {
                   window.location.href="<%=path %>/order?type=orderShouli&id="+id;
               }
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="44" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="10%">订单编号</td>
					<td width="10%">下单时间</td>
					<td width="10%">收货姓名</td>
					
					<td width="10%">联系电话</td>
					<td width="10%">送货地址</td>
					<td width="10%">支付状态</td>
					<td width="10%">总金额</td>
					
					<td width="10%">状态</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.orderList}" var="order" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" height="22">
					<td bgcolor="#FFFFFF" align="center">${ss.index+1}</td>
					<td bgcolor="#FFFFFF" align="center">${order.bianhao}</td>
					<td bgcolor="#FFFFFF" align="center">${order.shijian}</td>
					<td bgcolor="#FFFFFF" align="center">${order.xingming}</td>
					
					
					<td bgcolor="#FFFFFF" align="center">${order.dianhua}</td>
					<td bgcolor="#FFFFFF" align="center">${order.songhuodizhi}</td>
					<td bgcolor="#FFFFFF" align="center">${order.fukuanfangshi}</td>
					<td bgcolor="#FFFFFF" align="center">${order.jine}</td>
					
					
					<td bgcolor="#FFFFFF" align="center">
					     <c:if test="${order.zhuangtai=='待受理'}">
					                         待受理
					        &nbsp;&nbsp;&nbsp;
					        <a href="#" style="color: red" onclick="orderShouli(${order.id})">受理</a>
					     </c:if>
					     <c:if test="${order.zhuangtai=='已受理'}">
					                          已受理
					     </c:if>
					</td>
					
					<td>
					    <input type="button" onclick="orderDel(${order.id})" value="删除"/>
					    <input value="明细" type="button" onclick="orderDetailHou(${order.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
