<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   	<!-- <base href="<%=basePath%>">  -->    
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
	<script type="text/javascript">
		function Registered(){
		if($("#username").val()==""){
			alert("请输入用户名！");			
		}
		else if($("#password").val()==""){
			alert("请输入密码！");		
		}			
		else {
			$.ajax({			
				type:"post",  // 请求类型
				dateType:"text", // 返回类型				
				url:"LoginServlet",
				data:"name="+$("#username").val()+"&pass="+$("#password").val()+"&falg="+$("#falg").val(), // 作为属性传入后台						
				success:function(data){
					if("用户名不存在"==data){
					   //  注册失败
					   	alert("用户名已存在或用户名和密码格式错误注册失败!请重新注册！");
						window.location.href="register.jsp";					
					}else{				
					  //  注册成功
					  	alert("恭喜您以注册成功!");
						window.location.href="success.jsp";
					}			
				}				
			});
		}
	}
	</script>
  </head>
  <body>
   	<div class="page-container">
   		<h1>Registered</h1>		
   		<input type="text" class="username" id="username" placeholder="Student ID"/><br/>
   		<input type="password" class="password" id="password" placeholder="Password"/><br/>
   		<input type="button" class="falg" id="falg" value="确认" onclick="Registered()"/>
		<div class="error"><span>+</span></div>
   		<div class="connect">
            <p>Or connect with:</p>
            <p>
               <a class="facebook" href=""></a>
               <a class="twitter" href=""></a>
            </p>   
        </div>		
   	</div>
   	<div align="center">Collect from <a href="http://hnustliuxinglong.eicp.net:11705/" target="_blank" title="hnust_LiuXingLong">hnust_LiuXingLong</a></div>
   	<script src="assets/js/jquery-1.8.2.min.js"></script>
    <script src="assets/js/supersized.3.2.7.min.js"></script>
    <script src="assets/js/supersized-init.js"></script>
    <script src="assets/js/scripts.js"></script>
  </body>
</html>


