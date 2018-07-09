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

<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">后台管理首页</div>
	<div data-options="region:'west',split:true,title:'West'" style="width:150px;padding:10px;">
		<div class="easyui-accordion" style="width:500px;height:300px;">
			<div title="商品" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
				<a href="javascript:add_tab('driver.do','商品信息管理')" >商品信息管理</a><br>
				<a href="javascript:add_tab('insurance.do','商品属性管理')">商品属性管理</a><br>
			</div>
			<div title="缓存" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
				<a href="#" target="_blank">商品缓存管理</a><br>
			</div>
		</div>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<div data-options="region:'center',title:'Center'">
		<div class="easyui-tabs" id="tt" style="height:500px">
			
		</div>
	</div>
<script type="text/javascript">
	 $(function(){
		var url = "${url}";
		var title = "${title}";
		add_tab(url,title);
	})  
	function add_tab(url,title){
		var b = $("#tt").tabs('exists',title);
		if(!b){
			$('#tt').tabs('add',{    
			    title:title,    
			    href:url,    
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			});  
		}else{
			$("#tt").tabs('select',title);
		}
	}
	function add_tab2(url,title){
		// add a new tab panel    
		$.post(url,function(data){
			$('#tt').tabs('add',{    
			    title:title,    
			    content:data,    
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			});
		});
	}
</script>
</body>
</html>








