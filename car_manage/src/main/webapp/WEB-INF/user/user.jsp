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

<style type="text/css">

</style>
<title>企业汽车信息管理系统</title>
</head>
<body>
 	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false">
			<table id="ta"></table>
		</div>
		<div id="m" class="easyui-window" title="Window Layout" closed="true"  style="width:500px;height:300px;padding:5px;">
			<div style="width:400px;padding:20px;margin:20px">
				<form id="mm" action="category/addRole.do" method="post">
				<input type="hidden" name="id" id="id" >
					<table cellpadding="5">
						<tr>
							<td class="tt">用户名：</td>
							<td><input id="name"  name="name" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">角色：</td>
							<td><input class="easyui-combobox" id="roleid"name="rolename" style="width:200px;" 
											data-options="
											valueField:'id',
											textField:'name',
											url: 'user/roleList.do',
											columns:[[
													{field:'name'}
											]]">
							</td>
						</tr>
						<tr>
							<td class="tt"></td>
							<td><input id="addRoleBtn" type="button" value="提交" onclick="addRole()"/> </td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div id="w" class="easyui-window" title="Window Layout" closed="true"  style="width:500px;height:300px;padding:5px;">
			<div style="width:400px;padding:20px;margin:20px">
				<form id="fm" action="category/addOrUpdate.do" method="post">
				<input type="hidden" name="id" id="id" >
					<table cellpadding="5">
						<tr>
							<td class="tt">用户名：</td>
							<td><input id="name"  name="name" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">密码：</td>
							<td><input id="password"  name="password" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt"></td>
							<td><input id="addCaBtn" type="button" value="提交" onclick="addOrUpdateCa()"/> </td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div> 
	
<script type="text/javascript">
		$(function(){
			$('#ta').datagrid({    
			    url:'user/pageList.do',    
			    toolbar : [ {
					text : '新增',
					iconCls : 'icon-add',
					plain : true,
					handler: addCa
				}, '-', {
					text : '修改',
					iconCls : 'icon-edit',
					plain : true,
					handler: editCa
				}, '-', {
					text : '删除',
					iconCls : 'icon-remove',
					plain : true,
					handler: deleteCa 
				},'-', {
					text : '批量删除',
					iconCls : 'icon-remove',
					plain : true,
					handler: deleteBatch 
				},'-', {
					text : '增加级别',
					iconCls : 'icon-remove',
					plain : true,
					handler: addRoles
				}],
				rownumbers : true,//分页行号增加
				singleSelect : false,////如果为true，则只允许选择一行
				fitColumns:true,//真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动
				pagination:true,
				pageSize:2,    //在设置分页属性的时候初始化页面大小        
		    	pageList: [1,4,6],//设置每页显示的列表数
			    columns:[[    
			        {field:'ck',checkbox:true,width:30},
			        {field:'id',title:'编号',width:100,align:'center'},    
			        {field:'name',title:'用户名',width:100,align:'center'}, 
			        {field:'password',title:'密码',width:100,align:'center'}, 
			    ]]    
			});  
		})
		
		function addRoles(){
			var row = $('#ta').datagrid("getSelected");
			alert(row.id);
			$('#m').dialog('open');
			$('#mm').form('load',row);
		}
		
		function addCa(){
			var row = $('#ta').datagrid("getSelected");
			$('#m').dialog('open');
			$('#mm').form('load',row);
		}
		
		
		function addCa(){
			$('#w').dialog('open');
			$('#fm').form('clear');
		}
		
		function editCa(){
			var row = $('#ta').datagrid("getSelected");
			alert(row.id);
			if(row == null){
				$.messager.alert('提示','请选择要修改的记录','info');
			}else{
				$('#w').dialog('open');
				$('#fm').form('load',row);
			}
		}
		
		function addRole(){
			var row = $('#ta').datagrid("getSelected");
			alert(row.id);
			var checkedItems = $('#roleid').combobox("getValues");
			alert(typeof checkedItems[0]);
			 console.log(checkedItems);
			alert(checkedItems[0]);
		    var json = {"id":row.id};
		    alert(2);
		    $.each(checkedItems,function(i, opt){
				 json["s["+i+"]"] = opt;
			});
		    console.log(json);
		    alert(3);
		    $.post("user/addRole.do",json,function(data){
		    	if(data=="1")
		    		 $('#m').dialog('close');    // 关闭窗口
		    })
		}
		
		function addOrUpdateCa(){
			var json = $('#fm').serialize();
			$.post('user/addOrUpdate.do',json,function(data){
				if(data=="1"){
					 $.messager.show({
						 title:'我的消息',
							msg:'添加成功',
							showType:'show',
							timeout:3000,
							style:{
								right:'',
								top:document.body.scrollTop+document.documentElement.scrollTop,
								bottom:''
							}
					 });
					 $('#w').dialog('close');    // 关闭窗口
	                 $('#ta').datagrid('reload');    // 刷新数据
				}
			});
		}
		
		function deleteBatch(){
			var rows = $("#ta").datagrid("getSelections");
			if(rows.length == 0){
				$.messager.alert('提示','请选择要删除的信息','info');
				return;
			}
			var json = {};
			$.each(rows,function(i, s){
				 json["ids["+i+"]"] = s.id;
			});
			$.messager.confirm('确认对话框', '确定要批量删除记录吗？', function(r){
				if(r){
					console.log(json);
					$.post('user/deleteBatch.do',json,function(data){
						if(data=="1"){
							 $.messager.show({
									title:'我的消息',
									msg:'批量删除成功',
									showType:'show',
									timeout:3000,
									style:{
										right:'',
										top:document.body.scrollTop+document.documentElement.scrollTop,
										bottom:''
									}
								});
							 $("#ta").datagrid("reload");
						}else{
							$.messager.show({
								title:'我的消息',
								msg:'批量删除失败',
								showType:'show',
								timeout:3000,
								style:{
									right:'',
									top:document.body.scrollTop+document.documentElement.scrollTop,
									bottom:''
								}
							});
						}
					});
				}
			})
		}
		
		function deleteCa(){
			var row = $('#ta').datagrid("getSelected");
			
			if(row == null){
				$.messager.alert('提示','请选择要删除的记录','info');
			}else{
				$.messager.confirm('确认对话框', '确定要删除[ '+row.ccname+' ]这条记录吗？', function(r){
					if (r){
					   var url = "user/delete.do";
					   var id = row.id;
					   $.post(url,{id:id},function(data){
						   if(data=="1"){
							   $.messager.show({
									title:'我的消息',
									msg:'删除成功',
									showType:'show',
									timeout:3000,
									style:{
										right:'',
										top:document.body.scrollTop+document.documentElement.scrollTop,
										bottom:''
									}
								});
							   $('#ta').datagrid('reload'); 
						   }else{
							   $.messager.show({
									title:'我的消息',
									msg:'删除失败。',
									showType:'show',
									style:{
										right:'',
										top:document.body.scrollTop+document.documentElement.scrollTop,
										bottom:''
									}
								});
						   }
					   })
					}
				});
			}
		}
</script>
</body>
</html>