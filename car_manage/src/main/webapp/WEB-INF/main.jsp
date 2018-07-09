<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="bos/plugins/jquery.min.js"></script>
<script type="text/javascript" src="bos/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="bos/plugins/modernizr.js"></script>
<script type="text/javascript" src="bos/plugins/isotope/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="bos/plugins/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="bos/plugins/jquery.appear.js"></script>
<script type="text/javascript" src="bos/js/custom.js"></script>
<link href="bos/bootstrap/bootstrap.css" rel="stylesheet"> 
<link href="bos/fonts/font-awesome/css/font-awesome.css" rel="stylesheet"> 
<link href="bos/css/animations.css" rel="stylesheet"> 
<link href="bos/css/animate.css" rel="stylesheet"> 
<link href="bos/css/style.css" rel="stylesheet"> 
<title>企业汽车信息管理系统</title>
<style>

</style>
</head>
<body class="">
<!-- header start --> 
	<header class="header fixed clearfix navbar navbar-fixed-top">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="header-left">
						<div class="logo smooth-scroll">
							<img id="logo" src="images/login.png" alt="Worthy">
						</div>
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
											<li><a href="driver/driverAndCategory.do">驾驶人员信息</a></li>
											<li><a href="exit2.do">登录</a></li>
											<li><a href="login2.do">退出</a></li>
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

<!--图片轮询开始  -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	  	<!-- Indicators -->
	  	 <ol class="carousel-indicators">
	  	  	<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	    	<li data-target="#carousel-example-generic" data-slide-to="1"></li>
	    	<li data-target="#carousel-example-generic" data-slide-to="2"></li>
	  	 </ol>
	  	<!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		      <div class="item active" >
			      <img src="images/banner.jpg" height="300" width="1920" >
			      <div class="carousel-caption">
			        
			      </div>
		      </div>
		      <div class="item" >
			      <img src="images/banner.jpg" height="300" width="1920" >
			      <div class="carousel-caption">
			       
			      </div>
		      </div>
		      <div class="item" >
			      <img src="images/banner.jpg" height="300" width="1920" >
			      <div class="carousel-caption">
			      
			      </div>
		      </div>
		  </div>
	  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
	</div>
<!--图片轮询结束  -->

<!-- section start --> 
	<section class="section transprant-bg pclear secPadding">
		<div class="container no-view" data-animation-effect="fadeIn">
			<h1 id="operation" class="title text-center">Operation</h1>
			<div class="space"></div>
			<div class="row">
				<div class="col-md-4">
					<a href="useCar/useList.do" style="text-decoration: none;">
						<div class="media block-list text-center">
							<i class="fa fa-user"></i>
							<div style="padding-left:50px;padding-top:30px">
								<h3>用车申请</h3>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="maintain/maintainList.do" style="text-decoration: none;">
						<div class="media block-list text-center">
							<i class="fa fa-wrench"></i>
							<div style="padding-left:50px;padding-top:30px">
								<h3>维修单</h3>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="illegal/illegalList.do" style="text-decoration: none;">
						<div class="media block-list text-center">
							<i class="fa fa-warning"></i>
							<div style="padding-left:50px;padding-top:30px">
								<h3>违章单</h3>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>			  
	</section>
<!-- section end -->

<!--  carinfo列表显示开始-->
	<!-- section start --> 
		<section class="section secPadding">
			<div class="container">
				<h1 class="text-center title" id="portfolio">Carinfo</h1>
				<div class="separator"></div>
				<p class="lead text-center">你想要的在这里<br> 。。。。。。</p>
				<br>			
				<div class="row no-view" data-animation-effect="fadeIn">
					<div class="col-md-12">

						<!-- isotope filters start -->
						<div class="filters text-center">
							<ul class="nav nav-pills">
								<li><a href="carinfo/carinfAndCategory.do">更多</a></li>
							</ul>
						</div>
						<!-- isotope filters end -->

						<!-- portfolio items start -->
						<div class="isotope-container row grid-space-20">
							<c:forEach var="car" items="${carinfoList }" varStatus="st" end="3">
								<div class="col-sm-6 col-md-3 isotope-item web-design">
									<div class="image-box">
										<div class="overlay-container">
											<img src="upload/img/${car.photo }" alt="" style="width:255px;height:170px;">
											<a class="overlay" data-toggle="modal" data-target="#project_${st.count }">
												<i class="fa fa-search-plus"></i>
											</a>
										</div>
										<a class="btn btn-default btn-block" data-toggle="modal" data-target="#project-1">Project Title</a>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="project_${st.count }" tabindex="-1" role="dialog" aria-labelledby="project-1-label" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
													<h4 class="modal-title" id="project-1-label">${car.cid }</h4>
												</div>
												<div class="modal-body">
													<div class="row">												 
														<div class="col-md-12">
															<img src="upload/img/${car.photo }" alt="">
															<br/>
															<h3>车牌号：${car.cno }</h3><h3>座位数：${car.cnum }</h3>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- portfolio items end -->
					</div>
				</div>
			</div>
		</section>
<!-- section end -->
<!--  carinfo列表显示结束-->

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
</body>
</html>
