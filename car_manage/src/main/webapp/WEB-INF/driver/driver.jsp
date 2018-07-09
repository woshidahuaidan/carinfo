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
   	<div data-options="region:'north',split:true,border:false" style="height:40px;margin-left:90px">
 			<div style="margin-top:5px;margin-right:100px" id="sear">
					姓名：<input class="easyui-textbox"  id="name" >
					状态：<select class="easyui-combobox"  id="statusValue" style="width:200px;">
								<option value="1">使用</option>
								<option value="0">暂停</option>
							</select>
					级别：<select class="easyui-combobox"  id="levelValue" style="width:200px;">
								<option value="0">A1</option><option value="1">A2</option>
								<option value="2">A3</option><option value="3">B1</option>
								<option value="4">B2</option><option value="3">C1</option>
								<option value="3">C2</option><option value="3">C3</option>
							</select>
						<button id="seaarch" type="button">查询</button>
						<button id="reset" type="button">重置</button>
			</div>
 		</div>
		<div data-options="region:'center',border:false">
			<table id="ta"></table>
		</div>
		<div id="w" class="easyui-window" title="驾驶人员信息" closed="true"  style="width:500px;height:500px;padding:5px;">
			<div style="width:400px;padding:20px;margin:20px">
				<form id="fm" action="driver/add.do" enctype="multipart/form-data" method="post">
				<input type="hidden" name="did" id="did" >
					<table cellpadding="5">
						 <tr>
							<td class="tt">姓名：</td>
							<td><input id="dname"  name="dname" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">性别：</td>
							<td><input id="sex"  name="sex" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">出生日期：</td>
							<td><input id="birth"  name="birth" class="easyui-datebox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">身份证号：</td>
							<td><input id="dno"  name="dno" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">发证日期：</td>
							<td><input id="issueDate"  name="issueDate" class="easyui-datebox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">证件级别：</td>
							<td>
								<select class="easyui-combobox"  id="level" name="level"  style="width:200px;">
								<option value="0">A1</option><option value="1">A2</option>
								<option value="2">A3</option><option value="3">B1</option>
								<option value="4">B2</option><option value="3">C1</option>
								<option value="3">C2</option><option value="3">C3</option>
							</select>
							<!-- <input id="level"  name="level" class="easyui-textbox"style="width:200px"> --></td>
						</tr>
						<tr>
							<td class="tt">发证单位：</td>
							<td><input id="organ"  name="organ" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							 <td class="tt">图片：</td>
							<td>
								<input type="file" name="file" id="file" onchange="filechange(event)"  >
				                <br>
				                <img src="" style="display:none;width:150px;height:100px"id="img">
				                <br>
							</td>
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
		    url:'driver/pageQueryList.do',    
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
			}],
			rownumbers : true,//分页行号增加
			singleSelect : false,////如果为true，则只允许选择一行
			fitColumns:true,//真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动
			pagination:true,
			pageSize:2,    //在设置分页属性的时候初始化页面大小        
	    	pageList: [2,4,6],//设置每页显示的列表数
	    	columns:[[    
		        {field:'ck',checkbox:true,width:30},
		        /* {field:'status',title:'状态',width:100,align:'center',
			        	formatter : function(value) {
			        		var str = "";
			        		if(value==1){
			        			 str = "使用";
			        		}else{
			        			 str = "暂停";
			        		}
			        		return str;
					}
		        }, */
		        {field:'files',title:'图片',width:100,align:'center',
		        	formatter:function(value,row,index){
		            	 var str = "";
		            	if(value!="" || value!=null){
		            	str = "<img style=\"height: 50px;width: 70px;\" src=\""+"/photo/"+value+"\"/>";
		                                                return str;
		            	} 
		        }}, 
		        {field:'did',title:'编号',width:100,align:'center'},    
		        {field:'dname',title:'姓名',width:100,align:'center'},
		        {field:'sex',title:'性别',width:100,align:'center'},
		        {field:'birth',title:'出生日期',width:100,align:'center',
		        	formatter : function(value, row, index) {
						var d = new Date(value);
						var str = d.toLocaleString();
						return str;
					}
		        },
		        {field:'dno',title:'身份证号',width:100,align:'center'},
		        {field:'issueDate',title:'发证日期',width:100,align:'center',formatter : function(value, row, index) {
					var d = new Date(value);
					var str = d.toLocaleString();
					return str;
			}},
		        {field:'level',title:'证件级别',width:100,align:'center',formatter : function(value) {
	        		var str = "";
	        		if(value==0){ str = "A1";}
	        		if(value==1){ str = "A2";}
	        		if(value==2){ str = "A3";}
	        		if(value==3){ str = "B1";}
	        		if(value==4){ str = "B2";}
	        		if(value==5){ str = "C1";}
	        		if(value==6){ str = "C2";}
	        		if(value==7){ str = "C3";}
	        		return str;
			}},
		        {field:'organ',title:'发证单位',width:100,align:'center'},
		        {field:'createTime',title:'创建时间',width:100,align:'center',
		        	formatter : function(value, row, index) {
						var d = new Date(value);
						var str = d.toLocaleString();
						return str;
				}}
		    ]]
		});  
		
		$('#seaarch').click(function(){
			var dname = $("#name").val()+"";
			var status = $("#statusValue").combobox('getValue');
			alert("dname"+dname);
			
			if(dname != "" || status != "" || level != ""){
				$('#ta').datagrid({
					url:'driver/pageQueryList.do',
					queryParams:{
						dname:dname,
						status:status,
						level:level
					}
				})
			}
		});
		
		$("#reset").click(function(){
			$("#sear input").val("")
		});
	});
	
	var filechange=function(event){
            var files = event.target.files, file;
            if (files && files.length > 0) {
                file = files[0];
                var URL = window.URL || window.webkitURL;
                var imgURL = URL.createObjectURL(file);
                
                var imgObj = $("#img");
                imgObj.attr("src", imgURL);
                imgObj.show();
            }
      } 
	
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
			$("#issueDate").datebox("setValue",new Date(row.issueDate).toLocaleDateString());
			$("#birth").datebox("setValue",new Date(row.birth).toLocaleDateString());
			$("#img").show();
			$('img').attr('src','/photo/'+row.files);
		}
	}
	function addOrUpdate(){
		$("#fm").ajaxSubmit({
			beforeSubmit:function(){
	        },
			success : function() {
				  $('#w').dialog('close');    // 关闭窗口
	             $('#ta').datagrid('reload');    // 刷新数据 */
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
			 json["ids["+i+"]"] = s.did;
		});
		$.messager.confirm('确认对话框', '确定要批量删除记录吗？', function(r){
			if(r){
				console.log(json);
				$.post('driver/deleteBatch.do',json,function(data){
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
			$.messager.confirm('确认对话框', '确定要删除[ '+row.dname+' ]这条记录吗？', function(r){
				if (r){
				   var url = "driver/delete.do";
				   var id = row.did;
				   $.post(url,{did:id},function(data){
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