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
<script type="text/javascript" src="bos/layer/layer.js"></script>
<link href="bos/fonts/font-awesome/css/font-awesome.css" rel="stylesheet"> 
<link href="bos/css/animations.css" rel="stylesheet"> 
<link href="bos/css/style.css" rel="stylesheet"> 

<style type="text/css">
		#c{
			background-color: #e07440;
		}
		#c h4{
			text-decoration: none;
			color: #fffefe
		}
		#c ul li a:hover{
			text-decoration: none;
		}
</style>
</head>
<body class="">
<!-- header start --> 
	<header class="header fixed clearfix navbar navbar-fixed-top">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="logo smooth-scroll">
						<img id="logo" src="images/login.png" alt="Worthy">
					</div>
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
											<li ><a href="#">首页</a></li>
											<li class="active"><a href="carinfo/carinfAndCategory.do">汽车信息</a></li>
											<li><a href="driver/driverAndCategory.do">驾驶人员信息</a></li>
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

	
<!--  carinfo列表显示开始-->
	<!-- section start --> 
		<section class="section secPadding" >
			<div class="container" style="margin-top:90px">
				<h1 class="text-center title" id="portfolio">Carinfo</h1>
				<div class="separator"></div>
				<p class="lead text-center">你想要的在这里<br> 。。。。。。</p>
				<br>			
				<div class="row no-view" data-animation-effect="fadeIn">
					<div class="col-md-12">
						<!-- isotope filters start -->
						<div class="filters text-center">
							<ul class="nav nav-pills" id="u">
								<c:forEach var="cat" items="${categoryList }" >
									<%-- <li><a href="javascript:;" onclick="carinfoByName(this.innerHTML)" >${cat.id }:${cat.ccname }</a></li> --%>
									<li><a href="javascript:;" onclick="carinfoById()" id="${cat.id }">${cat.ccname }</a></li>
								</c:forEach>
							</ul>
						</div>
						<!-- isotope filters end -->
						<!-- 信息框开始 -->
						<div id="innerList">
							<jsp:include page="innerList.jsp"></jsp:include>
						</div>
						<!--信息框结束  -->
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
<script type="text/javascript">
	function carinfoById(){
	/* 	var id=this.id; */
		var queryid=$('#u a').attr("id")+"";
	alert(queryid);
	
	if(queryid !=""){
		$.post("carinfo/carinfoByCategoryId.do" ,{queryid:queryid},function(data){
			var sss = JSON.stringify(data);
			var loadingIndex =  layer.load(2, {time: 5*1000});
			$("#innerList").html(data);
			alert(1)
		})  
	}
		
		/* var ccname = str;
		console.log(ccname);
		alert(ccname);
		  $.post("carinfo/carinfoByCategory.do" ,{ccname:ccname},function(data){
			var sss = JSON.stringify(data);
			var loadingIndex =  layer.load(2, {time: 5*1000});
			$("#innerList").html(data);
			alert(1)
		})   */
	}
</script>

</body>
</html>
