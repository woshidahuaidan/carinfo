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
		<div id="w" class="easyui-window" title="车辆信息" closed="true"  style="width:500px;height:300px;padding:5px;">
			<div style="width:400px;padding:20px;margin:20px">
				<form id="fm" action="carinfo/addOrUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="cid" id="cid" >
					<table cellpadding="5">
						<tr>
							<td class="tt">车辆名称：</td>
							<td><input id="cmodel"  name="cmodel" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">座位数：</td>
							<td><input id="cnum"  name="cnum" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">车牌号：</td>
							<td><input id="cno"  name="cno" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt">车辆类型：</td>
							<td><input class="easyui-combobox" id="id" name="id" style="width:200px;" 
											data-options="
											valueField:'id',
											textField:'ccname',
											url: 'category/gotoCa.do',
											columns:[[
													{field:'ccname'}
											]]
								"></td>
						</tr>
						<tr>
							<td class="tt">颜色：</td>
							<td><input id="ccolor"  name="ccolor" class="easyui-textbox"style="width:200px"></td>
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
			    url:'carinfo/pageList.do',    
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
				pageSize:1,    //在设置分页属性的时候初始化页面大小        
		    	pageList: [1,2,3],//设置每页显示的列表数
			    columns:[[    
			        {field:'ck',checkbox:true,width:30},
			       /*  {field:'status',title:'状态',width:100,align:'center',
			        	formatter : function(value) {
			        		var str = "";
			        		if(value==1){
			        			 str = "使用";
			        		}else{
			        			 str = "暂停";
			        		}
			        		return str;
					}
		        },  */
		        {field:'photo',title:'图片',width:100,align:'center',
		        	formatter:function(value,row,index){
			            	 var str = "";
			            	if(value!="" || value!=null){
			            	str = "<img style=\"height: 50px;width: 70px;\" src=\""+"/photo/"+value+"\"/>";
			                                                return str;
			            	} 
			        }}, 
			        {field:'cid',title:'编号',width:100,align:'center'}, 
			        {field:'cmodel',title:'车辆名称',width:100,align:'center'}, 
			        {field:'cno',title:'车牌号',width:100,align:'center'}, 
			        {field:'cnum',title:'座位数',width:100,align:'center'}, 
			        {field:'ccolor',title:'颜色',width:100,align:'center'}, 
			        {field:'createTime',title:'添加时间',width:100,align:'center',
			        	formatter : function(value, row, index) {
							var d = new Date(value);
							var str = d.toLocaleString();
							return str;
						}
			        }
			    ]]    
			});  
		})
		
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
				$("#img").show();
				$('img').attr('src','/photo/'+row.photo);
			}
		}
		
		function addOrUpdateCa(){
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
				 json["ids["+i+"]"] = s.cid;
			});
			$.messager.confirm('确认对话框', '确定要批量删除记录吗？', function(r){
				if(r){
					console.log(json);
					$.post('carinfo/deleteBatch.do',json,function(data){
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
			alert(row.cid);
			if(row == null){
				$.messager.alert('提示','请选择要删除的记录','info');
			}else{
				$.messager.confirm('确认对话框', '确定要删除[ '+row.cid+' ]这条记录吗？', function(r){
					if (r){
					   var url = "carinfo/delete.do";
					   var id = row.cid;
					   $.post(url,{cid:id},function(data){
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