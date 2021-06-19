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
<title>orderFormList</title>
</head>

<body>
	<ul class="layui-nav">
		<h3>XXX用户，您已登录。</h3>
		<li class="layui-nav-item"><a href="waiterHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
		<li class="layui-nav-item layui-this"><a href="orderFormList.jsp">查看订单</a></li>
		<li id="layerDemo" style="margin-bottom: 0; text-align: center;">
			<button data-method="notice" class="layui-btn">查看公告</button>
		</li>
	</ul>
	<div class="orderFormListMainBody">
		<form name="myForm" class="layui-form" action=""
			onsubmit="return sumbit_sure()">

			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 50px;">
				<legend>正在进行的订单</legend>
			</fieldset>
			<table class="layui-table" lay-even="" lay-skin="nob">
				<thead>
					<tr class="title">
						<th>订单ID</th>
						<th>桌号</th>
						<th>服务员</th>
						<th>菜品</th>
						<th>总价（元）</th>
						<th>开餐时间</th>
						<th>结餐时间</th>
						<th>详情</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr class="orderForm">
						<td>041</td>
						<td>06</td>
						<td>张三</td>
						<td>鱼香肉丝 ×1,水煮肉片×2</td>
						<td>40</td>
						<td>2021-4-10 12:00</td>
						<td>2021-4-10 13:30</td>
						<td><a href="orderDetail.jsp">查看</a></td>
						<td><button type="button" class="layui-btn"
								style="width: 65%; text-align: center; background: linear-gradient(to left, #ff7c25 10%, #ff5101 100%);">结算提交</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<script src="../layui/layui.js" charset="utf-8"></script>
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
		layui.use(['form', 'layedit', 'laydate'], function () {
			var form = layui.form
			//自定义验证规则
			form.verify({
				pass: [
					/^\d{1,2}$/
				]
			});
		});
		function sumbit_sure() {
			alert("提交成功！");
			return false; //阻止表单默认提交
		}
	</script>

</body>

</html>