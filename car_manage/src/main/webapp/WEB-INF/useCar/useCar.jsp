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
   		<div data-options="region:'north',split:true,border:false" style="height:30px;text-align: right;">
 			<div style="margin-top:5px;margin-right:100px" id="sear">
					状态：<select class="easyui-combobox"  id="statusValue" style="width:200px;">
								<option value="1">已完成</option>
								<option value="0">待完成</option>
								<option value="2">不通过</option>
							</select>
						<button id="seaarch" type="button">查询</button>
			</div>
 		</div>
		<div data-options="region:'center',border:false">
			<table id="ta"></table>
		</div>
		<div id="w" class="easyui-window" title="用车信息" closed="true"  style="width:500px;height:500px;padding:5px;">
			<div style="width:400px;padding:20px;margin:20px">
				<form id="fm" action="useCar/update.do" method="post">
				<input type="hidden" name="uid" id="uid" >
					<table cellpadding="5">
						<tr>
							<td class="tt">车辆：</td>
							<td><input class="easyui-combobox" id="cno" name="cno" style="width:200px;" 
												data-options="
												valueField:'cno',
												textField:'cno',
												url: 'carinfo/goto_carinfo_list.do',
												columns:[[
														{field:'cno'}
												]]" ></td>
						</tr>
						 <tr>
							<td class="tt">用车时间：</td>
							<td><input id="utime"  name="utime" class="easyui-datebox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">归还时间：</td>
							<td><input id="udate"  name="udate" class="easyui-datebox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">驾驶人员：</td>
							<td><input class="easyui-combobox"  style="width:200px;" id="dname" name="dname "></td>
							<!-- <td><input class="easyui-combobox" id="dname"name="dname" style="width:200px;" 
											data-options="
											valueField:'dname',
											textField:'dname',
											url: 'driver/gotoDriver.do',
											columns:[[
													{field:'dname'}
											]]
								"></td> -->
						</tr>
						<tr>
							<td class="tt">申请人：</td>
							<td><input id="uname"  name="uname" class="easyui-textbox"style="width:200px"></td>
						</tr>
						
						<tr>
							<td class="tt">用车原因：</td>
							<td><textarea name="ureason" style="height:40px;width:200px"id="ureason"></textarea></td>
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
		    url:'useCar/pageList.do',    
		    toolbar : [{
				text : '增加',
				iconCls : 'icon-add',
				plain : true,
				handler: addCa
			}, '-',  {
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
				text : '通过',
				iconCls : 'icon-remove',
				plain : true,
				handler: pass
			},'-', {
				text : '不通过',
				iconCls : 'icon-remove',
				plain : true,
				handler: stop 
			}],
			rownumbers : true,//分页行号增加
			singleSelect : false,////如果为true，则只允许选择一行
			fitColumns:true,//真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动
			pagination:true,
			pageSize:2,    //在设置分页属性的时候初始化页面大小        
	    	pageList: [2,4,6],//设置每页显示的列表数
	    	columns:[[    
		        {field:'ck',checkbox:true,width:30},
		        {field:'status',title:'状态',width:100,align:'center',
		        	formatter : function(value) {
	        		var str = "";
	        		if(value==0){str = "待通过";}
	        		 if(value==2){str = "未通过";}
	        		 if(value==1){str = "已完成";}
	        		return str;
			} },  
		        {field:'uid',title:'编号',width:100,align:'center'},    
		        {field:'cno',title:'车牌号',width:100,align:'center' },
		        {field:'utime',title:'用车时间',width:100,align:'center',
		        	formatter : function(value, row, index) {
						var d = new Date(value);
						var str = d.toLocaleString();
						return str;
					}
		        },
		        {field:'udate',title:'归还时间',width:100,align:'center',
		        	formatter : function(value, row, index) {
						var d = new Date(value);
						var str = d.toLocaleString();
						return str;
					}
		        },
		        {field:'dname',title:'驾驶员',width:100,align:'center'},
		        {field:'uname',title:'申请人',width:100,align:'center'},
		        {field:'ureason',title:'用车原因',width:100,align:'center',
		        	formatter: function(value,row,index){  
	        		   return '<span title='+value+'>'+value+'</span>'  
        		} }
		    ]]
		});  
		
		$('#seaarch').click(function(){
			var status = $("#statusValue").combobox('getValue');
			
			if(status != "" ){
				$('#ta').datagrid({
					url:'useCar/pageList.do',
					queryParams:{
						status:status
					}
				})
			}
		});
		$("#cno").combobox({
			onSelect:function(record){
				var cno =  $('#cno').combobox('getValue');
				$.post("useCar/driverByCarinfoId.do",{cno:cno},function(data){
						$("#dname").combobox("loadData",data);  
				})
			}
		})
		$('#dname').combobox({   
	          valueField:'dname',     
	          textField:'dname' ,
	          columns:[[
						{field:'dname'}
				]]
	         });  
	});
	
	function pass(){
		var selected = $("#ta").datagrid("getSelections");
		//console.log(selected);
		if(selected.length == 0){
			$.messager.alert('提示','请选择要启用的列表','info');
			return;
		}
		var json = {};
		$.each(selected,function(i, v){
			 json["s["+i+"]"] = v.uid;
		});
		$.post('useCar/pass.do',json,function(data){
				$("#ta").datagrid("reload");
		});
	}
	
	function stop(){
		var selected = $("#ta").datagrid("getSelections");
		if(selected.length == 0){
			$.messager.alert('提示','请选择要停用的员工','info');
			return;
		}
		var json = {};
		$.each(selected,function(i, v){
			 json["s["+i+"]"] = v.uid;
		});
		
		$.post('useCar/stop.do',json,function(data){
				$("#ta").datagrid("reload");
		});
	}
	
	function addCa(){
		$('#w').dialog('open');
		$('#fm').form('clear');
	}
	
	function editCa(){
		var row = $('#ta').datagrid("getSelected");
		alert(row.uid);
		if(row == null){
			$.messager.alert('提示','请选择要修改的记录','info');
		}else{
			$('#w').dialog('open');
			$('#fm').form('load',row);
			$("#utime").datebox("setValue",new Date(row.utime).toLocaleDateString());
			$("#udate").datebox("setValue",new Date(row.udate).toLocaleDateString());
		}
	}
	
	function addOrUpdate(){
		var json = $('#fm').serialize();console.log(json);
		$.post('useCar/addOrUpdate.do',json,function(data){
			if(data=="1"){
				 $('#w').dialog('close');    // 关闭窗口
                 $('#ta').datagrid('reload');    // 刷新数据
			}
		});
	}
	
	function update(){
		var row = $('#ta').datagrid("getSelected");
		var utime=$("#utime").datebox('getValue');
		var udate=$("#udate").datebox('getValue');
		$.ajax({
			type:"POST",
			url:"useCar/addOrUpdate.do",
			data:{
				"uid":row.uid,
				"utime" : utime,
    			"ureason":$("#ureason").val(),
    			"uname":$("#uname").val(),
    			"udate":udate,
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
			 json["ids["+i+"]"] = s.uid;
		});
		$.messager.confirm('确认对话框', '确定要批量删除记录吗？', function(r){
			if(r){
				console.log(json);
				$.post('useCar/deleteBatch.do',json,function(data){
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
			$.messager.confirm('确认对话框', '确定要删除[ '+row.uid+' ]这条记录吗？', function(r){
				if (r){
				   var url = "useCar/delete.do";
				   var id = row.uid;
				   $.post(url,{uid:id},function(data){
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