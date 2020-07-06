<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%String path = request.getContextPath();%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style rel="stylesheet" type="text/css">
	    *{ font-family:Microsoft Yahei; } /* 所有字体统统的事微软雅黑 */ 
    </style>

    <script type="text/javascript">
        function logout()
		{
		   if(confirm("确定要退出本系统吗??"))
		   {
			   window.parent.location="<%=path %>/login.jsp";
		   }
		}
    </script>
</head>
  
<body style="background-color: #696969">
    <table width="100%">
       <tr>
	       <td style="width: 70%"><div style="margin-left: 60px;color: white;margin-top: 1px;font-size: 20px;">基于Web的车载电器销售系统</div></td>
	       <td style="width: 30%">
               <c:if test="${sessionScope.userType==0}">
               <div style="font-size: 12px;color: white"> 
                   <p>欢迎您：管理员<a style="margin-left: 25px;color: white" href="#" onclick="logout()">退出系统</a></p>
               </div>
               </c:if>
           </td>
       </tr>
    </table>
</body>
</html>
