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
            <label>用户姓名:</label><input id="search-name" class="wu-text" style="width:100px">
            <label>手机号码:</label><input id="search-mobile" class="wu-text" style="width:100px">
            <label>桌号:</label>
            <select id="search-table" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<c:forEach items="${tableList}" var="table">
            	<option value="${table.id }">${table.sn }</option>
            	</c:forEach>
            </select>
            <label>餐桌类型:</label>
            <select id="search-tableType" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<c:forEach items="${tableTypeList}" var="tableType">
            	<option value="${tableType.id }" price="${tableType.useNum }">${tableType.name }</option>
            	</c:forEach>
            </select>
            <label>状态:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<option value="0">使用中</option>
            	<option value="1">已结算离店</option>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- 订单选择弹框 -->
<div id="show-order-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:750px;height:500px; padding:10px;">
	<table id="order-datagrid" class="easyui-datagrid"></table>
</div>
<!-- 添加弹框 -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td align="right">预定订单:</td>
                <td>
	              <input type="text" readonly="readonly" id="add-bookOrderId" name="bookOrderId" class="wu-text" />  	
                </td>
                <td><a href="#" class="select-order-btn easyui-linkbutton" iconCls="icon-add" plain="true">选择</a></td>
            </tr>
            <tr>
                <td align="right">餐桌类型:</td>
                <td>
	                <select id="add-tableTypeId" name="tableTypeId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择餐桌类型'">
		            	<c:forEach items="${tableTypeList}" var="tableType">
		            	<option value="${tableType.id }">${tableType.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
                <td></td>
            </tr>
            <tr>
                <td align="right">餐桌号:</td>
                <td>
	                <select id="add-tableId" name="tableId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择餐桌'">
		            	<c:forEach items="${tableList}" var="table">
		            	<option value="${table.id }">${table.sn }</option>
		            	</c:forEach>
	            	</select>	
                </td>
                <td></td>
            </tr>
            
            <tr>
                <td align="right">用餐人数:</td>
                <td><input type="text" id="add-useNum" name="useNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请输入用餐人数'" /></td>
            	<td></td>
            </tr>
                        <tr>
	                <td align="right">订单价格:</td>
	                <td><input type="text" id="add-checkinPrice" name="checkinPrice" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请输入价格'" /></td>
	            </tr>
            <tr>
                <td align="right">用户姓名:</td>
                <td><input type="text" id="add-name" name="name" class="wu-text easyui-validatebox" data-options=" missingMessage:'请输入用户姓名'" /></td>
            	<td></td>
            </tr>
            <tr>
                <td align="right">手机号码:</td>
                <td><input type="text" id="add-mobile" name="mobile" class="wu-text easyui-validatebox" data-options=" missingMessage:'请输入手机号'" /></td>
            	<td></td>
            </tr>
            <tr>
                <td align="right">开始时间:</td>
                <td><input type="text" id="add-arriveDate" name="arriveDate" class="wu-text easyui-datetimebox easyui-validatebox"  /></td>
            	<td></td>
            </tr>

            <tr>
                <td align="right">状态:</td>
                <td>
	                <select id="add-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择状态'">
		            	<option value="0">使用中</option>
		            	<option value="1">已结算离店</option>
	            	</select>	
                </td>
            	<td></td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><textarea id="add-remark" name="remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            	<td></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <input type="hidden" name="bookOrderId" id="edit-bookOrderId">
      <table>
            <tr>
                <td align="right">餐桌类型:</td>
                <td>
	                <select id="edit-tableTypeId" name="tableTypeId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择餐桌类型'">
		            	<c:forEach items="${tableTypeList}" var="tableType">
		            	<option value="${tableType.id }">${tableType.name }</option>
		            	</c:forEach>
	            	</select>	
                </td>
                <td></td>
            </tr>
            <tr>
                <td align="right">餐桌号:</td>
                <td>
	                <select id="edit-tableId" name="tableId" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择餐桌'">
		            	<c:forEach items="${tableList}" var="table">
		            	<option value="${table.id }">${table.sn }</option>
		            	</c:forEach>
	            	</select>	
                </td>
                <td></td>
            </tr>
            
            <tr>
                <td align="right">用餐人数:</td>
                <td><input type="text" id="edit-useNum" name="useNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请输入用餐人数'" /></td>
            	<td></td>
            </tr>
                        <tr>
	                <td align="right">订单价格:</td>
	                <td><input type="text" id="edit-checkinPrice" name="checkinPrice" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请输入价格'" /></td>
	            </tr>
            <tr>
                <td align="right">用户姓名:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options=" missingMessage:'请输入姓名'" /></td>
            	<td></td>
            </tr>
            <tr>
                <td align="right">手机号码:</td>
                <td><input type="text" id="edit-mobile" name="mobile" class="wu-text easyui-validatebox" data-options=" missingMessage:'请输入手机号'" /></td>
            	<td></td>
            </tr>
            <tr>
                <td align="right">开始时间:</td>
                <td><input type="text" id="edit-arriveDate" name="arriveDate" class="wu-text easyui-datetimebox easyui-validatebox"  /></td>
            	<td></td>
            </tr>

            <tr>
                <td align="right">状态:</td>
                <td>
	                <select id="edit-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="required:true, missingMessage:'请选择状态'">
		            	<option value="0">使用中</option>
		            	<option value="1">已结算离店</option>
	            	</select>	
                </td>
            	<td></td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><textarea id="edit-remark" name="remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            	<td></td>
            </tr>
        </table>
    </form>
</div>
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
					$("#add-name").val('');
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
            title: "编辑信息",
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
            	$("#edit-name").val(item.name);
            	$("#edit-arriveDate").datebox('setValue',item.arriveDate);
            	$("#edit-useNum").val(item.useNum);
            	$("#edit-mobile").val(item.mobile);
            	$("#edit-checkinPrice").val(item.checkinPrice);
            	$("#edit-bookOrderId").val(item.bookOrderId);
            	$("#edit-status").combobox('setValue',item.status);
            	$("#edit-tableId").combobox('setValue',item.tableId);
            	$("#edit-tableTypeId").combobox('setValue',item.tableTypeId);
            	$("#edit-remark").val(item.remark);
            }
        });
	}
	
	//结算
	function openCheckOut(){
		$.messager.confirm('信息提示','确定要结算？', function(result){
			if(result){
				var item = $('#data-datagrid').datagrid('getSelected');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要结算的数据！','info');
					return;
				}
				if(item.status != 0){
					$.messager.alert('信息提示','该状态不能结算！','info');
					return;
				}
				$.ajax({
					url:'checkout',
					dataType:'json',
					type:'post',
					data:{checkId:item.id},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','成功！','info');
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
	* Name 打开添加窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "等级信息",
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
            	$("#add-form input").val('');
            	
            }
        });
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {name:$("#search-name").val()};
		var status = $("#search-status").combobox('getValue');
		var account = $("#search-table").combobox('getValue');
		var tableType = $("#search-tableType").combobox('getValue');
		if(status != -1){
			option.status = status;
		}
		if(account != -1){
			option.accountId = account;
		}
		if(tableType != -1){
			option.tableTypeId = tableType;
		}
		option.mobile = $("#search-mobile").val();
		$('#data-datagrid').datagrid('reload',option);
	});
	
	
	function add0(m){return m<10?'0'+m:m }
	function format(shijianchuo){
	//shijianchuo是整数，否则要parseInt转换
		var time = new Date(shijianchuo);
		var y = time.getFullYear();
		var m = time.getMonth()+1;
		var d = time.getDate();
		var h = time.getHours();
		var mm = time.getMinutes();
		var s = time.getSeconds();
		return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
	}
	
	$("#add-tableTypeId").combobox({
		onSelect:function(data){
			$("#add-tableId").combobox('clear');
			$("#add-tableId").combobox('reload','load_table_list?tableTypeId='+data.value);
		}
	});
	
	$("#edit-tableTypeId").combobox({
		onSelect:function(data){
			$("#edit-tableId").combobox('clear');
			$("#edit-tableId").combobox('reload','load_table_list?tableTypeId='+data.value);
		}
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
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'tableId',title:'餐桌号',width:100,formatter:function(value,row,index){
				var tableIdList = $("#search-table").combobox('getData');
				//console.log(tableIdList);
				for(var i=0;i<tableIdList.length;i++){
					if(tableIdList[i].value == value)return tableIdList[i].text;
				}
				return value;
			}},
			{ field:'tableTypeId',title:'餐桌类型',width:150,formatter:function(value,row,index){
				var tableTypeList = $("#search-tableType").combobox('getData');
				for(var i=0;i<tableTypeList.length;i++){
					if(tableTypeList[i].value == value){
						return tableTypeList[i].text;
					}
				}
				return value;
			}},
			{ field:'checkinPrice',title:'价格',width:60,sortable:true},
			{ field:'name',title:'姓名',width:60,sortable:true},
			{ field:'useNum',title:'用餐人数',width:100,sortable:true},
			{ field:'mobile',title:'手机号',width:100,sortable:true},
			{ field:'arriveDate',title:'开桌时间',width:150,sortable:true},
			{ field:'leaveDate',title:'离店时间',width:150,formatter:function(value,row,index){
				return format(value);
			}},
			{ field:'status',title:'状态',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '使用中';
					}
					case 1:{
						return '已结算离店';
					}
				}
				return value;
			}},
			{ field:'createTime',title:'预定时间',width:150,formatter:function(value,row,index){
				return format(value);
			}},
			{ field:'remark',title:'备注',width:120,sortable:true}
		]]
	});
	
	$(".select-order-btn").click(function(){
		$('#show-order-dialog').dialog({
			closed: false,
			modal:true,
            title: "选择预定订单信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: function(){
                	var selectedOrder = $('#order-datagrid').datagrid('getSelected');
            		if(selectedOrder == null || selectedOrder.length == 0){
            			$.messager.alert('信息提示','请选择订单信息！','info');
            			return;
            		}
            		$("#add-name").val(selectedOrder.name);
                	$("#add-arriveDate").datebox('setValue',selectedOrder.arriveDate);
                	$("#add-leaveDate").datebox('setValue',selectedOrder.leaveDate);
                	$("#add-useNum").val(selectedOrder.useNum);
                	$("#add-mobile").val(selectedOrder.mobile);
                	$("#add-bookOrderId").val(selectedOrder.id);
                	$("#add-status").combobox('setValue',selectedOrder.status);
                	$("#add-tableTypeId").combobox('setValue',selectedOrder.tableTypeId);
                	$("#add-remark").val(selectedOrder.remark);
                	
                	$("#edit-name").val(selectedOrder.name);
                	$("#edit-arriveDate").datebox('setValue',selectedOrder.arriveDate);
                	$("#edit-leaveDate").datebox('setValue',selectedOrder.leaveDate);
                	$("#edit-useNum").val(selectedOrder.useNum);
                	$("#edit-mobile").val(selectedOrder.mobile);
                	$("#edit-bookOrderId").val(selectedOrder.id);
                	$("#edit-status").combobox('setValue',selectedOrder.status);
                	$("#edit-tableTypeId").combobox('setValue',selectedOrder.tableTypeId);
                	$("#edit-remark").val(selectedOrder.remark);
                	
                	$('#show-order-dialog').dialog('close'); 
                }
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#show-order-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$('#order-datagrid').datagrid({
            		url:'../book_order/list',
            		rownumbers:true,
            		singleSelect:true,
            		pageSize:20,           
            		pagination:true,
            		multiSort:true,
            		fitColumns:true,
            		idField:'id',
            	    treeField:'name',
            	    queryParams:{status:0},
            		fit:true,
            		columns:[[
            			{ field:'chk',checkbox:true},
            			{ field:'tableTypeId',title:'餐桌类型',width:150,formatter:function(value,row,index){
            				var tableTypeList = $("#search-tableType").combobox('getData');
            				for(var i=0;i<tableTypeList.length;i++){
            					if(tableTypeList[i].value == value){
            						return tableTypeList[i].text + '(用餐人数:' + $("#search-tableType option[value='"+value+"']").attr('price') + ')';
            					}
            				}
            				return value;
            			}},
            			{ field:'name',title:'预定人',width:60,sortable:true},
            			{ field:'arriveDate',title:'用餐时间',width:100,sortable:true},
            			{ field:'status',title:'状态',width:100,formatter:function(value,row,index){
            				switch(value){
            					case 0:{
            						return '预定中';
            					}
            					case 1:{
            						return '已使用';
            					}
            					case 2:{
            						return '已结算离店';
            					}
            				}
            				return value;
            			}},
            			{ field:'remark',title:'备注',width:120,sortable:true}
            		]]
            	});
            	
            }
        });
	});
</script>