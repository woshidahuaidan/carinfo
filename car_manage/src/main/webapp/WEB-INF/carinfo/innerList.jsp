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
<body>

	<div class="isotope-container row grid-space-20" >
		<c:forEach var="car" items="${carinfo }" varStatus="st" >
			<div class="col-sm-6 col-md-3 isotope-item web-design">
				<div class="image-box">
					<div class="overlay-container">
						<img src="upload/img/${car.photo }" alt="" style="width:255px;height:170px;">
						<a class="overlay" data-toggle="modal" data-target="#project_${st.count }">
							<i class="fa fa-search-plus"></i>
						</a>
					</div>
				</div>
				<!-- 弹框开始 -->
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
										<c:if test="${not empty driverList } ">
											<c:forEach items="${driverList }" var="driver">
												<h3>姓名：${driver.dname }</h3>
											</c:forEach> 
										</c:if>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 弹框结束 -->
			</div>
		</c:forEach>
	</div>
</body>
</html>