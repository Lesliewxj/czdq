<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%String path = request.getContextPath();%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<style rel="stylesheet" type="text/css">
		*{ font-family:Microsoft Yahei; } /* 所有字体统统的事微软雅黑 */ 
		body,h1,h2,h3,h4,h5,h6,hr,p,blockquote,dl,dt,dd,ul,ol,li,pre,form,fieldset,legend,button,input,textarea,th,td{margin:0;padding:0;}body,button,input,select,textarea{font-size:12px;  line-height:1.5em;}h1,h2,h3,h4,h5,h6{font-size:100%;}address,cite,dfn,em,var{font-style:normal;}code,kbd,pre,samp{font-family:courier new,courier,monospace;}small{font-size:12px;}ul,ol{list-style:none;}a{text-decoration:none; color:#03329c;}a:hover{text-decoration:underline; color:#cc0000;}sup{vertical-align:text-top;}sub{vertical-align:text-bottom;}legend{color:#000;}fieldset,img{border:0;}button,input,select,textarea{font-size:100%;}table{border-collapse:collapse;border-spacing:0;}
		body{background: #006eb0 url(<%=path %>/images/lgbg.png) center top no-repeat;clear: both;margin: 0 auto;width: 100%;min-width: 960px;}
		.main{ margin:0 auto; width:960px; overflow:hidden;}
		.mainin{ margin:0 auto; width:381px; overflow:hidden; clear:both; padding-top:109px;}
		.mainin h1{ float:left; width:100%; height:25px; text-align:center; padding-bottom:25px;}
		.mainin h1 img{ width:196px; height:22px;}
		.mainin1{ float:left; width:381px; height:324px; background:url(<%=path %>/images/hj.png) no-repeat;}
		.mainin1 ul{ float:left; padding:25px 25px 0px; overflow:hidden; width:331px;}
		.mainin1 ul li{ float:left; width:100%; overflow:hidden; padding-bottom:25px;}
		.mainin1 ul li span, .mainin1 ul li input{ float:left;}
		.mainin1 ul li span{ width:100%; clear:both; color:#6f6f6f; font-family:"Microsoft YaHei"; font-size:14px; line-height:37px;}
		.SearchKeyword {border:1px solid #c8c8c8;width: 202px;color: #999;font-size:12px; line-height:35px; background:url(<%=path %>/images/srbg.png) no-repeat; height:35px; width:317px; padding-left:10px;}
		.SearchKeyword2 {border:1px solid #c8c8c8;width: 202px;color: #999;font-size:12px; line-height:35px; background:url(<%=path %>/images/srbg.png) no-repeat; height:35px; width:317px; padding-left:10px;}
		@media screen and (-webkit-min-device-pixel-ratio:0){.SearchKeyword2 {border:1px solid #c8c8c8;width: 202px;color: #999;line-height:35px; background:url(<%=path %>/images/srbg.png) no-repeat; height:35px; width:317px; padding-left:10px;}}
		.SearchKeywordonFocus, .SearchKeywordonFocus2{border:1px solid #3c9ae9;width: 202px;line-height:35px;color: #333;font-size:14px; background:url(<%=path %>/images/srbg2.png) no-repeat; height:35px; width:317px; padding-left:10px;}
		.SearchKeywordonFocus2{}
		@media screen and (-webkit-min-device-pixel-ratio:0){.SearchKeywordonFocus2{ font-size:25px;}}
		.tijiao{ float:left; margin:13px 0px 0px 70px; height:42px; width:190px; background:none; border:none; background:url(<%=path %>/images/dl.png) no-repeat; font-weight:bold; text-align:center; color:#fff; font-size:20px;font-family:"Microsoft YaHei"; cursor:pointer;}
		.footpage{ float:left; padding-top:30px; width:100%; text-align:center; line-height:20px; color:#fff;  font-family:"Microsoft YaHei";}
		.footpage a{ color:#fff}
		
		
		
		.cssPOPLoading{background:#fefefe; border:1px solid #EEE; width:400px; height:150px;  position:absolute;color:#333;z-index: 10003; text-align:center;display:none;}
		.cssPOPLoading a{ cursor:pointer; color:#333;}
		.cssPOPLoading a:hover{ cursor:pointer; color:#f00;}
		.showMessge{ width:100%; text-align:center; line-height:110px; letter-spacing:1px;}
		
		.cssModify{}
		.cssModify a{font-size:12px;color:#ccc; letter-spacing:1px;}
		.cssModify a:hover{color:#333;}
    </style>


    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
    
    
    <script type="text/javascript">
        function check1()
		{                                                                                         
		     if(document.ThisForm.userName.value=="")
			 {
			 	alert("请输入账号");
				document.ThisForm.userName.focus();
				return false;
			 }
			 if(document.ThisForm.userPw.value=="")
			 {
			 	alert("请输入密码");
				document.ThisForm.userPw.focus();
				return false;
			 }
			 document.getElementById("indicator").style.display="block";
			 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,0,callback);
		}
		
		function callback(data)
		{
		    document.getElementById("indicator").style.display="none";
		    if(data=="no")
		    {
		        alert("用户名或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="<%=path %>/loginSuccess.jsp";
		    }
		    
		}
    </script>
</head>
  
<body>
    <div class="main">
    	<div class="mainin">
        	<div style="font-size: 22px;color: white;margin-bottom: 30px;" align="center">基于Web的车载电器销售系统</div>
            <form method="post" name="ThisForm" action="<%=path %>/admin/index.jsp">
            <div class="mainin1" style="height: 800px;"><!-- 修改hj.png图片的高度 -->
            	<ul>
                	<li><span>账号：</span><input name="userName" type="text" class="SearchKeyword"/></li>
                    <li><span>密码：</span><input type="password" name="userPw" class="SearchKeyword2"/></li>
                    <li style="display: none"><span>类型：</span>
                        <select name="userType" style="width: 328px;">
								    <option value="0">0</option>
								    <option value="2">2</option>
						</select>
				    </li>
                    <li><button class="tijiao" onClick="check1()">提交</button></li>
                    <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
                </ul>
            </div>
            </form>
            <div class="footpage"></div>
        </div>
    </div>

    <div style="text-align:center;">&nbsp;</div>
</body>
</html>
