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
<script src="bos/css/jquery.pagination.js"></script>
<script type="text/javascript" src="bos/js/custom.js"></script>
<link href="bos/css/pagination.css" rel="stylesheet"> 
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
											<li ><a href="main.do">首页</a></li>
											<li><a href="carinfo/carinfAndCategory.do">汽车信息</a></li>
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
<!-- section start --> 
	<div class="colord " style="padding-top:100px;padding-bottom:40px">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<a href="useCar/addList.do"><h2 class="text-center">用车信息</h2></a>
				</div>
			</div>
		</div>
	</div>
<!-- section end -->
	<section id="content">
	  <div class="row">
                <div class="col-md-12">
           			<div class="panel-heading" style="text-align:right">
                        <button type="button" class="btn btn-info" onclick="addList()">增加</button>
                    </div>
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                       		<th>#</th>
                                            <th>状态</th>
                                            <th>编号</th>
                                            <th>用车时间</th>
                                            <th>归还时间</th>
                                            <th>车牌号</th>
                                            <th>驾驶员</th>
                                            <th>申请人</th>
                                            <th>用车原因</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">
                                    </tbody>
                                    <tfoot>
									     <tr >
										     <td colspan="9" align="center">
												<ul class="pagination">
												</ul>
											 </td>
										 </tr>
			 						 </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
	</section>
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
	
	$(function(){
		pageQuery(0);
	})

	function pageQuery(pageIndex){
	  
		 var pageno = pageIndex+1;
		  var pagesize = 10;
		  
		  $.ajax({
			  type : "POST",
		  	  url   : "useCar/pageQueryUseCar.do",
		  	  data  : {
		  		  pageno : pageno,
		  		  pagesize : pagesize
		  	  },
		  	  success : function(result){
		  		  if(result.success){
		  			  var usePage = result.data;
		  			  var uses = usePage.datas;
		  			  var content = "";
		  			  $.each(uses,function(index,use){
		  				  var utime = new Date(use.utime).toLocaleDateString();
		  				  var udate = new Date(use.udate).toLocaleDateString();
		  				  content += '<tr>';
		                  content += '<td>'+(index+1)+'</td>';
						  content += '<td>'+use.status +'</td>';
		                  content += '<td>'+ use.uid +'</td>';
		                  content += '<td>'+ utime   +'</td>';
		                  content += '<td>'+ udate   +'</td>';
		                  content += '<td>'+ use.uname   +'</td>';
		                  content += '<td>'+ use.ureason   +'</td>';
		              	  content += '<td>'+ use.cno   +'</td>';
		                  content += '<td>'+ use.dname   +'</td>';
		                  content += '</tr>';
		  			  });
		  			  $("#tbody").html(content);
		  			  
		  			$(".pagination").pagination(usePage.totalsize, {
						num_edge_entries: 2, //边缘页数
						num_display_entries: 2, //主体页数
						callback: pageQuery,
						prev_text:"上一页",
						next_text:"下一页",
						link_to:"javascript:;",
						current_page:pageIndex,
						items_per_page:pagesize //每页显示1项
					});
		  		  }
		  	  }
		  });
	}

	function addList(){
		window.location.href = "useCar/addList.do";
	}
</script>
</body>
</html>