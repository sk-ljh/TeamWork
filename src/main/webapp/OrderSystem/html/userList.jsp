<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/initiate.css">
<link rel="stylesheet" href="../css/tableFormation.css">
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../layui/css/modules/code.css">
<link rel="stylesheet"
	href="../layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="../layui/css/modules/layer/default/layer.css">
<title>userList</title>
</head>

<body>
	<ul class="layui-nav">
		<h3>XXX用户，您已登录。</h3>
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
		<form class="search layui-form" action=""
			style="position: relative; left: 62%">
			<input lay-verify="required" lay-reqtext="请输入关键字！" type="text"
				name="userKey"
				style="border-radius: 1.5em; height: 31px; width: 35%;"
				autocomplete="off" placeholder="输入关键字查询用户" class="layui-input" />
			<button class="layui-btn" type="submit" lay-submit=""
				style="height: 28px; line-height: 28px; position: relative; left: 30.3%; top: -29.5px;">搜索</button>
		</form>
	</ul>
	<div class="userListMainBody">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>用户列表</legend>
		</fieldset>
		<table class="layui-table" lay-even="" lay-skin="nob">
			<thead>
				<tr class="title">
					<th>用户编号</th>
					<th>登录名</th>
					<th>性别</th>
					<th>用户角色</th>
					<th>联系电话</th>
					<th>操作</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr class="user">
					<td>001</td>
					<td>张三</td>
					<td>男</td>
					<td>服务员</td>
					<td>15111123389</td>
					<td>
						<div>
							<a href="alterUserInf.jsp"><button type="button"
									class="layui-btn" style="height: 40px !important">修改信息</button></a>
							<button data-method="confirm" id="deleteUser" type="button"
								class="layui-btn" style="height: 40px !important">删除用户</button>
						</div>
					</td>
					<td><a href="userDetail.jsp"><button type="button"
								class="layui-btn"
								style="background: linear-gradient(to right, rgb(253, 79, 79) 10%, rgb(255, 115, 0) 100%); height: 40px !important; width: 80% !important">查看用户详情</button></a></td>
				</tr>
			</tbody>
		</table>

		<div id="pages" style="text-align: center;"></div>
	</div>
	<script src="../layui/layui.js" charset="utf-8"></script>
	<script>
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
			layui.use('layer', function () { 
			var $ = layui.jquery, layer = layui.layer;

			var active = {
				confirm: function () {
					layer.confirm('确定删除该用户吗？', {
						elem: 'deleteUser',
						btn: ['确定', '取消']
					}, function () {
						layer.msg('删除成功！', { icon: 1 });
					});
				}
			};
			$('#deleteUser').on('click', function () {
				var othis = $(this), method = othis.data('method');
				active[method] ? active[method].call(this, othis) : '';
			});
			});
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