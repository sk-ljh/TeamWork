<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.our.pojo.*" pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>后厨主页</title>
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
		<li class="layui-nav-item layui-this"><a href="<%=path %>/OrderSystem/html/adminHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a>
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
								type="button" class="cooking layui-btn btn" id="btn">正在烹饪</button></a></td>
				</tr>
				<tr class="cook">
					<td>红烧狮子头</td>
					<td>03</td>
					<td>1</td>
					<td><a href="javascript:;"><button title="点击切换状态"
								type="button" class="toBcooked layui-btn btn" id="btn">准备烹饪</button></a></td>
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

	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
		layui.use(['layer'], function () {
			var btns = document.querySelectorAll("#btn");
			for (let i = 0; i < btns.length; i++) {
				btns[i].onclick = function () {
					console.log("cooking");
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