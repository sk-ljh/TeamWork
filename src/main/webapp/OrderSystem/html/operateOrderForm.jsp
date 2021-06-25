<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
String path = request.getContextPath();
%>
<link rel="stylesheet" href="<%=path%>/OrderSystem/css/initiate.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/css/tableFormation.css">
<link rel="stylesheet" href="<%=path%>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/layer/default/layer.css">
<jsp:directive.page import="java.util.List" />
<title>修改订单</title>
</head>

<body>
	<%
	User user;
	String user_name = "null";
	if (session.getAttribute("loginUser") != null) {
		user = (User) session.getAttribute("loginUser");
		user_name = user.getUser_name();
	}
	%>
	<ul class="layui-nav">
		<h3>
			用户<%=user_name%>，您已登录。
		</h3>
		<li class="layui-nav-item layui-this"><a
			href="<%=path%>/OrderSystem/html/adminHomepage.jsp">首页</a></li>
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
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
	</ul>
	<div class="operateFormMainBody">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>订单列表</legend>
		</fieldset>
		<div class="layui-form">
			<table class="layui-table">
				<thead>
					<tr class="title">
						<th>订单号</th>
						<th>服务员编号</th>
						<th>餐桌号</th>
						<th>总价</th>
						<th>订单状态</th>
						<th>开餐时间</th>
						<th>结餐时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Order_history> listOrderHistory = (List<Order_history>) session.getAttribute("listOrderHistory");
					for (Order_history orderHistory : listOrderHistory) {
					%>
					<tr class="orderForm">
						<td><%=orderHistory.getOrder_id()%></td>
						<td><%=orderHistory.getUser_id()%></td>
						<td><%=orderHistory.getTable_number()%></td>
						<td><%=orderHistory.getTotal_price()%></td>
						<td>
							<%if(orderHistory.getPayment_state()==0){%>
								未结单
							<%} %>
							<%if(orderHistory.getPayment_state()==1){%>
								免单
							<%} %>
							<%if(orderHistory.getPayment_state()==2){%>
								结单
							<%} %>
						</td>
						<td><%=orderHistory.getBegin_time()%></td>
						<td><%=orderHistory.getEnd_time()%></td>
						<td>
							<%if(orderHistory.getPayment_state() == 0) 
								{
							%>
								<a
									href="<%=path%>/updateOrderHistory.do?order_id=<%=orderHistory.getOrder_id()%>&payment_state=1">
									<button class="layui-btn freeOfCharge" type="button">免单</button>
								</a>
								<a
									href="<%=path%>/updateOrderHistory.do?order_id=<%=orderHistory.getOrder_id()%>&payment_state=2">
									<button class="layui-btn confirm" type="button">结单</button>
								</a>
							<%
								} 
							%>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script src="<%=path%>/OrderSystem/layui/layui.js"></script>
</html>