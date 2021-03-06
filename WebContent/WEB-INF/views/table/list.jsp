<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
            <%@include file="../common/menus.jsp"%>
        </div>
        <div class="wu-toolbar-search">
            <label>餐桌编号:</label><input id="search-sn" class="wu-text" style="width:100px">
            <label>餐桌类型:</label>
            <select id="search-tableType" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<c:forEach items="${tableTypeList }" var="tableType">
            	<option value="${tableType.id }">${tableType.name }</option>
            	</c:forEach>
            </select>
            <label>所属区域:</label>
            <select id="search-floor" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<c:forEach items="${floorList }" var="floor">
            	<option value="${floor.id }">${floor.name }</option>
            	</c:forEach>
            </select>
            <label>状态:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<option value="0">可用</option>
            	<option value="1">正在使用</option>
            	<option value="2">打扫中</option>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- 添加弹框 -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:420px; padding:10px;">
	<form id="add-form" method="post">
        <table>

            <tr>
                <td align="right">餐桌编号:</td>
                <td><input type="text" id="add-sn" name="sn" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写餐桌编号'" /></td>
            </tr>
            <tr>
                <td align="right">餐桌类型:</td>
                <td>
	                <select id="add-tableTypeId" name="tableTypeId" class="easyui-combobox" panelHeight="auto" style="width:268px">
		            	<c:forEach items="${tableTypeList }" var="tableType">
		            	<option value="${tableType.id }">${tableType.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">所属区域:</td>
                <td>
	                <select id="add-floorId" name="floorId" class="easyui-combobox" panelHeight="auto" style="width:268px">
		            	<c:forEach items="${floorList }" var="floor">
		            	<option value="${floor.id }">${floor.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">状态:</td>
                <td>
	                <select id="add-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
		            	<option value="0">可用</option>
		            	<option value="1">正在使用</option>
		            	<option value="2">打扫中</option>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><textarea id="add-remark" name="remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
          
           <tr>
                <td align="right">餐桌编号:</td>
                <td><input type="text" id="edit-sn" name="sn" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写餐桌编号'" /></td>
            </tr>
            <tr>
                <td align="right">餐桌类型:</td>
                <td>
	                <select id="edit-tableTypeId" name="tableTypeId" class="easyui-combobox" panelHeight="auto" style="width:268px">
		            	<c:forEach items="${tableTypeList }" var="tableType">
		            	<option value="${tableType.id }">${tableType.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">所属区域:</td>
                <td>
	                <select id="edit-floorId" name="floorId" class="easyui-combobox" panelHeight="auto" style="width:268px">
		            	<c:forEach items="${floorList }" var="floor">
		            	<option value="${floor.id }">${floor.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">状态:</td>
                <td>
	                <select id="edit-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
		            	<option value="0">可用</option>
		            	<option value="1">正在使用</option>
		            	<option value="2">打扫中</option>
	            	</select>	
                </td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><textarea id="edit-remark" name="remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
<div id="process-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-upload',title:'正在上传图片'" style="width:450px; padding:10px;">
<div id="p" class="easyui-progressbar" style="width:400px;" data-options="text:'正在上传中...'"></div>
</div>
<input type="file" id="photo-file" style="display:none;" onchange="upload()">
<%@include file="../common/footer.jsp"%>

<!-- End of easyui-dialog -->
<script type="text/javascript">

/**
*  添加记录
*/
function add(){
	var validate = $("#add-form").form("validate");
	if(!validate){
		$.messager.alert("消息提醒","请检查你输入的数据!","warning");
		return;
	}
	var data = $("#add-form").serialize();
	$.ajax({
		url:'add',
		dataType:'json',
		type:'post',
		data:data,
		success:function(data){
			if(data.type == 'success'){
				$.messager.alert('信息提示','添加成功！','info');
				$("#add-sn").val('');
				$("#add-remark").val('');
				$('#add-dialog').dialog('close');
				$('#data-datagrid').datagrid('reload');
			}else{
				$.messager.alert('信息提示',data.msg,'warning');
			}
		}
	});
}
	
	/**
	* 编辑记录
	*/
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','修改成功！','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	
	/**
	* 删除记录
	*/
	function remove(){
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var item = $('#data-datagrid').datagrid('getSelected');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
					return;
				}
				
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{id:item.id},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','删除成功！','info');
							$('#data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
			}	
		});
	}
	
	/**
	* Name 打开编辑窗口
	*/
	function openEdit(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要编辑的数据！','info');
			return;
		}
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "编辑餐桌信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            	$("#edit-id").val(item.id);
            	$("#edit-sn").val(item.sn);
            	$("#edit-status").combobox('setValue',item.status);
            	$("#edit-tableTypeId").combobox('setValue',item.tableTypeId);
            	$("#edit-floorId").combobox('setValue',item.floorId);
            	$("#edit-remark").val(item.remark);
            }
        });
	}
	
	/**
	* Name 打开添加窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加餐桌信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#add-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            	
            }
        });
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {sn:$("#search-sn").val()};
		var status = $("#search-status").combobox('getValue');
		var tableType = $("#search-tableType").combobox('getValue');
		var floor = $("#search-floor").combobox('getValue');
		if(status != -1){
			option.status = status;
		}
		if(tableType != -1){
			option.tableTypeId = tableType;
		}
		if(floor != -1){
			option.floorId = floor;
		}
		$('#data-datagrid').datagrid('reload',option);
	});
	
	
	/** 
	* 载入数据
	*/
	$('#data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		singleSelect:true,
		pageSize:20,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    treeField:'sn',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'sn',title:'餐桌编号',width:100,sortable:true},
			{ field:'tableTypeId',title:'餐桌类型',width:100,formatter:function(value,row,index){
				var tableTypeList = $("#search-tableType").combobox('getData');
				for(var i=0;i<tableTypeList.length;i++){
					if(tableTypeList[i].value == value)return tableTypeList[i].text;
				}
				return value;
			}},
			{ field:'floorId',title:'所属区域',width:100,formatter:function(value,row,index){
				var floorList = $("#search-floor").combobox('getData');
				for(var i=0;i<floorList.length;i++){
					if(floorList[i].value == value)return floorList[i].text;
				}
				return value;
			}},
			{ field:'status',title:'状态',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '可用';
					}
					case 1:{
						return '正在使用';
					}
					case 2:{
						return '打扫中';
					}
				}
				return value;
			}},
			{ field:'remark',title:'餐桌备注',width:200},
		]]
	});
</script>