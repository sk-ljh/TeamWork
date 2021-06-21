<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/waiterHomepage.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
<title>waiterHomepage</title>
</head>

<body>
	<ul class="layui-nav">
		<h3>XXX用户，您已登录。</h3>
		<li class="layui-nav-item layui-this"><a
			href="waiterHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
		<li class="layui-nav-item"><a href="orderFormList.jsp">查看订单</a></li>
		<form class="search layui-form" action=""
			style="position: relative; left: 35%">
			<input lay-verify="required" lay-reqtext="请输入关键字！" type="text"
				name="dishKey"
				style="border-radius: 1.5em; height: 31px; width: 35%;"
				autocomplete="off" placeholder="输入关键字搜索菜品" class="layui-input" />
			<button class="layui-btn" type="submit" lay-submit=""
				style="height: 28px; line-height: 28px; position: relative; left: 30.3%; top: -29.5px;">搜索</button>
		</form>
		<li id="layerDemo" style="margin-bottom: 0; text-align: center;">
			<button data-method="notice" class="layui-btn"
				style="left: 30%; top: -63px;">查看公告</button>
		</li>
	</ul>
	<div class="waiterHomepageMainBody">
		<form class="layui-form" action="cart.jsp">
			<div class="layui-form-item">
				<label class="layui-form-label">桌号</label>
				<div class="layui-input-inline">
					<input type="text" name="tableName" lay-verify="required|pass"
						lay-reqtext="桌号不能为空！" lay-placeholder="0" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<fieldset class="layui-elem-field layui-field-title">
				<legend>菜品信息</legend>
			</fieldset>
			<table class="layui-table" lay-even="" lay-skin="nob">
				<colgroup>
					<col>
				</colgroup>
				<thead>
					<tr class="title">
						<th>名称</th>
						<th>图片</th>
						<th>简介</th>
						<th>数量</th>
						<th>单价</th>
						<th>购物车</th>
					</tr>
				</thead>
				<tbody>
					<tr class="dish">
						<td>鱼香肉丝</td>
						<td><img src="<%=path %>/OrderSystem/img/1.jpg" class="layui-nav-img"
							style="height: 100px; width: 150px"></td>
						<td>超级下饭的鱼香肉丝</td>
						<td>
							<button type="button" class="minus layui-btn layui-btn-sm">
								<i class="layui-icon">-</i>
							</button> <input type="text" name="number" placeholder="0"
							autocomplete="off" class="number layui-input" />
							<button type="button" class="plus layui-btn layui-btn-sm">
								<i class="layui-icon">+</i>
							</button>
						</td>
						<td>10元</td>
						<td>
							<button type="button" class="layui-btn layui-btn-sm"
								style="width: 60%; height: 30px; line-height: 30px;">
								<i class="layui-icon">加入</i>
							</button>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="layui-form-item">
				<div class="layui-input-block btns" style="text-align: center;">
					<button type="submit" class="layui-btn" lay-submit=""
						lay-filter="demo1">确认点餐</button>
					<button type="reset" class="layui-btn layui-btn-primary"
						style="background: linear-gradient(to left, #186dec 10%, #8a31f0 100%); color: white">重置</button>
					<a href="cart.jsp"><button type="button" class="layui-btn"
							style="background: linear-gradient(to left, #ff7c25 10%, #ff5101 100%)">购物车</button></a>
				</div>
			</div>
		</form>
	</div>

	<div id="pages" style="text-align: right; width: 60%"></div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>

	<script language="javascript">
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

		// ++ --
		var number = document.getElementsByClassName("number");
		var minus = document.getElementsByClassName("minus");
		var plus = document.getElementsByClassName("plus");
		for (let i = 0; i < number.length; i++) {
			minus[i].addEventListener("click", function () {
				if (number[i].value > 0)
					number[i].value--;
			})
		}
		for (let i = 0; i < number.length; i++) {
			plus[i].addEventListener("click", function () {
				number[i].value++;
			})
		}
		// 分页
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
	<script src="../layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
	<script>
		layui.use(['form', 'layedit', 'laydate'], function () {
			var form = layui.form
			//自定义验证规则
			form.verify({
				pass: [
					/^\d{1,2}$/,
					'桌号必须为1~2位整数'
				]
			});
		});
	</script>

</body>

</html>