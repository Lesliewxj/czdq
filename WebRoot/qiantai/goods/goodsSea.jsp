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
				<div class="titlebox"><h2 class="f-l">查询模块</h2><a class="f-r" href="#">&nbsp;</a></div>
				<div class="about">
					<form action="<%=path %>/goods?type=goodsRes" name="fd" method="post">
					<table align="left" border="0" cellpadding="11" cellspacing="11">
						<tr align='right'>
							<td style="width: 40px;vertical-align: middle;font-size: 12px;" align="right">
								名称：
					        </td>
							<td align="left">
							<input name="mingcheng" type="text" style="width: 300px;"/>
							</td>
						</tr>
						<tr align='right'>
							<td style="width: 40px;vertical-align: middle;font-size: 12px;" align="right">
								价格：
					        </td>
							<td align="left">
							    <input type="text" name="jiage1" style="width: 160px;" value="0"
							    onkeyup="value=value.replace(/[^\d]/g,'') " 
	                            onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
							    -
							    <input type="text" name="jiage2" style="width: 160px;" value="200"
							    onkeyup="value=value.replace(/[^\d]/g,'') " 
	                            onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
							</td>
						</tr>
						<tr align='right'>
							<td style="width: 40px;vertical-align: middle;font-size: 12px;" align="right">
								&nbsp;
					        </td>
							<td align="left">
							<input type="submit" value="查询" style="width: 60px;"/>&nbsp; 
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
