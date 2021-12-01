<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="Author" content="自助">
  <meta name="Keywords" content="自助餐厅管理系统">
  <meta name="Description" content="自助餐厅管理系统">
  <link href="../resources/home/css/reservation.css" type="text/css" rel="Stylesheet"/>
  <link href="../resources/home/css/index.css" type="text/css" rel="Stylesheet"/>
<title>自助餐厅管理系统首页</title>
</head>
<body>
<!--头部-->
<div id="c_header"></div>
<!--主体内容-->
<section>
  <div id="subject">
<p style="float:right;">
	<c:if test="${account == null }">
		<a href="../home/login">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="../home/reg">注册</a>&nbsp;
	</c:if>
	<c:if test="${account != null }">
		<font color="red">欢迎您：${account.name }&nbsp;&nbsp;|&nbsp;&nbsp;</font>
		<a href="account/index">用户中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="../home/logout">注销登录</a>&nbsp;
	</c:if>
</p>
    <img src="../resources/home/images\index_02.jpg" alt="" height="256px" width="1200px">

  </div>


  <!---->
  <!---预订菜单--->
  <div id="due_menu">
    <!--关于-->

    <!--客房-->
    <div id="guest_rooms">
      <p class="booking_tab"><span></span>餐桌类型列表</p>
      <div class="chioce">
        <input type="text" placeholder="关键字" value="${kw }" id="kw"/>
        <input type="button" value="搜索" id="search-btn"/>
      </div>
      <form style="display:none;" action="index" method="get" id="search-form"><input type="hidden" name="name" id="search-name"></form>
      <!--列表-->
      <table id="pro_list" >
        <thead>
          <tr>
            <th width="200px">餐桌</th>
            <th>餐桌类型</th>
            <th>可用餐人数</th>
            <th>餐桌状态</th>
            <th>预订</th>
          </tr>
        </thead>
        <tbody >
        <c:forEach items="${tableTypeList }" var="tableType">
        <tr>
          <td><a href="#"><img src="${tableType.photo }" alt=""></a>
          </td>
          <td align="center">
            <p>${tableType.name }</p>
            <p class="sub_txt">${tableType.remark }</p>
          </td>
          <td>${tableType.useNum }</td>
          <td>
          	<c:if test="${tableType.status == 0 }">
          		已满
          	</c:if>
          	<c:if test="${tableType.status == 1 }">
          		可预订
          	</c:if>
          </td>
          <td>
          	<c:if test="${tableType.status == 0 }">
          		<input type="button" class="disable" value="已满" >
          	</c:if>
          	<c:if test="${tableType.status == 1 }">
          		<input type="button" value="预订" onclick="window.location.href='account/book_order?tableTypeId=${tableType.id }'" >
          	</c:if>
          </td>
        </tr>
		</c:forEach>
        </tbody>
      </table>

      <div id="pages"></div>
      <!--  -列表菜单 -->
      <div></div>
    </div>
  </div>

</section>
<%@include file="../common/footer.jsp"%>
<script src="../resources/home/js/jquery-1.11.3.js"></script>
<script>
$(document).ready(function(){
	$("#search-btn").click(function(){
		$("#search-name").val($("#kw").val());
		$("#search-form").submit();
	})
});
</script>
</body>