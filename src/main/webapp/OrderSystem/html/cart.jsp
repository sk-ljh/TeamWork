<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<% String path = request.getContextPath();%>
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/tableFormation.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
<title>cart</title>
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
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/waiterHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/orderFormList.jsp">查看订单</a></li>
		<li id="layerDemo" style="margin-bottom: 0; text-align: center;">
			<button data-method="notice" class="layui-btn">查看公告</button>
		</li>
	</ul>
	<div class="cartMainBody">
		<form class="layui-form" action="">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 50px;">
				<legend>当前购物车内容</legend>
			</fieldset>
			<table class="layui-table" lay-even="" lay-skin="nob">
				<thead>
					<tr class="title">
						<th>桌号</th>
						<th>名称</th>
						<th>数量</th>
						<th>单价（元）</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					<tr class="cartRecord">
						<td>03</td>
						<td>鱼香肉丝</td>
						<td>
							<button type="button" class="minus layui-btn layui-btn-sm"
								style="width: 15%; position: relative; left: -22%; top: 33px;">
								<i class="layui-icon">-</i>
							</button> <input type="text" name="number" value="2" autocomplete="off"
							class="number layui-input"
							style="width: 20%; position: relative; left: 50%; transform: translateX(-50%);" />
							<button type="button" class="plus layui-btn layui-btn-sm"
								style="width: 15%; position: relative; left: 22%; top: -35px;">
								<i class="layui-icon">+</i>
							</button>
						</td>
						<td>12.5</td>
						<td><a style="color: red" title="删除" href="javascript:;"><i
								class="fa fa-times fa-2x" aria-hidden="true"></i></a></td>
					</tr>
					<tr class="cartRecord">
						<td>03</td>
						<td>芝士焗土豆</td>
						<td>
							<button type="button" class="minus layui-btn layui-btn-sm"
								style="width: 15%; position: relative; left: -22%; top: 33px;">
								<i class="layui-icon">-</i>
							</button> <input type="text" name="number" value="1" autocomplete="off"
							class="number layui-input"
							style="width: 20%; position: relative; left: 50%; transform: translateX(-50%);" />
							<button type="button" class="plus layui-btn layui-btn-sm"
								style="width: 15%; position: relative; left: 22%; top: -35px;">
								<i class="layui-icon">+</i>
							</button>
						</td>
						<td>17</td>
						<td><a style="color: red" title="删除" href="javascript:;"><i
								class="fa fa-times fa-2x" aria-hidden="true"></i></a></td>
					</tr>
				</tbody>
			</table>
			<div class="layui-form-item" style="text-align: right;">
				<button type="submit" class="layui-btn" lay-submit=""
					lay-filter="demo1">提交至后厨</button>
				<a href="<%=path %>/OrderSystem/html/waiterHomepage.jsp"><button type="button"
						class="layui-btn"
						style="background: linear-gradient(to left, #ff7c25 10%, #ff5101 100%); margin-left: 30px;">返回主页</button></a>
			</div>
		</form>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
		// 公告
		layui.use('layer', function () { //独立版的layer无需执行这一句
			var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

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
		var number = document.getElementsByClassName("number");
		var minus = document.getElementsByClassName("minus");
		var plus = document.getElementsByClassName("plus");
		for (let i = 0; i < number.length; i++) {
			minus[i].addEventListener("click", function () {
				if (number[i].value > 1)
					number[i].value--;
			})
		}
		for (let i = 0; i < number.length; i++) {
			plus[i].addEventListener("click", function () {
				number[i].value++;
			})
		}
		layui.use(['form', 'layedit', 'laydate'], function () {
			var form = layui.form
			//自定义验证规则
			form.verify({
				pass: [
					/^\d{1,2}$/
				]
			});
		});
	</script>

</body>

</html>