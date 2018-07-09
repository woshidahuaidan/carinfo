<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/ui-pepper-grinder/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/base.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/easyui/jquery.edatagrid.js"></script>
<title>企业汽车信息管理系统</title>

</head>

	<body class="easyui-layout">
	<div data-options="region:'north'" style="height:80px">
		<div id="titleHeader">
				<img alt="" src="js/img/logo.jpg" width="50px" height="50px">
				<span class="titleLogo">企业汽车信息管理系统</span>
		</div>
		<div id="titleUser" style="width: 300px;height: 40px;float: right;padding-top: 35px">
			<a href="exit.do"><strong>退出</strong></a> | 
			<strong>用户名称：</strong><span id="show_name" style="color:red">${dbUser.name }</span>
		</div>
	</div>
	<div data-options="region:'west',split:true,title:'菜单列表'" style="width:150px;">
		<div class="easyui-accordion" style="width:600px;">
			 <c:forEach items="${rootPermission.children}" var="permission">
				<div id="admin" title="${permission.name}" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
					<ul>
						<c:forEach items="${permission.children}" var="childPermission">
							<li><div><span class="icon icon-edit" >&nbsp</span><a href="javascript:add_tab('${childPermission.url}','${childPermission.name}')" >${childPermission.name}</a></div></li>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
	<div data-options="region:'center'">
		<div class="easyui-tabs" id="table" style="height:500px">
		</div>
	</div>
	<div data-options="region:'south',border:false" style="height:50px;padding:10px;text-align: center;">
		<h3>Copyright @2014 大连理工大学城市学院  版权所有</h3>
	</div>
<script type="text/javascript">

function add_tab(url,title){
	var b = $("#table").tabs('exists',title);
	if(!b){
		$('#table').tabs('add',{    
		    title:title,    
		    href:url,    
		    closable:true,    
		    tools:[{    
		        iconCls:'icon-mini-refresh',    
		        handler:function(){    
		        }    
		    }]    
		});  
	}else{
		$("#table").tabs('select',title);
	}
}
</script>
</body>
</html>









