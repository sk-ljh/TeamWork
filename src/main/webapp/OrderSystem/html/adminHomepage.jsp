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

	<div class="layui-bg-gray adminHomepagemainBody" style="padding: 30px;">
		<%--暂时不连数据库，将数据写死--%>
		<div class="layui-row layui-col-space12">
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header dishes">用户&nbsp&nbsp&nbsp<a style="color:blue" href="javascript:;">（查看更多）</a></div>
					<div class="layui-card-body">
						<table class="layui-table user" lay-skin="line">
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
						    <tr>
						      <td>1</td>
						      <td>张三</td>
						      <td>男</td>
						      <td>服务员</td>
						    </tr>
						    <tr>
						      <td>1</td>
						      <td>张三</td>
						      <td>男</td>
						      <td>服务员</td>
						    </tr>
						    <tr>
						      <td>1</td>
						      <td>张三</td>
						      <td>男</td>
						      <td>服务员</td>
						    </tr>
						  </tbody>
						</table>  
					</div> 
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-header orderForms">新的订单处理请求&nbsp&nbsp&nbsp<a style="color:blue" href="javascript:;">（查看更多）</a></div>
					<div class="layui-card-body">
						<div class="orderForm">
							<span>单号：001&nbsp&nbsp&nbsp&nbsp下单时间：12:33&nbsp&nbsp&nbsp&nbsp桌号：1
							&nbsp&nbsp&nbsp&nbsp总计：48.5 元</span>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-md5">
				<div class="layui-card">
					<div class="layui-card-header dishes">菜品&nbsp&nbsp&nbsp<a style="color:blue" href="javascript:;">（查看更多）</a></div>
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
						    <tr>
						      <td>1</td>
						      <td>焖羊肉锅</td>
						      <td>美味闷锅</td>
						      <td>￥59</td>
						      <td>是</td>
						    </tr>
						    <tr>
						      <td>2</td>
						      <td>焖牛腩</td>
						      <td>美味闷锅</td>
						      <td>￥59</td>
						      <td>是</td>
						    </tr>
						    <tr>
						      <td>3</td>
						      <td>焖牛肉锅</td>
						      <td>美味闷锅</td>
							  <td>￥59</td>
						      <td>是</td>
						    </tr>
						  </tbody>
						</table> 
					</div>
				</div>
			</div>
		</div>
		<%--下面是连接数据库，从中获取数据来进行渲染的部分（用户、订单和菜品只显示部分，其中订单部分显示未结账的订单且把最新的放前面）--%>
		<%--从登录页进入管理员主页时因为会直接跳转至该jsp页面，所以先做判断来从控制器中获取相关数据并返回该页面。后面在其他页面中跳到该主页时，则直接访问控制器获取数据后跳转即可--%>
		<c:if test="${partOfDishs==null}">
			<%-- <jsp:forward page="<%=path%>/adminHome/getParts.do"/> --%>
		</c:if>
		<%--userDetails、dishs和orderHistories是从控制器中从数据库表里获取到的数据（只取部分）-->
		<%--
			<div class="layui-row layui-col-space12">
				<div class="layui-col-md3">
					<div class="layui-card">
						<div class="layui-card-header dishes">用户&nbsp&nbsp&nbsp<a style="color:blue" href="javascript:;">（查看更多）</a></div>
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
							     <c:forEach var="user" items="${userDetails}">
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
						<div class="layui-card-header orderForms">新的订单处理请求&nbsp&nbsp&nbsp<a style="color:blue" href="javascript:;">（查看更多）</a></div>
						<div class="layui-card-body">
							<c:forEach var="order" items="${orderHistories}">
								<div class="orderForm">
									<span>单号：${order.order_id}&nbsp&nbsp&nbsp&nbsp下单时间：${order.begin_time}&nbsp&nbsp&nbsp&nbsp
									桌号：${order.table_number}&nbsp&nbsp&nbsp&nbsp总计：${order.total_price}元</span>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="layui-col-md5">
					<div class="layui-card">
						<div class="layui-card-header dishes">菜品&nbsp&nbsp&nbsp<a style="color:blue" href="javascript:;">（查看更多）</a></div>
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
							  	<c:forEach var="dish" items="${dishs}">
								    <tr>
								      <td>${dish.dishs_id}</td>
								      <td>${dish.dishs_name}</td>
								      <td>${dish.dishs_cate}</td>
								      <td>￥${dish.price}</td>
								      <td>
								    		<c:if test="${dish.dishs_delete==1}">
									    		是
									    	</c:if>
									    	<c:if test="${dih.dishs_delete==0}">
									    		否
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
		--%>
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