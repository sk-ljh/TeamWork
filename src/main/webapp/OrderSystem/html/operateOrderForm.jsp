<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String basePort=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+"/file/";
	session.setAttribute("basePath", basePath);
	session.setAttribute("basePort", basePort);
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
		<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">
			<img src="${basePort }${Userdetails.icon}" style="width:50px;height:50px;border-radius:2em;float:left;position:relative;top:10px;">
		</a>
		<h3>
			&nbsp&nbsp&nbsp&nbsp&nbsp用户&nbsp&nbsp
			<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp"><%=user_name%></a>
			&nbsp&nbsp，您已登录。
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
		<li class="layui-nav-item"><a href="<%=path%>/logout.do">注销</a></li>
		<form class="search layui-form" action="<%=path %>/listOrderByKey.do?currentDish_Page=1"
			style="position: relative; left: 62%;width:80%">
			<input lay-verify="required" lay-reqtext="请输入关键字！" type="text"
				name="orderKey"
				style="border-radius: 1.5em; height: 32px; width: 35%;"
				autocomplete="off" placeholder="输入关键字查询订单" class="layui-input" />
			<button class="layui-btn" type="submit" lay-submit=""
				style="height: 28px; line-height: 28px; position: absolute; width:6%;left: 28.8%; top: 6.5%;">搜索</button>
		</form>
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
					if(listOrderHistory!=null)
						for (Order_history orderHistory : listOrderHistory) {
					%>
					<tr class="orderForm">
						<td><%=orderHistory.getOrder_id()%></td>
						<td><%=orderHistory.getUser_id()%></td>
						<td><%=orderHistory.getTable_number()%></td>
						<td><%=orderHistory.getTotal_price()%></td>
						<td>
							<%if(orderHistory.getPayment_state()==3){%>
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
						<td><%=orderHistory.getEnd_time()==null?"——":orderHistory.getEnd_time()%></td>
						<td>
							<%if(orderHistory.getPayment_state() == 3) 
								{
							%>
								<a
									href="<%=path%>/updateOrderHistory.do?order_id=<%=orderHistory.getOrder_id()%>&payment_state=1&currentDish_Page=<%=session.getAttribute("currentDish_Page")%>">
									<button class="layui-btn freeOfCharge" type="button">免单</button>
								</a>
								<a
									href="<%=path%>/updateOrderHistory.do?order_id=<%=orderHistory.getOrder_id()%>&payment_state=2&currentDish_Page=<%=session.getAttribute("currentDish_Page")%>">
									<button class="layui-btn confirm" type="button">结单</button>
								</a>
							<%
								} 
							%>
							<a
								href="<%=path%>/getOrderDetailAdmin.do?order_id=<%=orderHistory.getOrder_id()%>">
								<button class="layui-btn confirm" type="button">详情</button>
								</a>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<c:if test="${DishQueriedNumber>0}">
			<div id="pages" style="text-align: center;"></div>
		</c:if>
	</div>
	<script src="<%=path%>/OrderSystem/layui/layui.js"></script>
<script language="javascript">
layui.use(['laypage', 'layer'], function () {
    var laypage = layui.laypage,layer = layui.layer;
    var $ = layui.jquery;
    laypage.render({
        elem: 'pages',
        count: ${DishQueriedNumber},
        theme: '#FFB800',
        limit: 4,
        first: '首页',
        last: '尾页',
        curr: ${currentDish_Page},
        prev: '<em>←</em>',
        next: '<em>→</em>',
        jump: function (obj, first) {
            if (!first) {
            	var orderKey="<%=session.getAttribute("orderKey")%>"; 
            	if(orderKey!="null"){
					window.location.href="<%=path %>/listOrderByKey.do?orderKey=${orderKey}&currentDish_Page="+obj.curr;
				}
            	else{
					window.location.href="<%=path %>/listOrderHistory.do?currentDish_Page="+obj.curr;
            	}
            }
    	}
    });
})
</script>
</body>

</html>