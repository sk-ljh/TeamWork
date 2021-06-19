<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>后厨主页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../css/initiate.css">
<link rel="stylesheet" href="../css/tableFormation.css">
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../layui/css/modules/code.css">
<link rel="stylesheet"
	href="../layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="../layui/css/modules/layer/default/layer.css">
</head>

<body>
	<ul class="layui-nav" style="text-align: center;">
		<h3 style="text-align: center;">XXX用户，您已登录。</h3>
		<li class="layui-nav-item layui-this"><a href="adminHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
	</ul>
	<div class="chefHomepageMainBody">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px; font-size: 50px;">
			<legend>点餐信息列表</legend>
		</fieldset>

		<table class="layui-table" lay-even="" lay-skin="nob">
			<colgroup>
				<col width="300">
				<col width="200">
				<col width="200">
				<col>
			</colgroup>
			<thead>
				<tr class="title">
					<th>菜品名称</th>
					<th>菜品桌号</th>
					<th>菜品数量</th>
					<th>烹制状态</th>
				</tr>
			</thead>
			<tbody style="font-size: 20px;">
				<tr class="cook">
					<td>麻婆豆腐</td>
					<td>01</td>
					<td>1</td>
					<td><a href="javascript:;"><button title="点击以结束烹饪"
								type="button" class="cooking layui-btn" id="btn">正在烹饪</button></a></td>
				</tr>
				<tr class="cook">
					<td>红烧狮子头</td>
					<td>03</td>
					<td>1</td>
					<td><a href="javascript:;"><button title="点击切换状态"
								type="button" class="toBcooked layui-btn" id="btn">准备烹饪</button></a></td>
				</tr>
				<tr class="cook">
					<td>夫妻肺片</td>
					<td>03</td>
					<td>1</td>
					<td><a href="javascript:;"><button title="点击切换状态"
								type="button" class="toBcooked layui-btn" id="btn">准备烹饪</button></a></td>
				</tr>
			</tbody>
		</table>

	</div>

	<script src="../js/layui.js" charset="utf-8"></script>
	<script>
		layui.use(['layer'], function () {
			var btns = document.querySelectorAll("#btn");
			for (let i = 0; i < btns.length; i++) {
				btns[i].onclick = function () {
					if (btns[i].classList.contains('cooking')) {
						var tr = btns[i].parentNode.parentNode.parentNode;
						//找到表格
						var tbody = tr.parentNode;
						//删除行
						tbody.removeChild(tr);
						layer.msg('成功结束该条烹饪记录！', {icon: 1});
					}
					else {
						btns[i].classList.remove("toBcooked");
						btns[i].classList.add("cooking");
						btns[i].innerHTML = "正在烹饪";
						btns[i].title="点击以结束烹饪";
					}
				}
			}
		})
	</script>

</body>

</html>