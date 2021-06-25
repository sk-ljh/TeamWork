<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/dishDetail.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>菜品信息更改</title>
</head>

<body>
	<%
		User user;
			String user_name="null";
			if(session.getAttribute("loginUser")!=null)
			{
		 user=(User)session.getAttribute("loginUser");
		 user_name=user.getUser_name();
			}
	%>
	<ul class="layui-nav">
		<h3>用户<%=user_name %>，您已登录。</h3>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/adminHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item  layui-this"><a href="javascript:;">菜品管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="<%=path %>/OrderSystem/html/insertDish.jsp">添加菜品</a>
				</dd>
				<dd>
					<a href="<%=path %>/Dish/listDishsAll.do">更改菜品信息</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="<%=path %>/OrderSystem/html/insertUser.jsp">添加用户</a>
				</dd>
				<dd>
					<a href="<%=path%>/user/getUserList.do">更改用户信息</a>
				</dd>
			</dl></li>

		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/operateOrderForm.jsp">订单管理</a></li>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/releaseNotice.jsp">发布公告</a></li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
	</ul>
	<div class="dishDetailMainBody">
        <img src="${selectedDish.dishs_icon}" alt="" style="width:250px;height:250px">
		<table class="layui-table" lay-even="" >
			<thead>
				<tr>
					<th style="width: 100px;">菜品名称</th>
					<td>${selectedDish.dishs_name}</td>
				</tr>
				<tr>
					<th>菜品编号</th>
					<td>${selectedDish.dishs_id}</td>
				</tr>
				<tr>
					<th>菜品类别</th>
					<td>${selectedDish.dishs_cate}</td>
				</tr>
				<tr>
					<th>价格</th>
					<td>￥${selectedDish.price}&nbsp/&nbsp份</td>
				</tr>
				<tr>
					<th>是否推荐</th>
					<td>
						<c:if test="${selectedDish.recommend==1}">
							<img src="<%=path %>/OrderSystem/img/true.png">
						</c:if>
						<c:if test="${selectedDish.recommend==0}">
							<img src="<%=path %>/OrderSystem/img/false.png">
						</c:if>
					</td>
				</tr>
				<tr>
					<th>规格</th>
					<td>${selectedDishDetail.size}</td>
				</tr>
				<tr>
					<th>口味</th>
					<td>${selectedDishDetail.taste}</td>
				</tr>
				<tr>
					<th>简介</th>
					<td>${selectedDish.introduction}</td>
				</tr>
				<tr>
					<th>上架状态</th>
					<td>
						<c:if test="${selectedDish.dishs_delete==1}">
							<img src="<%=path %>/OrderSystem/img/warn.png">
							&nbsp（已下架）
						</c:if>
						<c:if test="${selectedDish.dishs_delete==0}">
							<img src="<%=path %>/OrderSystem/img/true.png">
							&nbsp（上架中）
						</c:if>
					</td>
				</tr>
				<tr>
					<th>供应商</th>
					<td>${selectedDishDetail.supplier}</td>
				</tr>
			</thead>
		</table>
		<div class="division"></div>   
      	<div class="layui-card">
	        <div class="layui-card-header">菜品详细介绍</div>
	        <div class="layui-card-body">
	          	${selectedDishDetail.introduce_detail}
	        </div>
      	</div>
		<a href="<%=path %>/dishDetail/showDishInf.do?alter=true&dishId=${selectedDish.dishs_id}"><button type="button" class="layui-btn alterInf">修改信息</button></a>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
        layui.use('element', function(){
	        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	        
	        //监听导航点击
	        element.on('nav(demo)', function(elem){
	            //console.log(elem)
	            layer.msg(elem.text());
	        });
        });
    </script>
</body>

</html>