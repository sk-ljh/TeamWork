<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html>

<head>
<meta charset="utf-8">
<title>菜单列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/tableFormation.css">
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
		<li class="layui-nav-item  layui-this"><a href="javascript:;">菜品管理</a>
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
		<form class="search layui-form" action=""
			style="position: relative; left: 62%">
			<input lay-verify="required" lay-reqtext="请输入关键字！" type="text"
				name="dishKey"
				style="border-radius: 1.5em; height: 31px; width: 35%;"
				autocomplete="off" placeholder="输入关键字查询菜品" class="layui-input" />
			<button class="layui-btn" type="submit" lay-submit=""
				style="height: 28px; line-height: 28px; position: relative; left: 30.3%; top: -29.5px;">搜索</button>
		</form>
	</ul>
	<div class="dishAdminListMainBody">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>菜品管理列表</legend>
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
						<th>编号</th>
						<th>名称</th>
						<th>简介</th>
						<th>是否推荐</th>
						<th>单价（元）</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr class="dishForm">
						<td>010</td>
						<td><a href="dishDetail.jsp">鱼香肉丝</a></td>
						<td>一道咸鲜酸甜兼备的著名川菜。</td>
						<td>是</td>
						<td>15</td>
						<td><a href="alterDishInf.jsp"><button type="button"
									class="layui-btn layui-btn-warm">修改</button></a>
							<button type="button" class="layui-btn layui-btn-warm"
								onclick="return deleteOrder()">删除</button></td>
					</tr>
					<tr class="dishForm">
						<td>002</td>
						<td><a href="dishDetail.jsp">蒜苔回锅肉</a></td>
						<td>是以熟带皮五花肉，青蒜苔，为原料制作的一道菜品。</td>
						<td>否</td>
						<td>15</td>
						<td><a href="alterDishInf.jsp"><button type="button"
									class="layui-btn layui-btn-warm">修改</button></a>
							<button type="button" class="layui-btn layui-btn-warm"
								onclick="return deleteOrder()">删除</button></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="pages" style="text-align: center;"></div>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>

	<script language="javascript">
        layui.use('element', function () {
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function (elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });
        function deleteOrder() {
            alert("删除成功！");
            return false; //阻止表单默认提交
        }
        layui.use(['laypage', 'layer'], function () {
            var laypage = layui.laypage,
                layer = layui.layer;
            laypage.render({
                elem: 'pages',
                count: 100,
                theme: '#FFB800',
                first: '首页',
                last: '尾页',
                prev: '<em>←</em>',
                next: '<em>→</em>'
            });
        });
    </script>
</body>

</html>