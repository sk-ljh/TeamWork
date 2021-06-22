<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
<title>orderDetail</title>
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
		<li class="layui-nav-item"><a href="waiterHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
		<li class="layui-nav-item layui-this"><a href="orderFormList.jsp">查看订单</a></li>
		<li id="layerDemo" style="margin-bottom: 0; text-align: center;">
			<button data-method="notice" class="layui-btn">查看公告</button>
		</li>
	</ul>
	<div class="orderDetailMainBody">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>菜品信息</legend>
		</fieldset>
		<table class="layui-table" lay-even="" lay-skin="nob">
			<thead>
				<tr>
					<th style="width: 100px;">订单ID</th>
					<td>041</td>
				</tr>
				<tr>
					<th>桌号</th>
					<td>06</td>
				</tr>
				<tr>
					<th>服务员</th>
					<td>张三</td>
				</tr>
				<tr>
					<th>菜品</th>
					<td>鱼香肉丝 ×1,水煮肉片×2</td>
				</tr>
				<tr>
					<th>总价</th>
					<td>40元</td>
				</tr>
				<tr>
					<th>开餐时间</th>
					<td>2021-4-10 12:00</td>
				</tr>
				<tr>
					<th>结餐时间</th>
					<td>2021-4-10 13:30</td>
				</tr>
			</thead>
		</table>
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 30px;">
			<legend>订单时间线</legend>
		</fieldset>
		<ul class="layui-timeline">
			<li class="layui-timeline-item"><i
				class="layui-icon layui-timeline-axis"></i>
				<div class="layui-timeline-content layui-text">
					<h3 class="layui-timeline-title">12：00</h3>
					<p>
						顾客点餐<i class="layui-icon"></i>
					</p>
				</div></li>
			<li class="layui-timeline-item"><i
				class="layui-icon layui-timeline-axis"></i>
				<div class="layui-timeline-content layui-text">
					<h3 class="layui-timeline-title">12：10</h3>
					<p>
						后厨确认<i class="layui-icon"></i>
					</p>
				</div></li>
			<li class="layui-timeline-item"><i
				class="layui-icon layui-timeline-axis"></i>
				<div class="layui-timeline-content layui-text">
					<h3 class="layui-timeline-title">12：30</h3>
					<p>
						后厨提交<i class="layui-icon"></i>
					</p>
				</div></li>
			<li class="layui-timeline-item"><i
				class="layui-icon layui-timeline-axis"></i>
				<div class="layui-timeline-content layui-text">
					<h3 class="layui-timeline-title">13：30</h3>
					<p>
						顾客结账<i class="layui-icon"></i>
					</p>
				</div></li>
		</ul>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
		// 公告
		layui.use('layer', function () { 
			var $ = layui.jquery, layer = layui.layer; 

			//触发事件
			var active = {
				notice: function () {
					//示范一个公告层
					layer.open({
						type: 1
						, title: false //不显示标题栏
						, closeBtn: false
						, area: '300px;'
						, shade: 0.8
						, id: 'LAY_layuipro' //设定一个id，防止重复弹出
						, btn: ['确认']
						, btnAlign: 'c'
						, moveType: 1 //拖拽模式，0或者1
						, content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">15号桌的顾客申请多点一碗香菇炖鸡汤，请尽快处理！</div>'
					});
				}
			};

			$('#layerDemo .layui-btn').on('click', function () {
				var othis = $(this), method = othis.data('method');
				active[method] ? active[method].call(this, othis) : '';
			});
		});
	</script>
</body>

</html>