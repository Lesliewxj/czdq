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
		function liuyanbanAdd()
        {
             <c:if test="${sessionScope.userType !=1}">
	                alert("请先登录");
	                return false;
	         </c:if>
                 var strUrl = "<%=path %>/qiantai/liuyanban/liuyanbanAdd.jsp";
	             var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
	             window.location.reload();
        }
        
        function liuyanbanDetail(id)
        {
             var strUrl = "<%=path %>/liuyanbanDetail.action?id="+id;
             var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
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
				<div class="titlebox"><h2 class="f-l">留言板</h2><a class="f-r" href="#">&nbsp;</a></div>
				<div class="about">
				         <c:forEach items="${requestScope.liuyanbanList}" var="liuyanban" varStatus="sta">
							<table border="0" width="100%" cellpadding="2" cellspacing="2">
							   <tr><td align="left" style="width: 70%">&nbsp;<img src="<%=path %>/img/head-mark4.gif" align="middle" class="img-vm" border="0"/> ${liuyanban.neirong }</td><td align="right" style="width: 30%">${liuyanban.liuyanshi }</td></tr>
							   <tr><td align="left" style="width: 70%">回复内容：${liuyanban.huifu }</td><td align="right" style="width: 30%"></td></tr>
							   <tr><td align="left" style="width: 70%">回复时间：${liuyanban.huifushi }</td><td align="right" style="width: 30%"></td></tr>
							   <tr><td align="left" style="width: 100%" colspan="2"><div style="border-bottom:#999 1px dashed;border-top:1px;">&nbsp;</div></td></tr>
							</table>	                      
			             </c:forEach>
			             <center><a href="#" onclick="liuyanbanAdd()">我要留言</a></center> 
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
