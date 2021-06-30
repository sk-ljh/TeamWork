<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html>

<head>
<meta charset="utf-8">
<title>管理员主页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String basePort=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+"/file/";
	session.setAttribute("basePath", basePath);
	session.setAttribute("basePort", basePort);
	%>
<link rel="stylesheet" href="<%=path%>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path%>/OrderSystem/css/adminHomePage.css">
<link rel="stylesheet" href="<%=path%>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/layer/default/layer.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<%
			User_details userDetail;
			userDetail=(User_details)session.getAttribute("Userdetails");
			
		%>
		<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">
			<img src="${basePort }${Userdetails.icon}" style="width:50px;height:50px;border-radius:2em;float:left;position:relative;top:10px;">
		</a>
		<h3>
			&nbsp&nbsp&nbsp&nbsp&nbsp用户&nbsp&nbsp
			<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp"><%=user_name%></a>
			&nbsp&nbsp，您已登录。
		</h3>
		<li class="layui-nav-item layui-this"><a
			href="<%=path %>/OrderSystem/html/adminHomepage.jsp">首页</a></li>
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

	<div class="layui-bg-gray adminHomepagemainBody" style="padding: 30px;">
		<div class="layui-row layui-col-space12">
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header dishes">
						用户&nbsp&nbsp&nbsp<a style="color:blue" href="<%=path%>/user/getUserList.do">（查看更多）</a>
					</div>
					<div class="layui-card-body">
						<table class="layui-table users" lay-skin="line">
							 <colgroup>
							   <col width="100">
							   <col width="200">
							   <col width="100">
							   <col width="200">
							 </colgroup>
							 <thead>
							   <tr>
							     <th>编号</th>
							     <th>姓名</th>
							     <th>性别</th>
							     <th>用户角色</th>
							   </tr> 
							 </thead>
							 <tbody>
							    <c:forEach var="user" items="${userDetails_Pa}">
									<tr>
									   <td>${user.user_id}</td>
									   <td>${user.name}</td>
									   <td>${user.sex}</td>
									   <td>
									    <c:if test="${user.role==1}">
									    	服务员
									    </c:if>
									    <c:if test="${user.role==2}">
									    	后厨
									    </c:if>
									    <c:if test="${user.role==3}">
									    	管理员
									    </c:if>
									   </td>
									</tr>
							    </c:forEach>
							 </tbody>
						</table>  
					</div> 
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-header">
						新的订单处理请求&nbsp&nbsp&nbsp<a style="color:blue" href="<%=path%>/listOrderHistory.do">（查看更多）</a>
					</div>
					<div class="layui-card-body">
						<table class="layui-table user" lay-skin="line">
								 <colgroup>
								   <col width="80">
								   <col width="80">
								   <col width="150">
								   <col width="80">
								 </colgroup>
								 <thead>
								   <tr>
								     <th>单号</th>
								     <th>桌号</th>
								     <th>下单时间</th>
								     <th>总计</th>
								   </tr> 
								 </thead>
								 <tbody>
								  	<c:forEach var="order" items="${orderHistories_Pa}">
									   <tr>
									     <td>${order.order_id}</td>
									     <td>${order.table_number}</td>
									     <td>${order.begin_time}</td>
									     <td>￥${order.total_price}</td>
									   </tr>
									</c:forEach>
								 </tbody>
						</table> 
					</div>
				</div>
			</div>
			<div class="layui-col-md5">
				<div class="layui-card">
					<div class="layui-card-header dishes">
						菜品&nbsp&nbsp&nbsp<a style="color:blue" href="<%=path%>/Dish/listDishsAll.do">（查看更多）</a>
					</div>
					<div class="layui-card-body">
						<table class="layui-table user" lay-skin="line">
							 <colgroup>
							   <col width="80">
							   <col width="200">
							   <col width="150">
							   <col width="80">
							   <col width="100">
							 </colgroup>
							 <thead>
							   <tr>
							     <th>编号</th>
							     <th>菜品名</th>
							     <th>菜类</th>
							     <th>价格</th>
								 <th>上架中</th>
							   </tr> 
							 </thead>
							 <tbody>
							  <c:forEach var="dish" items="${dishs_Pa}">
								   <tr>
								     <td>${dish.dishs_id}</td>
								     <td>${dish.dishs_name}</td>
								     <td>${dish.dishs_cate}</td>
								     <td>￥${dish.price}</td>
								     <td>
								    	<c:if test="${dish.dishs_delete==0}">
											<img src="<%=path %>/OrderSystem/img/true.png">
									    </c:if>
									    <c:if test="${dish.dishs_delete==1}">
									    	<img src="<%=path %>/OrderSystem/img/false.png">
									    </c:if>
								     </td>
								   </tr>
								</c:forEach>
							 </tbody>
						</table> 
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="<%=path%>/OrderSystem/js/layui.js"></script>
	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>
</body>

</html>