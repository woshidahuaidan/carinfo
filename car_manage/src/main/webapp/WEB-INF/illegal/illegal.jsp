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
<link rel="stylesheet" type="text/css" href="css/admin-all.css" />
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
	function b() {
	}
</script>
<title>企业汽车信息管理系统</title>
</head>
<body>
   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false">
			<table id="ta"></table>
		</div>
		<div id="w" class="easyui-window" title="违章信息" closed="true"  style="width:500px;height:500px;padding:5px;">
			<div style="width:400px;padding:20px;margin:20px">
				<form id="fm" action="illegal/update.do" enctype="multipart/form-data" method="post">
				<input type="hidden" name="eid" id="eid" >
					<table cellpadding="5">
						 <tr>
							<td class="tt">违章时间：</td>
							<td><input id="etime"  name="etime" class="easyui-datebox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">罚款金额：</td>
							<td><input id="emoney"  name="emoney" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">违章地址：</td>
							<td><input id="eaddr"  name="eaddr" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">违章原因：</td>
							<td><textarea name="ereason" style="height:40px;width:200px"id="ereason"></textarea></td>
						</tr>
						<tr>
							<td class="tt">违章人员：</td>
							<td><input class="easyui-combobox" id="dname"name="dname" style="width:200px;" 
											data-options="
											valueField:'dname',
											textField:'dname',
											url: 'driver/gotoDriver.do',
											columns:[[
													{field:'dname'}
											]]
								"></td>
						</tr>
						<tr>
							<td class="tt">违章车辆：</td>
							<td><input class="easyui-combobox" id="cno" name="cno" style="width:200px;" 
												data-options="
												valueField:'cno',
												textField:'cno',
												url: 'carinfo/goto_carinfo_list.do',
												columns:[[
														{field:'cno'}
												]]"></td>
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
		    url:'illegal/pageList.do',    
		    toolbar : [  {
				text : '增加',
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
			}],
			rownumbers : true,//分页行号增加
			singleSelect : false,////如果为true，则只允许选择一行
			fitColumns:true,//真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动
			pagination:true,
			pageSize:1,    //在设置分页属性的时候初始化页面大小        
	    	pageList: [1,4,6],//设置每页显示的列表数
	    	columns:[[    
		        {field:'ck',checkbox:true,width:30},
		        {field:'eid',title:'编号',width:100,align:'center'},    
		        {field:'etime',title:'违章时间',width:100,align:'center',
		        	formatter : function(value, row, index) {
						var d = new Date(value);
						var str = d.toLocaleString();
						return str;
					}
		        },
		        {field:'cno',title:'违章车辆',width:100,align:'center'},
		        {field:'dname',title:'违章人员',width:100,align:'center'},
		        {field:'emoney',title:'罚款金额',width:100,align:'center'},
		        {field:'eaddr',title:'违章地址',width:100,align:'center',
		        	formatter: function(value,row,index){  
		        		   return '<span title='+value+'>'+value+'</span>'  
	        		} },
		        {field:'ereason',title:'违章原因',width:100,align:'center',
		        	formatter: function(value,row,index){  
	        		   return '<span title='+value+'>'+value+'</span>'  
        		} }
		    ]]
		});  
		
	});
	
	function addCa(){
		$('#w').dialog('open');
		$('#fm').form('clear');
	}
	
	function editCa(){
		var row = $('#ta').datagrid("getSelected");
		if(row == null){
			$.messager.alert('提示','请选择要修改的记录','info');
		}else{
			$('#w').dialog('open');
			$('#fm').form('load',row);
			$("#etime").datebox("setValue",new Date(row.etime).toLocaleDateString());
		}
	}
	
	function addOrUpdate(){
		var json = $('#fm').serialize();
		$.post('illegal/addOrUpdate.do',json,function(data){
			if(data=="1"){
				 $('#w').dialog('close');    // 关闭窗口
                 $('#ta').datagrid('reload');    // 刷新数据
			}
		});
	}
	
	function update(){
		var row = $('#ta').datagrid("getSelected");
		var etime=$("#etime").datebox('getValue');
		$.ajax({
			type:"POST",
			url:"illegal/update.do",
			data:{
				"eid":row.eid,
				"etime" : etime,
    			"ereason":$("#ereason").val(),
    			"emoney":$("#emoney").val(),
    			"eaddr":$("#eaddr").val(),
    			"dname":$("#dname").combobox('getValue'),
    			"cno":$("#cno").combobox('getValue')
			},
			success:function(data){
				 $('#w').dialog('close');    // 关闭窗口
                 $('#ta').datagrid('reload');    // 刷新数据
			}
		})
	}
	
	function deleteBatch(){
		var rows = $("#ta").datagrid("getSelections");
		if(rows.length == 0){
			$.messager.alert('提示','请选择要删除的信息','info');
			return;
		}
		var json = {};
		$.each(rows,function(i, s){
			 json["ids["+i+"]"] = s.eid;
		});
		$.messager.confirm('确认对话框', '确定要批量删除记录吗？', function(r){
			if(r){
				console.log(json);
				$.post('illegal/deleteBatch.do',json,function(data){
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
			$.messager.confirm('确认对话框', '确定要删除[ '+row.eid+' ]这条记录吗？', function(r){
				if (r){
				   var url = "illegal/delete.do";
				   var id = row.eid;
				   $.post(url,{eid:id},function(data){
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