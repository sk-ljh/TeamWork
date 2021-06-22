<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>用户详情页面</title>
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/userDetail.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">

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
		<li class="layui-nav-item layui-this"><a href="javascript:;">用户管理</a>
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
	<div class="userDetailMainBody">
		<img src="<%=path %>/OrderSystem/img/head1.jpg" alt="" style="width: 200px; height: 200px">
		<span class="username">用户名：张三</span>
		<ul>
			<li class="userNo">用户编号：001</li>
			<li class="identity">身份：服务员</li>
			<li class="gender">性别：男</li>
			<li class="phone">联系电话：15111123389</li>
			<li class="work_date">工作日：周一/三/五/日</li>
		</ul>
		<a href="alterUserInf.jsp"><button type="button" class="layui-btn">修改信息</button></a>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
</body>

</html>