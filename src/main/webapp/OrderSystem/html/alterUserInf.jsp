<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*,java.util.*"%>
<html>

	<head>
		<meta charset="utf-8">
		<title>修改用户信息</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<%
	String path = request.getContextPath();
%>
		<link rel="stylesheet" href="<%=path%>/OrderSystem/css/initiate.css">
		<link rel="stylesheet" href="<%=path%>/OrderSystem/css/InfManage.css">
		<link rel="stylesheet" href="<%=path%>/OrderSystem/layui/css/layui.css">
		<link rel="stylesheet" href="<%=path%>/OrderSystem/layui/css/modules/code.css">
		<link rel="stylesheet" href="../layui/css/modules/laydate/default/laydate.css">
		<link rel="stylesheet" href="../layui/css/modules/layer/default/layer.css">
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
		<%
		int userId = Integer.parseInt(request.getParameter("userId"));
		List<User_details> userDetailsList = (List<User_details>) session.getAttribute("userDetailsList");
		User_details userDetails;
		for (User_details uD : userDetailsList) {
			if (uD.getUser_id() == userId) {
				userDetails = uD;
	%>


		<div class="alterUserInfMainbody">
			<div class="alterPic">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>用户头像</legend>
				</fieldset>

				<div class="layui-upload pic2BUploaded">
					<button type="button" class="layui-btn" id="test1">上传图片</button>
					<button type="button" class="layui-btn">确认修改</button>
					<div class="layui-upload-list">
						<img src="<%=userDetails.getIcon()%>" class="layui-upload-img" id="demo1"
							style="width: 200px; height: 200px">
					</div>
					<div class="bar" style="width: 95px;">
						<div class="layui-progress layui-progress-big" lay-showpercent="yes" lay-filter="demo">
							<div class="layui-progress-bar" lay-percent=""></div>
						</div>
					</div>
				</div>

				<a name="list-progress"> </a>
			</div>
			<div class="alterInf">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px;">
					<legend>用户信息修改</legend>
				</fieldset>
				<div class="formWrapper">
					<form class="layui-form layui-form-pane" action="<%=path%>/user/alterUser.do?userId=<%=userId %>"
						method="post">
						<div class="layui-form-item">
							<label class="layui-form-label">用户名</label>
							<div class="layui-input-inline">
								<label class="layui-form-label"><%=userDetails.getName()%></label>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">原密码</label>
							<div class="layui-input-inline">
								<input id="pwd" lay-verify="passwordLength" type="password" name="pwd"
									placeholder="修改密码时需填" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">新密码</label>
							<div class="layui-input-inline">
								<input id="newPwd" lay-verify="newPwd" type="password" name="newPwd" placeholder="输入新密码"
									autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label">确认密码</label>
							<div class="layui-input-inline">
								<input type="password" name="pwdRep" lay-verify="pwdRep" placeholder="再次输入新密码"
									autocomplete="off" class="layui-input" />
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">用户角色</label>
							<div class="layui-input-inline">
								<select name="identity" lay-filter="aihao">
									<option value="0" selected="">请选择</option>
									<option value="1">服务员</option>
									<option value="2">后厨</option>
									<option value="3">管理员</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item form-button-item">
							<button class="layui-btn" lay-submit="" lay-filter="demo2" type="submit">修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%
		break;
			}
		}
	%>
		<script src="<%=path%>/OrderSystem/layui/layui.js"></script>
		<script>
			layui.use('element', function() {
				var element = layui.element; //导航的hover效果、二级菜单等功能

				//监听导航点击
				element.on('nav(demo)', function(elem) {
					layer.msg(elem.text());
				});
			});
			layui.use(
				['upload', 'element', 'layer'],
				function() {
					var $ = layui.jquery,
						upload = layui.upload,
						element = layui.element,
						layer = layui.layer;

					//图片上传
					var uploadInst = upload
						.render({
							elem: '#test1',
							url: 'https://httpbin.org/post' //上传接口
								,
							accept: 'file' //普通文件
								,
							exts: 'jpg|png|gif|tiff|jpeg' //设定文件后缀
								,
							before: function(obj) {
								//预读本地文件示例，不支持ie8
								obj
									.preview(function(index,
										file, result) {
										$('#demo1').attr('src',
											result); //图片链接（base64）
									});

								element.progress('demo', '0%'); //进度条复位
								layer.msg('上传中', {
									icon: 16,
									time: 0
								});
							},
							done: function(res) {
								//如果上传失败
								if (res.code > 0) {
									return layer.msg('上传失败');
								}
								//上传成功的一些操作
								//……
								$('#demoText').jsp(''); //置空上传失败的状态
							},
							error: function() {
									//演示失败状态，并实现重传
									var demoText = $('#demoText');
									demoText
										.jsp(
											'<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>'
										);
									demoText.find('.demo-reload').on(
										'click',
										function() {
											uploadInst.upload();
										});
								}
								//进度条
								,
							progress: function(n, elem, e) {
								element.progress('demo', n + '%'); //可配合 layui 进度条元素使用
								if (n == 100) {
									layer.msg('上传完毕', {
										icon: 1
									});
								}
							}
						});
				});
			layui
				.use(
					['form', 'layedit', 'laydate'],
					function() {
						var form = layui.form,
							layer = layui.layer,
							layedit = layui.layedit,
							laydate = layui.laydate;
						var newPwd = document.querySelector("#newPwd");
						var pwd = document.querySelector("#pwd");
						//创建一个编辑器
						var editIndex = layedit.build('LAY_demo_editor');

						//自定义验证规则
						form.verify({
							newPwd: function(value) {
								if (value.length > 0 &&
									pwd.value.length == 0)
									return '修改密码前请先输入原密码！'
								else if (value.length > 0 &&
									value == pwd.value)
									return '新密码与原密码一样了！';
								else if (value.length > 16)
									return '新密码超过了16位！'
							},
							pwdRep: function(value) {
								if (value != newPwd.value)
									return '两次输入的新密码不一致！'
							}
						});

						//监听指定开关
						form.on('switch(switchTest)', function(data) {
							layer.msg('开关checked：' +
								(this.checked ? 'true' : 'false'), {
									offset: '6px'
								});
							layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
								data.othis)
						});

						//监听提交
						form.on('submit(demo1)', function(data) {
							layer.alert(JSON.stringify(data.field), {
								title: '最终的提交信息'
							})
							return false;
						});
					});
		</script>
	</body>

</html>
