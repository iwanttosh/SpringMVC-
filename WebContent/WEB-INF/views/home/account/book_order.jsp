<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  <title>预定系统</title>
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
    <link rel="stylesheet" href="../../resources/home/css/index.css">
    <link rel="stylesheet" href="../../resources/home/css/order.css">
    <link rel="stylesheet" href="../../resources/home/css/jquery-ui.min.css">
</head>
<body>
<!--- 页头--->
<div id="c_header"></div>
<!----主体-->
<div id="section">
    <!--信息-->
    <div class="hotel_inf_w">

        <div class="hotel_roominfobox">
            <a href="#"><img src="${tableType.photo }" alt=""/></a>
            <div class="info">
            <h2>${tableType.name }</h2>
            
            </div>
            <ul class="hotel_detail">
            <li><span>预定数:</span>${tableType.bookNum }</li>
            <li><span>可坐:</span>${tableType.useNum }人</li>
            <li><span>其他:</span>${tableType.remark }</li>
            </ul>
        </div>
        <div class="jump">
         
            <a href="../index">更多</a>
        </div>
    </div>
    <!--预定信息-->
    <div class="book_info">
        <form id="order_info">
            <ul>
                <input type="hidden" name="rid" value=""/>
                <li>
                    <h3>预定信息</h3>

                    <div class="info_group">
                        <label>预定时间</label><input type="text" name="arriveDate" id="arriveDate" class="datepicker"/>
                    </div>
                    
                    <div class="info_group">                        
                    	<label>用餐人数</label><input type="text" name="useNum" id="useNum" value="${tableType.useNum}"/><span class="msg"></span>
                    	<input type="hidden" value="0"/>
                    </div>

                    <div class="info_group">
                        <label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label><input type="text" name="name" id="name" value="${account.name}"/><span class="msg"></span>
                    </div>
                    <div class="info_group">
                        <label>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</label><input type="text" maxlength="11" name="mobile" id="mobile" value="${account.mobile}"/><span class="msg"></span>
                    </div>
                    <div class="info_group">
                        <label for="massage">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label>
                         <textarea id="remark" name="remark" style="width:200px;"></textarea>
                    </div>

                </li>
                <li>
                    <div class="msg">
                        预定须知:默认帮您保留到18：00，如果其他时间请备注。

                    </div>
                    <div id="btn_booking">确认预定</div>

                </li>
            </ul>
        </form>
    </div>

    <div class="malog">
        <div class="message">
            <p class="msgs"></p>
            <p>您可以在 <a href="index#order">我的订单</a>查看详情</p>
            <p>系统会在<span class="num">5</span>秒后跳转会 <a href="../index">菜单列表</a></p>
        </div>
    </div>

</div>
<!----页底--->
<div id="c_footer"></div>
<script src="../../resources/home/js/jquery-1.11.3.js"></script>
<script src="../../resources/home/js/jquery-ui.min.js"></script>
</body>
<script>
  $(function() {
    $(".datepicker").datepicker({"dateFormat":"yy-mm-dd"});
    $("#btn_booking").click(function(){
    	var arriveDate = $("#arriveDate").val();
    	if(arriveDate == ''){
    		alert('请选择时间!');
    		return;
    	}
    	var useNum = $("#useNum").val();
    	if(useNum == ''){
    		$("#useNum").next("span.msg").text('请填写入用餐人数!');
    		return;
    	}
    	$("#useNum").next("span.msg").text('');
    	var name = $("#name").val();
    	if(name == ''){
    		$("#name").next("span.msg").text('请填写预定人!');
    		return;
    	}
    	$("#name").next("span.msg").text('');
    	var mobile = $("#mobile").val();
    	if(mobile == ''){
    		$("#mobile").next("span.msg").text('请填写手机号!');
    		return;
    	}
    	$("#mobile").next("span.msg").text('');

    	
    	var remark = $("#remark").val();
    	$.ajax({
    		url:'book_order',
    		type:'post',
    		dataType:'json',
    		data:{tableTypeId:'${tableType.id }',name:name,mobile:mobile,remark:remark,arriveDate:arriveDate},
    		success:function(data){
    			if(data.type == 'success'){
    				$(".malog").show();
    				setTimeout(function(){
    					window.location.href = 'index';
    				},1000)
    			}else{
    				alert(data.msg);
    			}
    		}
    	});
    })
  });
  </script>
</html>