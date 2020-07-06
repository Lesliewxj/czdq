<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%String path = request.getContextPath();%>

<!doctype html>
<html>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=path %>/css/base.css" type="text/css" media="all"/>
	
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
  
<body style="margin: 0px;">

			           <form action="<%=path %>/user?type=userEditMe" name="form1" method="post">
										<table width="100%" border="0" align="left" cellpadding="0" cellspacing="1">
											<tr>
												<td width="5%" height="40" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
													账号：
												</td>
												<td width="95%" bgcolor="#FFFFFF" align="left">
													<input type="text" name="userName" style="width: 290px;" value="${sessionScope.user.userName }" />(只读)
												</td>
											</tr>
											<tr>
												<td width="5%" height="40" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
													密码：
												</td>
												<td width="95%" bgcolor="#FFFFFF" align="left">
													<input type="password" name="userPw" value="000000" style="width: 290px;" value="${sessionScope.user.userPw }"/>
												</td>
											</tr>
											<tr>
												<td width="5%" height="40" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
													姓名：
												</td>
												<td width="95%" bgcolor="#FFFFFF" align="left">
													<input type="text" name="userRealname" style="width: 290px;" value="${sessionScope.user.userRealname }"/>
												</td>
											</tr>
											<tr>
												<td width="5%" height="40" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
													性别：
												</td>
												<td width="95%" bgcolor="#FFFFFF" align="left">
													<input type="radio" name="userSex" value="男" style="border: 0px;" checked="checked"/>男
													&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="userSex" value="女" style="border: 0px;"/>女
												</td>
											</tr>
											<tr>
												<td width="5%" height="40" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
													年龄：
												</td>
												<td width="95%" bgcolor="#FFFFFF" align="left">
													<input type="text" name="userAge" value="${sessionScope.user.userAge }" style="width: 290px;" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
												</td>
											</tr>
											<tr>
												<td width="5%" height="40" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
													住址：
												</td>
												<td width="95%" bgcolor="#FFFFFF" align="left">
													<input type="text" name="userAddress" value="${sessionScope.user.userAddress }" style="width: 390px;"/>
												</td>
											</tr>
											<tr>
												<td width="5%" height="40" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
													电话：
												</td>
												<td width="95%" bgcolor="#FFFFFF" align="left">
													<input type="text" name="userTel" value="${sessionScope.user.userTel }" style="width: 290px;"/>
												</td>
											</tr>
											<tr>
												<td width="5%" height="40" align="right" bgcolor="#F9F9F9" style="font-size: 12px;">
													&nbsp;
												</td>
												<td width="95%" bgcolor="#FFFFFF" align="left">
												    <input type="hidden" name="id" value="${sessionScope.user.id }">
													<input type="button" value="确定" onclick="check1();" style="width: 70px;"/>
													<input type="reset" value="重置" style="width: 70px;"/>
												</td>
											</tr>
										</table>
								   </form>

</body>
</html>
