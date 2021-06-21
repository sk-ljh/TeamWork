<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/tableFormation.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
<title>修改订单</title>
</head>

<body>
	<ul class="layui-nav">
		<h3>XXX用户，您已登录?</h3>
		<li class="layui-nav-item"><a href="adminHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">菜品管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="insertDish.jsp">添加菜品</a>
				</dd>
				<dd>
					<a href="dishAdminList.jsp">更改菜品信息</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="insertUser.jsp">添加用户</a>
				</dd>
				<dd>
					<a href="userList.jsp">更改用户信息</a>
				</dd>
			</dl></li>

		<li class="layui-nav-item layui-this"><a
			href="operateOrderForm.jsp">订单管理</a></li>
		<li class="layui-nav-item"><a href="releaseNotice.jsp">发布公告</a></li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
	</ul>
	<div class="operateFormMainBody">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>订单列表</legend>
		</fieldset>
		<div class="layui-form">
			<table class="layui-table">
				<colgroup>
					<col width="150">
					<col width="150">
					<col width="200">
					<col>
				</colgroup>
				<thead>
					<tr class="title">
						<th>订单单号</th>
						<th>用户编号</th>
						<th>餐桌叿/th>
						<th>总金颿/th>
						<th>订单状怿/th>
						<th>开餐时闿/th>
						<th>结餐时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr class="orderForm">
						<td>201807080012</td>
						<td>57362873605</td>
						<td>102</td>
						<td>￥568.50</td>
						<td>进行丿/td>
						<td>2020-08-09 13:20</td>
						<td>2020-08-09 15:10</td>
						<td>
							<button class="layui-btn freeOfCharge" type="button">免单</button>
							<button class="layui-btn confirm" type="button">结单</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="pages" style="text-align: center;"></div>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
        layui.use(['laypage', 'layer'], function () {
            var laypage = layui.laypage,
                layer = layui.layer;
            laypage.render({
                elem: 'pages',
                count: 100,
                theme: '#FFB800',
                first: '首页',
                last: '尾页',
                prev: '<em>?/em>',
                next: '<em>?/em>'
            });
        });
    </script>
</body>

</html>