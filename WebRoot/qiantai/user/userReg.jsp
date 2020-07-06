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
		function check1()
	    {
	        if(document.form1.userName.value=="")
	        {
	            alert("请输入账号");
	            return false;
	        }
	        if(document.form1.userPw.value=="")
	        {
	            alert("请输入密码");
	            return false;
	        }
	        if(document.form1.userRealname.value=="")
	        {
	            alert("请输入姓名");
	            return false;
	        }
	        
	        document.form1.submit();
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
				<div class="titlebox"><h2 class="f-l">用户注册</h2><a class="f-r" href="#">&nbsp;</a></div>
				<div class="about">
				     <form action="<%=path %>/user?type=userReg" name="form1" method="post">
										<table width="99%" border="0" align="left" cellpadding="0" cellspacing="1">
											<tr>
												<td width="10%" height="40" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
													账号：
												</td>
												<td width="90%" bgcolor="#FFFFFF">
													&nbsp;
													<input type="text" name="userName" style="width: 290px;"/>
												</td>
											</tr>
											<tr>
												<td height="40" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
													密码：
												</td>
												<td bgcolor="#FFFFFF">
													&nbsp;
													<input type="password" name="userPw" value="000000" style="width: 290px;"/>(默认密码：000000)
												</td>
											</tr>
											<tr>
												<td height="40" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
													姓名：
												</td>
												<td bgcolor="#FFFFFF">
													&nbsp;
													<input type="text" name="userRealname" style="width: 290px;"/>
												</td>
											</tr>
											<tr>
												<td height="40" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
													性别：
												</td>
												<td bgcolor="#FFFFFF">
													&nbsp;
													<input type="radio" name="userSex" value="男" style="border: 0px;" checked="checked"/>男
													&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="userSex" value="女" style="border: 0px;"/>女
												</td>
											</tr>
											<tr>
												<td height="40" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
													年龄：
												</td>
												<td bgcolor="#FFFFFF">
													&nbsp;
													<input type="text" name="userAge" value="20" style="width: 290px;" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
												</td>
											</tr>
											<tr>
												<td height="40" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
													住址：
												</td>
												<td bgcolor="#FFFFFF">
													&nbsp;
													<input type="text" name="userAddress" style="width: 390px;"/>
												</td>
											</tr>
											<tr>
												<td height="40" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
													电话：
												</td>
												<td bgcolor="#FFFFFF">
													&nbsp;
													<input type="text" name="userTel" style="width: 290px;"/>
												</td>
											</tr>
											<tr>
												<td height="40" align="right" bgcolor="#F9F9F9">
													&nbsp;
												</td>
												<td bgcolor="#FFFFFF">
													&nbsp;
													<input type="button" value="确定" onclick="check1();" style="width: 70px;"/>
													<input type="reset" value="重置" style="width: 70px;"/>
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
