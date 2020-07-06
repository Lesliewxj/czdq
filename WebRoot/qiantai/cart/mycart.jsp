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
    
    <script type='text/javascript' src='<%=path %>/dwr/interface/cartService.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>

	<script type="text/javascript">
		function delGoodsFromCart(goodsId)
	        {
	            document.getElementById("indicator111").style.display="block";
	            cartService.delGoodsFromCart(goodsId,callback111);
	        }
           
            function clearCart()
	        {
	            document.getElementById("indicator111").style.display="block";
	            cartService.clearCart(callback111);
	        }
           
            function modiNum(goodsId,quantity)
	        {
	            var r1= /^[0-9]*[1-9][0-9]*$/　　//正整数 
	            var val=r1.test(quantity); //str为你要判断的字符 执行返回结果 true 或 false
	            if(val==false)
	            {
	                alert("数量必须是数字,请重新输入");
	            }
	            else
	            {
	                document.getElementById("indicator111").style.display="block";
	                cartService.modiNum(goodsId,quantity,callback111);
	            }
	        }
	        
	        function callback111(data)
	        {
	            document.getElementById("indicator111").style.display="none";
	            if(data=="no")
			    {
			        alert("库存不足");
			    }
			    if(data=="yes")
			    {
			        document.location.reload(true);
			    }
	        }
	        
	        
	        function orderQueren()
	        {
	             var s=${sessionScope.cart.totalPrice};
	             if(s<=0)
	             {
	                 alert("购物车是空的");
	                 return false;
	             }
	             
	             var url="<%=path %>/qiantai/order/orderQueren.jsp";
	             window.location.href=url;
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
				<div class="titlebox"><h2 class="f-l">购物车</h2><a class="f-r" href="#">&nbsp;</a></div>
				<div class="about">
					<table width="98%" border="0" cellpadding="2" cellspacing="1" style="margin-top:8px">
											<tr align="left" bgcolor="#FAFAF1" height="22">
												  <td style="font-size: 13px;">商品名称</td>
								                  <td style="font-size: 13px;">价格</td>
								                  <td style="font-size: 13px;">数量</td>
								                  <td style="font-size: 13px;">总金额</td>
								                  <td style="font-size: 13px;">操作</td>
									        </tr>	
											<c:forEach items="${sessionScope.cart.items}" var="item">
											<tr align='left' bgcolor="#FFFFFF" height="22">
												<td style="font-size: 13px;" align="left">${item.value.goods.mingcheng}</td>
												<td style="font-size: 13px;" align="left">￥:${item.value.goods.tejia}</td>
												<td style="font-size: 13px;" align="left">
												    <form>
												         <input type="text" name="shuliang" value="${item.value.goods_quantity}" size="4"/>
												         <input type="button" value="更新" onclick="modiNum(${item.value.goods.id},this.form.shuliang.value)"/>
												    </form>
												</td>
												<td style="font-size: 13px;" align="left">${item.value.goods.tejia * item.value.goods_quantity}</td>
												<td style="font-size: 13px;" align="left">
												   <input type="button" value="删除" style="width: 50px;" onclick="delGoodsFromCart(${item.value.goods.id})">
												</td>
											</tr>
											</c:forEach>
											<tr>
								                 <td colspan="5" class="Order_Total" align="right">
								                    <br>
												            总金额：<span id="totalMoney">${sessionScope.cart.totalPrice}</span>
												    &nbsp;&nbsp;&nbsp;&nbsp;
												    <img id="indicator111" src="<%=path %>/images/loading.gif" style="display:none"/>
												 </td>
								              </tr>	
										</table>
										<table>
				        				   <tr height="7"><td></td></tr>
						                   <tr>
						                       <td width="120"></td>
						                       <td>
						                           <input type="button" value="清空" style="width: 80px;height: 30px;" onclick="clearCart()">
						                       </td>
						                       <td>
						                           <input type="button" value="继续" style="width: 80px;height: 30px;" onclick="javascript:window.location.href='<%=path %>/qiantai/default.jsp'">
						                       </td>
						                       <td>
						                           <input type="button" value="结账" style="width: 80px;height: 30px;" onclick="orderQueren()">
						                       </td>
						                   </tr>
						               </table>
				</div>
				
				
				<script type="text/javascript" src="<%=path %>/js/Marquee.js"></script>
				<script type="text/javascript">
					/* $(function()
					{
						$('.scrollbox').kxbdSuperMarquee({
							isMarquee:true,
							isEqual:false,
							scrollDelay:15,
							direction:'left'
						});
					}); */
				</script>
			</div>
			<!-- right -->
			<div class="clear"></div>
			<div class="blank20"></div>
		</div>
	</div>
	
	
	<jsp:include flush="true" page="/qiantai/down.jsp"></jsp:include>
	
</body>
</html>
