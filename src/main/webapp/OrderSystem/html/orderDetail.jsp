<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String basePort=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+"/file/";
	session.setAttribute("basePath", basePath);
	session.setAttribute("basePort", basePort);
	%>
<link rel="stylesheet" href="<%=path%>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path%>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/layer/default/layer.css">
<jsp:directive.page import="java.util.List" />
<title>orderDetail</title>
</head>

<body>
	<%
	User_details user_details=new User_details();
	String name="null";
	if(session.getAttribute("loginUser")!=null)
	{
 	user_details=(User_details)session.getAttribute("Userdetails");
 	name=user_details.getName();
	}
	if(user_details.getRole()==3){
	%>
	<ul class="layui-nav">
		<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">
			<img src="${basePort }${Userdetails.icon}" style="width:50px;height:50px;border-radius:2em;float:left;position:relative;top:10px;">
		</a>
		<h3>
			&nbsp&nbsp&nbsp&nbsp&nbsp用户&nbsp&nbsp
			<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp"><%=name%></a>
			&nbsp&nbsp，您已登录。
		</h3>
		<li class="layui-nav-item layui-this"><a
			href="<%=path%>/alterSelfInfJump.do">首页</a></li>
		<li class="layui-nav-item"><a
			href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a></li>
		<li class="layui-nav-item"><a href="javascript:;">菜品管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="<%=path%>/OrderSystem/html/insertDish.jsp">添加菜品</a>
				</dd>
				<dd>
					<a href="<%=path%>/Dish/listDishsAll.do">更改菜品信息</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="<%=path%>/OrderSystem/html/insertUser.jsp">添加用户</a>
				</dd>
				<dd>
					<a href="<%=path%>/user/getUserList.do">更改用户信息</a>
				</dd>
			</dl></li>

		<li class="layui-nav-item"><a
			href="<%=path%>/listOrderHistory.do">订单管理</a></li>
		<li class="layui-nav-item"><a
			href="<%=path%>/OrderSystem/html/releaseNotice.jsp">发布公告</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/logout.do">注销</a></li>
	</ul>
	<%}else if(user_details.getRole()==1){ %>
	<ul class="layui-nav">
		<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">
			<img src="${basePort }${Userdetails.icon}" style="width:50px;height:50px;border-radius:2em;float:left;position:relative;top:10px;">
		</a>
		<h3>
			&nbsp&nbsp&nbsp&nbsp&nbsp用户&nbsp&nbsp
			<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp"><%=name%></a>
			&nbsp&nbsp，您已登录。
		</h3>
		<li class="layui-nav-item"><a href="<%=path%>/alterSelfInfJump.do">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a>
		</li>
		
		<li class="layui-nav-item layui-this"><a href="<%=path%>/OrderSystem/html/orderFormList.jsp">查看订单</a></li>
		<li class="layui-nav-item">
			<a href="<%=path %>/notice/listNotices.do">查看公告</a>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
	</ul>
	<% } %>
	<div class="orderDetailMainBody">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>订单详情</legend>
		</fieldset>
		<table class="layui-table" lay-even="" lay-skin="nob">
			<thead>
				<tr>
					<th style="width: 100px;">订单ID</th>
					<th><%=request.getAttribute("order_id") %></th>
					<th>桌号</th>
					<th><%=request.getAttribute("table_number") %></th>
					<th>服务员</th>
					<th><%=request.getAttribute("user_name") %></th>
				</tr>
			</thead>
		</table>
		<table class="layui-table" lay-even="" lay-skin="nob">
			<thead>
				<tr>
					<th>菜名</th>
					<th>数量</th>
					<th>价格</th>
					<th>状态</th>
				</tr>
			</thead>
			
			<tbody>
					<%
					@SuppressWarnings("unchecked")
					List<Order_list> listOrder_list = (List<Order_list>) session.getAttribute("listOrder_list");
					for (Order_list order : listOrder_list) {
					%>
					<tr class="orderForm">
						<td><%=order.getDishs_name()%></td>
						<td><%=order.getNumber()%></td>
						<td><%=order.getPrice()%></td>
						<td>
							<%if(order.getCook_state()==1){%>
								准备烹饪
							<%}else if(order.getCook_state()==2){ %>
								正在烹饪
							<%}else if(order.getCook_state()==3){ %>
								完成烹饪
							<%} %>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
		</table>

	</div>
	<script src="<%=path%>/OrderSystem/js/layui.js"></script>
	<script>
		// 公告
		layui
				.use(
						'layer',
						function() {
							var $ = layui.jquery, layer = layui.layer;

							//触发事件
							var active = {
								notice : function() {
									//示范一个公告层
									layer
											.open({
												type : 1,
												title : false //不显示标题栏
												,
												closeBtn : false,
												area : '300px;',
												shade : 0.8,
												id : 'LAY_layuipro' //设定一个id，防止重复弹出
												,
												btn : [ '确认' ],
												btnAlign : 'c',
												moveType : 1 //拖拽模式，0或者1
												,
												content : '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">15号桌的顾客申请多点一碗香菇炖鸡汤，请尽快处理！</div>'
											});
								}
							};

							$('#layerDemo .layui-btn').on(
									'click',
									function() {
										var othis = $(this), method = othis
												.data('method');
										active[method] ? active[method].call(
												this, othis) : '';
									});
						});
	</script>
</body>

</html>