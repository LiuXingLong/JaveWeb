<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <!-- <base href="<%=basePath%>"> -->
    
    <title>学生异步安全认证系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/supersized.css">
    <link rel="stylesheet" href="assets/css/style.css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script src="assets/js/jquery-1.8.2.min.js"></script>
    <script src="assets/js/supersized.3.2.7.min.js"></script>
    <script src="assets/js/supersized-init.js"></script>
    <script src="assets/js/scripts.js"></script>
	<script type="text/javascript">
		function login(){
			if(${sessionScope.st.username==null}){			
				window.location.href="index.jsp";
			}		
		}
	</script>
  </head>
  <body onload="login()">
  <audio autoplay="autopaly">
		<source src="paomo.mp3" type"audio/mp3"/>
	</audio>
   	<div class="page-container">
   		<h1>登入成功</h1><br/>
   		欢迎${sessionScope.st.username}来到这里！！！<br/><br/>
			系统正在创建中，感谢您的支持........
   		<div class="connect">
            <p>Or connect with:</p>
            <p>
               <a class="facebook" href=""></a>
               <a class="twitter" href=""></a>
            </p>
        </div>		
   	</div>
   	<div align="center">Collect from <a href="http://hnustliuxinglong.eicp.net:11705/" target="_blank" title="hnust_LiuXingLong">hnust_LiuXingLong</a></div>
  </body>
</html>