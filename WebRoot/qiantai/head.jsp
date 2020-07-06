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
	
	<style rel="stylesheet" type="text/css">
	
    </style>

    <script type="text/javascript">
		function shoucang(sTitle,sURL) 
		{ 
			try 
			{ 
			    window.external.addFavorite(sURL, sTitle); 
			} 
			catch (e) 
			{ 
				try 
				{ 
				    window.sidebar.addPanel(sTitle, sURL, ""); 
				} 
				catch (e) 
				{ 
				    alert("加入收藏失败，请使用Ctrl+D进行添加"); 
				} 
			} 
        } 
        
        
        function SetHome(obj,vrl)
        { 
			try
			{ 
			    obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl); 
			} 
			catch(e)
			{ 
			   if(window.netscape) 
			   { 
					try 
					{ 
					    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
					} 
					catch (e) 
					{ 
					     alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。"); 
					} 
			        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch); 
			        prefs.setCharPref('browser.startup.homepage',vrl); 
			   }
			   else
			   { 
			        alert("您的浏览器不支持，请按照下面步骤操作：1.打开浏览器设置。2.点击设置网页。3.输入："+vrl+"点击确定。"); 
			    } 
			} 
        } 
        
        
        function mycart()
       {
            <c:if test="${sessionScope.userType !=1}">
                  alert("请先登录");
                  return false;
            </c:if>
            
            <c:if test="${sessionScope.userType==1}">
                var url="<%=path %>/qiantai/cart/mycart.jsp";
                window.open(url,"_self");
            </c:if>
       } 
         
       function myorder()
       {
            <c:if test="${sessionScope.userType !=1}">
                  alert("请先登录");
                  return false;
            </c:if>
            
            <c:if test="${sessionScope.userType==1}">
                var url="<%=path %>/buy?type=myorder";
                window.open(url,"_self");
            </c:if>
       } 
	</script>
</head>
  
<body>
    <div class="container header">
		<div class="f-l logo">
			<!-- <div style="margin-top: 20px;font-size: 16px;">名字</div> -->
			<%-- <img src="<%=path %>/images/logo.gif"/> --%>
		</div>
		<div class="f-r span811">
			<ul class="quick clearfix">
				<li class="tele01"></li>
				<li class="home"><a href="javascript:void(0)" onclick="SetHome(this,window.location)">设为首页</a></li>
				<li class="addpage"><a href="javascript:void(0)" onclick="shoucang(document.title,window.location)">加入收藏</a></li>
			</ul>
			<div class="nav">
				<ul>
					<li><a href="<%=path %>/qiantai/default.jsp">网站首页</a></li>
					<li><a href="<%=path %>/qiantai/goods/goodsSea.jsp">商品查询</a></li>
					<%-- <li><a href="<%=path %>/guanggao?type=guanggaoAll">购物指南</a></li> --%>
					<li><a href="<%=path %>/xinwen?type=xinwenAll">新闻资讯</a></li>
					<li><a href="<%=path %>/qiantai/user/userReg.jsp">用户注册</a></li>
					<li><a href="<%=path %>/liuyanban?type=liuyanbanAll">系统留言板</a></li>
					<li><a href="#" onclick="mycart()">购物车</a></li>
					<li><a href="#" onclick="myorder()">我的订单</a></li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	
	  
</body>
</html>
