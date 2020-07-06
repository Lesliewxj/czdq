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
				<div class="titlebox"><h2 class="f-l">新品上市</h2><a class="f-r" href="#">&nbsp;</a></div>
				<div class="about">
					<TABLE class=main border=0 cellSpacing=2 cellPadding=2>
		                  <TR>
			                  <c:forEach items="${requestScope.goodsList}" var="goods" varStatus="sta">
			                    <c:if test="${sta.index%4==0}">
			                       </tr><tr>
			                    </c:if>
				                <TD>
				                  <TABLE onmouseover="this.style.backgroundColor='#FF6600'" onmouseout="this.style.backgroundColor=''" border=0 cellSpacing=1 cellPadding=2 width=98 bgColor=#e1e1e1 align=center height=100>
				                    <TR>
				                      <TD bgColor=#ffffff  align=left>
				                        <P align="center">
				                           <A href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }"><IMG border=0 align=absMiddle src="<%=path %>/${goods.fujian }" width=111 height=130></A>
				                           </>
				                           <center><A href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }"><FONT color=#ff0000></FONT>${goods.mingcheng }</A></center>
				                        </P>
				                      </TD>
				                    </TR>
				                  </TABLE>
				                </TD>
			                </c:forEach>
			              </TR>
		             </TABLE>
				</div>
				
				<div class="titlebox"><h2 class="f-l">销售排行</h2><a class="f-r" href="#">&nbsp;</a></div>
				<div class="scrollbox">
					<TABLE class=main border=0 cellSpacing=2 cellPadding=2>
		                  <TR>
			                  <c:forEach items="${requestScope.paihangList}" var="goods" varStatus="sta">
			                    <c:if test="${sta.index%4==0}">
			                       </tr><tr>
			                    </c:if>
				                <TD>
				                  <TABLE onmouseover="this.style.backgroundColor='#FF6600'" onmouseout="this.style.backgroundColor=''" border=0 cellSpacing=1 cellPadding=2 width=98 bgColor=#e1e1e1 align=center height=100>
				                    <TR>
				                      <TD bgColor=#ffffff  align=left>
				                        <P align="center">
				                           <A href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }"><IMG border=0 align=absMiddle src="<%=path %>/${goods.fujian }" width=111 height=130></A>
				                           </>
				                           <center><A href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }"><FONT color=#ff0000></FONT>${goods.mingcheng }</A></center>
				                        </P>
				                      </TD>
				                    </TR>
				                  </TABLE>
				                </TD>
			                </c:forEach>
			              </TR>
		             </TABLE>
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
