<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>Layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
</head>

<body>
	<ul class="layui-nav">
		<h3>XXX用户，您已登录。</h3>
		<li class="layui-nav-item layui-this"><a href="adminHomepage.jsp">首页</a></li>
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

		<li class="layui-nav-item"><a href="operateOrderForm.jsp">订单管理</a></li>
		<li class="layui-nav-item"><a href="releaseNotice.jsp">发布公告</a></li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
	</ul>

	<div class="layui-bg-gray adminHomepagemainBody" style="padding: 30px;">
		<div class="layui-row layui-col-space12">
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header users">用户</div>
					<div class="layui-card-body">
						<div class="user">
							<span>编号：001</span> <span>姓名：张三</span> <span>身份：服务员</span>
						</div>
						<a href="javascript:;">查看更多</a>
					</div>
				</div>
			</div>
			<div class="layui-col-md5">
				<div class="layui-card">
					<div class="layui-card-header orderForms">订单</div>
					<div class="layui-card-body">
						<div class="orderForm">
							<span>单号：001</span> <span>西红柿炒鸡蛋 ×1，水煮肉片 ×2</span> <span>总计
								48.5 元</span> <span>下单时间：12:33</span> <span>已完成</span>
						</div>

						<a href="javascript:;">查看更多</a>
					</div>
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-header dishes">菜品</div>
					<div class="layui-card-body">
						<div class="dish">
							<span>菜品编号：009</span> <span>菜品名称：黑椒牛柳意面</span> <span>类别：面食</span>
						</div>
						<a href="javascript:;">查看更多</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
        layui.use('element', function () {
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function (elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });
    </script>
</body>

</html>