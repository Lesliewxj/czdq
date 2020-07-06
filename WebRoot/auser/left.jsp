<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%String path = request.getContextPath();%>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8"/>
	
	<style rel="stylesheet" type="text/css">
	    html{height:100%;}
		body{font:14px/1.5 'Microsoft Yahei';word-wrap:break-word;word-break:break-all;-webkit-text-size-adjust:none;background:#fff;color:#333;}
		body,dl,dd,h1,h2,h3,h4,h5,h6,p,form,ul,ol,blockquote{margin:0}
		img{border:0 none;vertical-align:middle}
		input,select,textarea{font-size:14px;color:#333}
		input{vertical-align:middle;padding:2px;margin:0}
		table{border-collapse:collapse;border-spacing:0}
		select,input,button{font:14px/20px Verdana,Simsun,Helvetica,Arial,sans-serif;}
		em,i,cite,blockquote{font-style:normal}
		ul,ol{list-style:none outside;padding:0}
		h1,h2,h3,h4,h5,h6{font-size:100%}
		textarea{overflow-y:auto;padding:3px}
		a{color:#428bca;text-decoration:none;outline:0}
		a:hover,a:active{color:#2a6496;text-decoration:none;}
		a:focus{outline:0;}
		
		@font-face{font-family:'icomoon';src:url('/xiangmu/fonts/icomoon.eot');src:url('/xiangmu/fonts/icomoon.eot?#iefix') format('embedded-opentype'),url('/xiangmu/fonts/icomoon.woff') format('woff'),url('/xiangmu/fonts/icomoon.ttf') format('truetype'),url('/xiangmu/fonts/icomoon.svg#icomoon') format('svg');font-weight:normal;font-style:normal;}
		.icon-font { font-family:'icomoon'; speak:none; font-weight:400; font-style:normal; font-variant:normal; text-transform:none; line-height:1; -webkit-font-smoothing:antialiased; }
		.sidebar-list li{border:1px solid #e5e5e5;border-width:1px 0;}
		.sidebar-list li .icon-font{margin-right: 5px;color: #888;font-size: 14px;}
		.sidebar-list li a{color: #333;}
		.sidebar-list li a:hover{background: #fff;color: #1963AA;}
		.sub-menu{border-top: 1px solid #e5e5e5;background: #fff;}
		.sub-menu li{padding-left: 21px;}
		.sub-menu li.on{background: #1963AA;}
		.sub-menu li.on a{background: #1963AA;color: #fff;}
		.sub-menu li.on .icon-font{color: #fff;}
		.sub-menu .icon-font{font-size: 11px;}
    </style>

    <script type="text/javascript">
    
    </script>
</head>
  
<body>
<ul class="sidebar-list">
    <li>
        <ul class="sub-menu">
            <li style="padding: 10px;margin-left: 20px;"><a href="<%=path %>/admin/userinfo/userinfo.jsp" target="right"><i class="icon-font">&#xe004;</i>我的信息</a></li>
        </ul>
    </li>
</ul>
</body>
</html>
