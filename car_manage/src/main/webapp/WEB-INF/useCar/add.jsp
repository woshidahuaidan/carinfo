<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bos/bootstrap/bootstrap.css" rel="stylesheet"> 
<script type="text/javascript" src="bos/plugins/jquery.min.js"></script>
<script type="text/javascript" src="bos/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="bos/plugins/modernizr.js"></script>
<script type="text/javascript" src="bos/plugins/isotope/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="bos/plugins/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="bos/plugins/jquery.appear.js"></script>
<script type="text/javascript" src="bos/js/custom.js"></script>
<link href="bos/fonts/font-awesome/css/font-awesome.css" rel="stylesheet"> 
<link href="bos/css/animations.css" rel="stylesheet"> 
<link href="bos/css/style.css" rel="stylesheet"> 
<script type="text/javascript">
	function b() {
	}
</script>
<title>企业汽车信息管理系统</title>
</head>
<body>
   <!-- header start --> 
	<header class="header fixed clearfix navbar navbar-fixed-top">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="header-left">
						<div class="logo-section smooth-scroll">
							<div class="brand"><a href="">企业汽车信息管理系统</a></div>								
						</div>
					</div>
				</div>
				<div class="col-md-7">
					<div class="header-right">
						<div class="main-navigation animated">
							<nav class="navbar navbar-default" role="navigation">
								<div class="container-fluid">
									<div class="collapse navbar-collapse scrollspy smooth-scroll" >
										<ul class="nav navbar-nav navbar-right">
											<li  class="active"><a href="#">首页</a></li>
											<li><a href="carinfo/carinfAndCategory.do">汽车信息</a></li>
											<li><a href="#">驾驶人员信息</a></li>
											<li><a href="#">关于我们</a></li>
											<li><a href="#">登录</a></li>
											<li><a href="#">退出</a></li>
										</ul>
									</div>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
<!-- 	header end -->
<!-- section start --> 
	<div class="colord " style="padding-top:100px;padding-bottom:40px">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h2 class="text-center">用车信息</h2>
				</div>
			</div>
		</div>
	</div>
<!-- section end -->
<!-- section start --> 
	<section id="content">
		<div class="container">
			<div class="row" >
				<div class=" col-md-offset-3 col-md-6" >
					<p></p>
					<div class="alert alert-success hidden" id="contactSuccess">
						<strong>Success!</strong> Your message has been sent to us.
					</div>
					<div class="alert alert-error hidden" id="contactError">
						<strong>Error!</strong> There was an error sending your message.
					</div>
					<div class="contact-form">
						<form id="contact-form" role="form" novalidate="novalidate" action="useCar/insert.do" method="post"> 
							<div class="form-group has-feedback">
								<label for="name">车牌号</label>
								<select  class="form-control" id="car" onchange="getCarNo(this.value)">
								        <c:forEach var="car" items="${carinfoList}">
								        	<option value="${car.cno}">${car.cno}</option>
								        </c:forEach>   
				    		   </select>
							</div>
							<div class="form-group has-feedback">
								<label for="email">驾驶人员</label>
								<select  class="form-control" id="driver" >
								    <c:forEach var="driver" items="${listDriver}">
								        	<option value="${driver.dname}">${driver.dname}</option>
								        </c:forEach>   
				    		   </select>
							</div>
							 <div class="form-group has-feedback">
								<label for="subject">用车时间</label>
								<input type="text" class="form-control" id="utime" name="utime" placeholder="">
							</div>
							<div class="form-group has-feedback">
								<label for="subject">归还时间</label>
								<input type="text" class="form-control" id="udate" name="udate" placeholder="">
							</div>  
							<div class="form-group has-feedback">
								<label for="subject">申请人</label>
								<input type="text" class="form-control" id="uname" name="uname" placeholder="">
							</div>
							<div class="form-group has-feedback">
								<label for="message">用车原因</label>
								<textarea class="form-control" rows="6" id="ureason" name="ureason" placeholder=""></textarea>
							</div>
							<input type="submit" value="Submit" class="btn btn-default" onclick="addUse()">
							<input type="button" value="Back" class="btn btn-default" onclick="backMaintain()"> 
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- section end -->
<!-- footer start --> 
	<footer id="footer">
		<div class="subfooter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<p class="text-center">@copyright 大连理工大学城市学院</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
<!-- footer end -->

<script type="text/javascript">
	function getCarNo(cno){
		$.ajax({
			url:"",
			type:"post",
			data:{cno:cno},
			success:function(data){
				
			}
		})
	} 

	function addUse(){
		alert(1);
		$.ajax({
			url:"useCar/insert.do",
			data:{
				"utime" : $("#utime").val(),
    			"udate"  : $("#udate").val(),
    			"uname" : $("#uname").val(),
    			"ureason":$("#ureason").val(),
    			"dname":$("#driver").val(),
    			"cno":$("#car").val()
			},
			success:function(data){
				window.location.href = "useCar/useList.do";
			}
		})
	} 
	function backMaintain(){
		window.location.href = "useCar/useList.do";
	}
</script>
</body>
</html>