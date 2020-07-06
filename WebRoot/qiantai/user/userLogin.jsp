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

    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
     
    <script type="text/javascript">
            function check()
			{                                                                                         
			     if(document.ThisForm.userName.value=="")
				 {
				 	alert("请输入账号");
					return false;
				 }
				 if(document.ThisForm.userPw.value=="")
				 {
				 	alert("请输入密码");
					return false;
				 }
				 document.getElementById("indicator").style.display="block";
				 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,1,callback);
			}
		
			function callback(data)
			{
			    document.getElementById("indicator").style.display="none";
			    if(data=="no")
			    {
			        alert("账号或密码错误");
			    }
			    if(data=="yes")
			    {   
			        alert("登陆成功");
			        var url="<%=path %>/qiantai/default.jsp";
			        window.location.href=url;
			    }
			}
	        
	        
	        
	        function userLogout()
	        {
			    loginService.userLogout(callback1);
	        }
	        
	        
	        function callback1(data)
			{
			    alert("退出系统");
			    var url="<%=path %>/qiantai/default.jsp";
			    window.location.href=url;
			}
			
	        function reg()
	        {
	            var strUrl = "<%=path %>/qiantai/user/userReg.jsp";
	            window.location.href=strUrl;
                //var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
	        }
	        
	        function guanlizhongxin()
			{
			    var targetWinUrl="<%=path %>/auser/index.jsp";
				var targetWinName="newWin";
				var features="width="+screen.width+" ,height="+screen.height+" ,toolbar=yes, top=0, left=0, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=yes";
				var new_win=window.open(targetWinUrl,targetWinName,features);
			}
		</script>
</head>
  
<body>
                        <c:if test="${sessionScope.userType !=1}">
                        <form action="<%=path %>/user?type=userLogin" name="ThisForm" method="post">
						<table cellspacing="0" cellpadding="0" width="99%" align="center" border="0">
				          <tr style="height: 33px;">
				            <td align="right" width="20%" style="font-size: 11px;">账号：</td>
				            <td align="left" width="80%"><input name="userName" type="text" style="width: 120px;"/></td>
				          </tr>
				          <tr style="height: 33px;">
				            <td align="right" width="20%" style="font-size: 11px;">密码：</td>
				            <td align="left"  width="80%"><input type="password" style="width: 120px;" name="userPw"/></td>
				          </tr>
				          <tr style="height: 33px;">
				            <td align="right" width="20%" style="font-size: 11px;">&nbsp;</td>
				            <td align="left"  width="80%">
				                <input type="button" value="登录" onclick="check()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px;font-family: 微软雅黑;width: 50px;" />
				                <input type="button" value="注册" onclick="reg()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px;font-family: 微软雅黑;width: 50px;" />
				                <img id="indicator" src="<%=path %>/images/loading.gif" style="display:none"/>
				            </td>
				          </tr>
				        </table>
				        </form>
				        </c:if>
				        <c:if test="${sessionScope.userType ==1}">
						        欢迎您：${sessionScope.user.userName}
		                  &nbsp;&nbsp;
				          <a href="#" onclick="userLogout()">安全退出</a> &nbsp;&nbsp;&nbsp;&nbsp;
				          <!-- <a href="#" onclick="guanlizhongxin()">个人中心</a> &nbsp;&nbsp;&nbsp;&nbsp; -->
				          <img id="indicator1" src="<%=path %>/img/loading.gif" style="display:none;color: white"/>
				        </c:if>
</body>
</html>
