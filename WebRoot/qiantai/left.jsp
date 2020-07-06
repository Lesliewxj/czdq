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
		
	</script>
</head>
  
<body>
                <div class="sidebar" style="margin-top: 8px;">
					<div class="title"><h2 class="f-l">购物指南</h2><a class="f-r more" href="#">&nbsp;</a></div>
					<div class="newslist">
						<ul>
							<c:forEach items="${sessionScope.guanggaoList}" var="guanggao">
							<li style="margin-top: 6px;"><span></span><a href="<%=path %>/guanggao?type=guanggaoDetailQian&id=${guanggao.id}">${guanggao.biaoti}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				<div class="sidebar" style="margin-top: 8px;">
					<div class="title"><h2 class="f-l">商品类别</h2></div>
					<div class="sort">
						<ul>
						    <c:forEach items="${sessionScope.catelogList}" var="catelog">
							<li><a href="<%=path %>/goods?type=goodsByCatelog&catelog_id=${catelog.id}">${catelog.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				<!-- <div class="sidebar" style="margin-top: 8px;">
					<div class="title"><h2 class="f-l">联系方式</h2></div>
					<div class="contactlist">
						<p>地 址：xxxxxxxxxxxx20号<br />电 话：xxxxxxxxxx<br />传 真：0577 - 68683222<br />手机：xxxxxxxxxx</p>
					</div>
				</div> -->	
</body>
</html>
