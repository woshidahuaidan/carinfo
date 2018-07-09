<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
   <%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业汽车信息管理系统</title>
<link href="bos/css/styles.css" rel="stylesheet"> 
<script type="text/javascript" src="bos/plugins/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="bos/layer/layer.js"></script>
</head>
<body>
<div class="wrapper">
	<div class="container">
		<h1>企业汽车信息管理系统</h1>
		<form class="form" method="post" action="domain.do">
			<input type="text"  name="name" id="name">
			<input type="password" name="password" id="password" ><br>
			<button type="submit" id="login-button" >
			<strong>登陆</strong></button>
			<br>
		</form>
	</div>
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
	</ul>
<script type="text/javascript">
	function login(){
		var username = $("#name").val();
        if ( username == "" ) {
        	//alert("登陆账号不能为空，请输入");
        	layer.msg("登陆账号不能为空，请输入", {time:2000, icon:5, shift:6}, function(){
        		username.focus();
        	});
        	return;
        }
        
        var userpswd = $("#password").val();
        if ( userpswd == "" ) {
        	layer.msg("登陆密码不能为空，请输入", {time:2000, icon:5, shift:6}, function(){
        		userpswd.focus();
        	});
        	return;
        }
     
       
       var jsonObj = {
        	url : "checkLogin.do",
        	type : "POST",
        	data : {
        		"name": username,
        		"password" : userpswd
        	},
        	beforeSend : function(){
        		loadingIndex = layer.load(2, {time: 10*1000});
        	},
        	success:function(result){
        		layer.close(loadingIndex);
        		if(result.success) {
        		
        			 window.location.href = "index.do" 
        		} else {
                	layer.msg("登陆账号或密码不正确，请重新输入", {time:2000, icon:5, shift:6}, function(){
                	});
        		}
        	}
        };
        $.ajax(jsonObj); 
	}
</script> 
</div>
</body>
</html>