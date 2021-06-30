<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*,java.util.*"%>
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
		<link rel="stylesheet" href="<%=path%>/OrderSystem/css/tableFormation.css">
		<link rel="stylesheet" href="<%=path%>/OrderSystem/layui/css/layui.css">
		<link rel="stylesheet" href="<%=path%>/OrderSystem/layui/css/modules/code.css">
		<link rel="stylesheet" href="<%=path%>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
		<link rel="stylesheet" href="<%=path%>/OrderSystem/layui/css/modules/layer/default/layer.css">
		<title>userList</title>
	</head>

	<body>
		<%
		System.out.println("csdsdfsdfaserwevrger");
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
		<li class="layui-nav-item"><a
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
		<li class="layui-nav-item  layui-this"><a href="javascript:;">用户管理</a>
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
		<form class="search layui-form form-control" action="<%=path%>/user/search.do"
				style="position: relative; left: 70%;width:80%;z-index:999;">
				<input lay-verify="required" lay-reqtext="请输入关键字！" type="text" name="key"
					style="border-radius: 1.5em; height: 31px; width: 35%;" autocomplete="off" placeholder="输入关键字查询用户"
					class="layui-input" id="search" />
				<!-- 在此处添加搜索提示 -->
				<ul class="list-group" id="list-box">

				</ul>

				<button class="layui-btn" type="submit" lay-submit=""
					style="height: 28px; line-height: 28px; position: absolute; left: 28.8%; top: 6%;">搜索</button>
			</form>
		</ul>

		<div class="userListMainBody">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
				<legend>用户列表</legend>
			</fieldset>
			<table class="layui-table" lay-even="" lay-skin="nob">
				<thead>
					<tr class="title">
						<th>用户编号</th>
						<th>用户名</th>
						<th>性别</th>
						<th>用户角色</th>
						<th>联系电话</th>
						<th>操作</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
						List<User> userList = (List<User>)session.getAttribute("userList");
						List<User_details> userDetailsList = (List<User_details>) session.getAttribute("userDetailsList");
						for (User_details userDetails : userDetailsList) {
					%>
					<tr class="user">
						<td><%=userDetails.getUser_id()%></td>
						<%
						String userName = null;
							for(User u:userList){
								if(u.getUser_id()==userDetails.getUser_id()){
									userName = u.getUser_name();
									break;
								}
							}
						%>
						<td><%=userName%></td>
						<%
							String sex = null;
							if(userDetails.getSex()==null){
								sex = "——";
							}else{
								sex = userDetails.getSex();
							}
						%>						
						<td><%=sex%></td>
						<%
						HashMap<Integer, String> hm = new HashMap<Integer, String>();
								hm.put(1, "服务员");
								hm.put(2, "后厨");
								hm.put(3, "管理员");
					%>
						<td><%=hm.get(userDetails.getRole())%></td>
						<%
							String phone = null;
							if(userDetails.getPhone()==null){
								phone = "——";
							}else{
								phone = userDetails.getPhone();
							}
						%>
						<td><%=phone%></td>
						<td>
							<div>
								<!-- <a
									href="<%=path%>/OrderSystem/html/alterUserInf.jsp?userId=<%=userDetails.getUser_id()%>"> -->
								<button data-method="alter" type="button" class="layui-btn alterUser"
									style="height: 40px !important"
									data-path="<%=path%>/user/toAlter.do"
									data-id="<%=userDetails.getUser_id()%>">
									修改
								</button>
								<button data-method="confirm" id="deleteUser" type="button"
									data-path="<%=path%>/user/deleteUser.do" data-id="<%=userDetails.getUser_id()%>"
									class="layui-btn deleteUser" style="height: 40px !important">
									删除
								</button>
							</div>
						</td>
						<td><a href="<%=path%>/user/getUserDetails.do?userId=<%=userDetails.getUser_id()%>">
								<button type="button" class="layui-btn"
									style="background: linear-gradient(to right, rgb(253, 79, 79) 10%, rgb(255, 115, 0) 100%); height: 40px !important; width: 80% !important">
									查看用户详情</button>
							</a>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<c:if test="${DishQueriedNumber>0}">
				<div id="pages" style="text-align: center;"></div>
			</c:if>
			<!-- <div id="pages" style="text-align: center;"></div> -->
		</div>
		<!-- 1、框架 -->
		<script src="<%=path%>/OrderSystem/layui/layui.js"></script>
		<!-- 2、userList -->
		<script>
			layui.use('element', function() {
				var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

				//监听导航点击
				element.on('nav(demo)', function(elem) {
					//console.log(elem)
					layer.msg(elem.text());
				});
			});

			function deleteOrder() {
				alert("删除成功！");
				return false; //阻止表单默认提交
			}
			layui.use(['laypage', 'layer'], function() {
				var $ = layui.jquery;
				var laypage = layui.laypage,
					layer = layui.layer;
				layui.use('layer', function() {
					var $ = layui.jquery,
						layer = layui.layer;
					var active = {

					};

					$('.deleteUser').on('click', function() {
						var othis = $(this);
						/* var	method = othis.data('method'); */
						var urlpath = othis.data('path');
						var userId = othis.data('id');

						layer.confirm('确定删除该用户吗？', {
							elem: 'deleteUser',
							btn: ['确定', '取消']
						}, function() {
							$.ajax({
								url: urlpath,
								type: 'post',
								data: {
									userId: userId
								},
								success: function(data) {
									if (data.status == 'error') {
										layer.msg('删除失败!', {
											icon: 2 //失败的表情
										});
										/* o.removeClass('layui-btn-disabled'); */
										return;
									} else {
										layer.msg('删除成功!', {
											icon: 1, //成功的表情
											time: 1000
										}, function() {
											location.reload();
										});
									}
								},
								complete: function() {
									layer.close(this.layerIndex);
								},
							});

						});
					});

					$('.alterUser').on('click', function() {
						var othis = $(this);
						/* var	method = othis.data('method'); */
						var urlpath = othis.data('path');
						var userId = othis.data('id');
						layer.confirm('确定进入修改界面吗？', {
							elem: 'alterUser',
							btn: ['确定', '取消']
						}, function() {
							window.location.href = urlpath + "?" + "userId=" + userId;
						});
					});
				});
				laypage.render({
					elem: 'pages',
					count: ${DishQueriedNumber},
					theme: '#FFB800',
					limit: 5,
					first: '首页',
					last: '尾页',
					curr: ${pageno},
					prev: '<em>←</em>',
					next: '<em>→</em>',
					jump: function(obj, first) {
						if (!first) {
							window.location.href = "<%=path%>/user/getUserList.do?pageno=" + obj.curr;
						}
					}
				});
			});
		</script>
	</body>
</html>