<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>   
    <title>hnust_LiuXinglong 邮件群发消息</title>	
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<style type="text/css" >	
	</style>
  </head>
  
  <body>
  	<form action="sendMailServlet" method="post">
	    <div class="mail_box">
	    	<h1>hnust_LiuXingLong邮件群发系统</h1>
	    	<p><span>收件人：</span><input type="text" name="mailTo" placeholder="多个收件人以；分割" class="input_box"/></p>
	    	<p><span>抄送：</span><input type="text" name="copyTo" placeholder="多个收件人以；分割"class="input_box"/></p>
	    	<p><span>主题：</span><input type="text" name="title" class="input_box"/></p>
	    	<p style="height:150px">
	    		<textarea placeholder="请输入邮件正文" name="content" class="input_area"></textarea>
	    	</p>
	    	<input type="submit" value="发送邮件" class="input_btn"/>   <!-- submit 和 button 都为按钮   但是submit可以提交表单。button不可以提交表单 -->
	    </div>
    </form>
  </body>
</html>