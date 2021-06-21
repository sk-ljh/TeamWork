<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/dishDetail.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
<title>菜品信息更改</title>
</head>

<body>
	<ul class="layui-nav">
		<h3>XXX用户，您已登录。</h3>
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
	</ul>
	<div class="dishDetailMainBody">
		<img src="<%=path %>/OrderSystem/img/茄汁培根意面.jpg" alt=""
			style="width: 200px; height: 200px">
		<ul>
			<li class="theDish">菜品名称：茄汁培根意面</li>
			<li class="dishNo">菜品编号：001</li>
			<li class="price">价格：<span>22.5</span>&nbsp&nbsp元 / 份
			</li>
			<li class="quality">规格：200g</li>
			<li class="CookingTime">烹饪时间：10~15分钟</li>
			<li class="flavor">口味：酸咸</li>
			<li class="brief">简介：酸咸适度，让人回味无穷，是家庭中非常有价值的美食。</li>
		</ul>
		<span class="detail"> <span>详细介绍：</span><br> 茄汁培根意面，小番茄
			豌豆、酱油 番茄酱 白糖，茄汁培根意面是以意粉、培根为主材的制作的菜品。<br> 菜名: 茄汁培根意面<br>
			菜品口味:酸咸<br> 主要工艺:炒<br> 所需时间:十分钟<br> 制作难度:简单<br>
			所用厨具:炒锅 煮锅
		</span> <a href="alterDishInf.jsp"><button type="button"
				class="layui-btn">修改信息</button></a>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
        layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
        });
    </script>
</body>

</html>