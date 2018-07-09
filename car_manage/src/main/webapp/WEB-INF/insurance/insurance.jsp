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
 		<div data-options="region:'north',split:true,border:false" style="height:30px;text-align: right;">
 			<div style="margin-top:5px;margin-right:100px" id="sear">
					类型：<input class="easyui-combobox" id="queryContent" name="cno" style="width:200px;" 
												data-options="
												valueField:'queryContent',
												textField:'cno',
												url: 'carinfo/goto_carinfo_list.do',
												columns:[[
														{field:'cno'}
												]]">
						<button id="seaarch" type="button">查询</button>
						<button id="reset" type="button">重置</button>
			</div>
 		</div>
		<div data-options="region:'center',border:false">
			<table id="ta"></table>
		</div>
		<div id="w" class="easyui-window" title="保险信息" closed="true"  style="width:500px;height:500px;padding:5px;">
			<div style="width:400px;padding:20px;margin:20px">
				<form id="fm" action="insurance/addOrUpdate.do" method="post">
				<input type="hidden" name="sid" id="sid" >
					<table cellpadding="5">
						<tr>
								<td class="tt">车牌号：</td>
								<td><input class="easyui-combobox" id="cno"name="cno" style="width:200px;" 
												data-options="
												valueField:'cno',
												textField:'cno',
												url: 'carinfo/goto_carinfo_list.do',
												columns:[[
														{field:'cno'}
												]]
									"></td>
							</tr>
						<tr>
							<td class="tt">车险类型：</td>
							<td><input id="stype"  name="stype" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">车险金额：</td>
							<td><input id="smoney"  name="smoney" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">保险公司：</td>
							<td><input id="company"  name="company" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">车险描述：</td>
							<td><textarea name="scharact" style="height:40px;width:200px"></textarea></td>
						</tr>
						
						<tr>
							<td class="tt"></td>
							<td><input id="addBtn" type="button" value="提交" onclick="addOrUpdate()"/> </td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div> 
	
<script type="text/javascript">
		$(function(){
			$('#ta').datagrid({    
			    url:'insurance/pageQueryList.do',    
			    toolbar : [ {
					text : '新增',
					iconCls : 'icon-add',
					plain : true,
					handler: addIn
				}, '-', {
					text : '修改',
					iconCls : 'icon-edit',
					plain : true,
					handler: editIn
				}, '-', {
					text : '删除',
					iconCls : 'icon-remove',
					plain : true,
					handler: deleteIn 
				},'-', {
					text : '批量删除',
					iconCls : 'icon-remove',
					plain : true,
					handler: deleteBatch 
				}],
				rownumbers : true,//分页行号增加
				singleSelect : false,////如果为true，则只允许选择一行
				fitColumns:true,//真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动
				pagination:true,
				pageSize:1,    //在设置分页属性的时候初始化页面大小        
		    	pageList: [1,2,4],//设置每页显示的列表数
			    columns:[[    
			        {field:'ck',checkbox:true,width:30},
			        {field:'sid',title:'车险编号',width:100,align:'center'},    
			        {field:'stype',title:'车险类型',width:100,align:'center'},
			        {field:'smoney',title:'车险金额',width:100,align:'center'},
			        {field:'company',title:'保险公司',width:100,align:'center'},
			        {field:'cno',title:'车牌号',width:100,align:'center'},
			        {field:'scharact',title:'类型描述',width:100,align:'center',
			        	formatter: function(value,row,index){  
			        		   return '<span title='+value+'>'+value+'</span>'  
			        		}  },
			       
			        {field:'createTime',title:'创建时间',width:100,align:'center',
			        	formatter : function(value, row, index) {
							var d = new Date(value);
							var str = d.toLocaleString();
							return str;
					}},
			        {field:'modifyTime',title:'修改时间',width:100,align:'center',
			        	formatter : function(value, row, index) {
							var d = new Date(value);
							var str = d.toLocaleString();
							return str;
						}},
			        
			    ]]    
			});  
			
			$('#seaarch').click(function(){
				var queryContent = $('#queryContent').combobox('getText');
				
				if(queryContent != ""){
					$('#ta').datagrid({
						url:'insurance/pageQueryList.do',
						queryParams:{
							queryContent:queryContent
							}
					})
				}else{
					$('#ta').datagrid({
						url:'insurance/pageList.do',
					})
				}
				
			});
			
			$("#reset").click(function(){
				$("#sear input").val("")
			});
		})
		
		function search(){
			$('#w').dialog('open');
			$('#fm').form('clear');
		}
		
		function addIn(){
			$('#w').dialog('open');
			$('#fm').form('clear');
		}
		
		function editIn(){
			var row = $('#ta').datagrid("getSelected");
			if(row == null){
				$.messager.alert('提示','请选择要修改的记录','info');
			}else{
				$('#w').dialog('open');
				$('#fm').form('load',row);
			}
		}
		
		function addOrUpdate(){
			var json = $('#fm').serialize();
			$.post('insurance/addOrUpdate.do',json,function(data){
				if(data=="1"){
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
				 json["ids["+i+"]"] = s.sid;
			});
			$.messager.confirm('确认对话框', '确定要批量删除记录吗？', function(r){
				if(r){
					console.log(json);
					$.post('insurance/deleteBatch.do',json,function(data){
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
		
		function deleteIn(){
			var row = $('#ta').datagrid("getSelected");
			alert(row.sid);
			if(row == null){
				$.messager.alert('提示','请选择要删除的记录','info');
			}else{
				$.messager.confirm('确认对话框', '确定要删除[ '+row.stype+' ]这条记录吗？', function(r){
					if (r){
					   var url = "insurance/delete.do";
					   var id = row.sid;
					   $.post(url,{sid:id},function(data){
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