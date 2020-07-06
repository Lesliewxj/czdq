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
		    function buy1()
	        {
	            <c:if test="${sessionScope.userType !=1}">
	                alert("请先登录");
	                return false;
	            </c:if>
	            <c:if test="${sessionScope.userType==1}">
		            if(document.buy.quantity.value=="")
		            {
		                alert("请输入购买数量");
		                return false;
		            }
		            document.buy.submit();
	            </c:if>
	        }
	        
	        function pinglunAll(goods_id)
	        {
	            var strUrl = "<%=path %>/pinglun?type=pinglunAll&goods_id="+goods_id;
	            var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:300px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
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
				<div class="titlebox"><h2 class="f-l">商品信息</h2><a class="f-r" href="#">&nbsp;</a></div>
				<div class="about">
					<form action="<%=path %>/buy?type=addToCart" method="post" name="buy">
                         <table width="100%" border="0" cellpadding="9" cellspacing="9">
							    <tr>
							       <td align="left"><img width="330" height="366" src="<%=path %>/${requestScope.goods.fujian }" style="border:1px solid #ccc; padding:3px;"/></td>
							    </tr>
							    <tr>
							       <td align="left">商品名称：${requestScope.goods.mingcheng }</td>
							    </tr>
							    <tr>
							       <td align="left">简单介绍：<c:out value="${requestScope.goods.jieshao }" escapeXml="false"></c:out></td>
							    </tr>
							    <tr>
							       <c:if test="${requestScope.goods.shifoutejia=='否' }">
							          <td align="left">价格：${requestScope.goods.shichangjia }</td>
							       </c:if>
							       <c:if test="${requestScope.goods.shifoutejia=='是' }">
							          <td align="left">
							                                         原价：${requestScope.goods.shichangjia }
							              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							                                          特价：${requestScope.goods.tejia }
							          </td>
							       </c:if>
							    </tr>
							    <tr>
							       <td align="left">
							                                 数量：<input type="text" name="quantity" value="1" size="8" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
							           <input type="hidden" name="goods_id" value="${requestScope.goods.id }"/>
							           <input type="button" value="购买" style="width: 80px;height: 30px;" onclick="buy1()"/>
							           <input type="button" value="查看评论" style="width: 80px;height: 30px;" onclick="pinglunAll(${requestScope.goods.id })">
							       </td>
							    </tr>
			              </table>         
                    </form>
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
