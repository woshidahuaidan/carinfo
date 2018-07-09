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

<script type="text/javascript">

</script>
<title>企业汽车信息管理系统</title>
</head>
<body>
 	<div class="easyui-layout" data-options="fit:true">
		
	<table id="dg" title="My Users" style="width:700px;height:250px"
			toolbar="#toolbar" pagination="true" idField="id"
			rownumbers="true" fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="id" width="50" editor="{type:'validatebox',options:{required:true}}">编号</th>
				<th field="ccname" width="50" editor="{type:'validatebox',options:{required:true}}">分类名称</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')">New</a>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">Save</a>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>
	</div>
		
		</div>
		<div id="w" class="easyui-window" title="Window Layout" closed="true" data-options="iconCls:'icon-save'" style="width:500px;height:300px;padding:5px;">
			<div style="width:400px;padding:20px;margin:20px">
				<form id="fm" method="post" >
					<table cellpadding="5">
						<tr>
							<td>
								<input class="easyui-textbox" type="hidden" name="id" id="id" style="width:200px;" disabled>
							</td>
						</tr>  
						<tr>
							<td class="tt">分类名称：</td>
							<td><input id="ccname"  name="ccname" class="easyui-textbox"style="width:200px"></td>
						</tr>
						<tr>
							<td class="tt"></td>
							<td>
								<a href="javascript:;" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:62px">保存</a>
		       					<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#w').dialog('close')" style="width:62px">关闭</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div> 
	
	<script type="text/javascript">
	$(function(){
		$('#dg').edatagrid({
			url: 'category/gotoCa.do',
			saveUrl: 'category/addOrUpdate.do',
			updateUrl: 'category/addOrUpdate.do',
			destroyUrl: 'category/delete.do',
			autoSave:true,
			destroyMsg:{
				norecord:{	// when no record is selected
					title:'警告',
					msg:'没有选择数据.'
				},
				confirm:{	// when select a row
					title:'提示',
					msg:'确定要删除吗?'
				}
			}
		});
		}) 
/* (function($){
		function pagerFilter(data){
			console.log(data);
	        if ($.isArray(data)){    // is array  
	            data = {  
	                total: data.length,  
	                rows: data  
	            }  
	        }
	        var dg = $(this);  
			var state = dg.data('datagrid');
	        var opts = dg.datagrid('options');  
	        var pager = dg.datagrid('getPager');  
	        pager.pagination({  
	            onSelectPage:function(pageNum, pageSize){  
	                opts.pageNumber = pageNum;  
	                opts.pageSize = pageSize;  
	                pager.pagination('refresh',{  
	                    pageNumber:pageNum,  
	                    pageSize:pageSize  
	                });  
	                dg.datagrid('loadData',state.originalRows);  
	            }  
	        });  
	        if (!state.originalRows){
	        	state.originalRows = data.rows;
	        }
	        var topRows = [];
	        var childRows = [];
	        $.map(state.originalRows, function(row){
	        	row._parentId ? childRows.push(row) : topRows.push(row);
	        });
	        data.total = topRows.length;
	        var start = (opts.pageNumber-1)*parseInt(opts.pageSize);  
	        var end = start + parseInt(opts.pageSize);  
			data.rows = $.extend(true,[],topRows.slice(start, end).concat(childRows));
			return data;
		}

		var appendMethod = $.fn.datagrid.methods.append;
		var loadDataMethod = $.fn.datagrid.methods.loadData;
		$.extend($.fn.datagrid.methods, {
			clientPaging: function(jq){
				return jq.each(function(){
					var state = $(this).data('datagrid');
					var opts = state.options;
					opts.loadFilter = pagerFilter;
					var onBeforeLoad = opts.onBeforeLoad;
					opts.onBeforeLoad = function(row,param){
						state.originalRows = null;
						onBeforeLoad.call(this, row, param);
					}
					$(this).datagrid('loadData', state.data);
					$(this).datagrid('reload');
				});
			},
			loadData: function(jq, data){
				jq.each(function(){
					$(this).data('datagrid').originalRows = null;
				});
				return loadDataMethod.call($.fn.datagrid.methods, jq, data);
			},
			append: function(jq, param){
				return jq.each(function(){
					var state = $(this).data('datagrid');
					if (state.options.loadFilter == pagerFilter){
						$.map(param.data, function(row){
							row._parentId = row._parentId || param.parent;
							state.originalRows.push(row);
						});
						$(this).datagrid('loadData', state.originalRows);
					} else {
						appendMethod.call($.fn.datagrid.methods, jq, param);
					}
				})
			}
		});

	})(jQuery);
	$(function(){
		$('#ta').datagrid().datagrid('clientPaging');
	})
	//增
	var url;
    function newUser(){
        $('#w').dialog('open').dialog('center').dialog('setTitle','增加');
        $('#fm').form('clear');
        url = 'category/insert.do';
    }
    function modifyWindow(){
		 var row = $('#ta').datagrid("getSelected");
		 console.log(row);
		 var id = row.id;
		 alert(id);
		if(row){
			$('#w').dialog('open').dialog('center').dialog('setTitle','修改');
			 $('#fm').form('load',row);
			 url = 'category/edit_category.do?id='+id;
		}
	 }
    function saveUser(){
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                var result = eval('('+result+')');
              	
                if (result.errorMsg){
                    $.messager.show({
                        title: '错误',
                        msg: result.errorMsg
                    });
                } else {
                    $('#w').dialog('close');        // 关闭窗口
                    $('#ta').datagrid('reload');    // 刷新数据
                }
            }
        });
    }
    */
    //删除操作
    function deleteCat(id){
    	var row = $('#dg').datagrid("getSelected");
    	alert(row.id);
    	var id = row.id;
    	if (row){
    		$.messager.confirm('删除','确定要删除吗?',function(r){
    		    if (r){
    		    	$.post('category/delete.do' ,{ id:id },
    		    			   function(data){
    		    				if(data=="1"){
    		    					$.messager.show({
   			    			    	 title:'删除',
   			    			    	msg:'删除成功',
   			    			    	 });
    		    					 alert(row.id);
    		    					 $('#ta').edatagrid('reload'); 
    		    				}else{
    		    					$.messager.show({
    			    			    	 title:'删除',
    			    			    	msg:'删除失败',
    			    			     });
    		    				}
    		    			   }, "json");
    		   		 }
    			});
    		}
   		 }
   
	
	</script>
</body>
</html>