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
		function back1()
        {
           window.history.go(-1);
        }
        
        function cccc()
        {
           if(document.form33.songhuodizhi.value=="")
           {
               alert("请输入送货地址");
               return false;
           }
           if(document.form33.fukuanfangshi.value=="未付款")
           {
               alert("请去付款");
               return false;
           }
           
           document.form33.submit();
        }
        
        
            function zhifu(zongjine)
	        {
	            var strUrl = "<%=path %>/zhifu/zhifu.jsp?zongjine="+zongjine;
				var ret = window.showModalDialog(strUrl,"","dialogWidth:700px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
	            document.getElementById("fukuanfangshi").value="已付款";
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
				<div class="titlebox"><h2 class="f-l">订单</h2><a class="f-r" href="#">&nbsp;</a></div>
				<div class="about">
				         <form action="<%=path %>/buy?type=orderSubmit" name="form33" method="post">
					                        <table width="99%" align="center" border="0" cellpadding="0" cellspacing="0">
												<tr align='center' style="height: 43px;">
												    <td width="11%" bgcolor="#FFFFFF" align="left" style="font-size: 13px;">
												          收货姓名：
												    </td>
												    <td width="89%" bgcolor="#FFFFFF" align="left">
												         <input type="text" name="xingming" style="width: 280px;" value="${sessionScope.user.userRealname}"/>
												    </td>
												</tr>
												<tr align='center' style="height: 43px;">
												    <td width="11%" bgcolor="#FFFFFF" align="left" style="font-size: 13px;">
												          联系电话：
												    </td>
												    <td width="89%" bgcolor="#FFFFFF" align="left">
												         <input type="text" name="dianhua" style="width: 280px;" value="${sessionScope.user.userTel}"/>
												    </td>
												</tr>
												<tr align='center' style="height: 43px;">
												    <td width="11%" bgcolor="#FFFFFF" align="left" style="font-size: 13px;">
												          送货地址：
												    </td>
												    <td width="89%" bgcolor="#FFFFFF" align="left" style="font-size: 13px;">
												         <input type="text" style="width: 380px;" name="songhuodizhi" value="${sessionScope.user.userAddress}"/>
												    </td>
												</tr>
												<tr align='center' style="height: 43px;">
												    <td width="11%" bgcolor="#FFFFFF" align="left" style="font-size: 13px;">
												                付款方式：
												    </td>
												    <td width="89%" bgcolor="#FFFFFF" align="left">
												         <select name="fukuanfangshi" style="width: 282px;">
												            <option value="货到付款">货到付款</option>
												         </select>
												    </td>
												 </tr>
										    </table>
					        				<table>
					        				   <tr height="7"><td></td></tr>
							                   <tr>
							                       <td width="120"></td>
							                       <td>
							                          <input type="button" value="返回" style="width: 80px;height: 30px;" onclick="back1()">
							                       </td>
							                       <td>
							                          <input type="button" value="提交订单" style="width: 80px;height: 30px;" onclick="cccc()">
							                       </td>
							                   </tr>
							               </table>
							            </form> 
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
