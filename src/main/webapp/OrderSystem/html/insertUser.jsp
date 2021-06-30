<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html>

	<head>
		<meta charset="utf-8">
		<title>添加用户</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String basePort=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+"/file/";
	session.setAttribute("basePath", basePath);
	session.setAttribute("basePort", basePort);
	%>
		<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
		<link rel="stylesheet" href="<%=path %>/OrderSystem/css/InfManage.css">
		<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
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
			<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">
				<img src="${basePort }${Userdetails.icon}"
					style="width:50px;height:50px;border-radius:2em;float:left;position:relative;top:10px;">
			</a>
			<h3>
				&nbsp&nbsp&nbsp&nbsp&nbsp用户&nbsp&nbsp
				<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp"><%=user_name%></a>
				&nbsp&nbsp，您已登录。
			</h3>
			<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/adminHomepage.jsp">首页</a></li>
			<li class="layui-nav-item"><a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a></li>
			<li class="layui-nav-item"><a href="javascript:;">菜品管理</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="<%=path%>/OrderSystem/html/insertDish.jsp">添加菜品</a>
					</dd>
					<dd>
						<a href="<%=path%>/Dish/listDishsAll.do">更改菜品信息</a>
					</dd>
				</dl>
			</li>
			<li class="layui-nav-item  layui-this"><a href="javascript:;">用户管理</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="<%=path%>/OrderSystem/html/insertUser.jsp">添加用户</a>
					</dd>
					<dd>
						<a href="<%=path%>/user/getUserList.do">更改用户信息</a>
					</dd>
				</dl>
			</li>

			<li class="layui-nav-item"><a href="<%=path%>/listOrderHistory.do">订单管理</a></li>
			<li class="layui-nav-item"><a href="<%=path%>/OrderSystem/html/releaseNotice.jsp">发布公告</a></li>
			<li class="layui-nav-item"><a href="<%=path%>/logout.do">注销</a></li>
		</ul>
		<div class="alterUserInfMainbody">
			<div class="alterInf">
				<form class="layui-form layui-form-pane" action="${basePath }user/insertUser.do" method="post"
					enctype="multipart/form-data">
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
						<legend>上传用户头像图片</legend>
					</fieldset>

					<div class="layui-upload-drag" id="test10">
						<i class="layui-icon"></i>
						<p>点击上传，或将文件拖拽到此处</p>
						<div class="layui-hide-img" id="uploadDemoView">
							<hr>
							<img id="demo1" src="<%=path %>/OrderSystem/img/head1.jpg" alt=""
								style="width: 200px; height: 200px">
						</div>
					</div>


					<a name="list-progress"> </a>
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
						<legend>填充用户信息</legend>
					</fieldset>
					<div class="formWrapper">
						<div class="layui-form-item">
							<label class="layui-form-label">用户名</label>
							<div class="layui-input-inline">
								<input id="username" lay-reqtext="用户名不能为空！"
									lay-verify="required|usernameLength|usernamehave" type="text" name="username"
									autocomplete="off" placeholder="用户名不超过10个字" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item" id="list-box" style="text-align: center;"></div>
						<div class="layui-form-item">
							<label class="layui-form-label">填写密码</label>
							<div class="layui-input-inline">
								<input id="pwd" lay-reqtext="密码不能为空！" lay-verify="required|passwordLength"
									type="password" name="pwd" placeholder="密码不超过16个字符" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">确认密码</label>
							<div class="layui-input-inline">
								<input id="pwdRep" lay-reqtext="确认密码不能为空！" lay-verify="required|passwordRep"
									type="password" name="pwdRep" placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">用户角色</label>
							<div class="layui-input-inline">
								<select lay-reqtext="未选择用户角色！" lay-verify="required" name="identity"
									lay-filter="identity">
									<option value="" selected=""></option>
									<option value="1">服务员</option>
									<option value="2">后厨</option>
								</select>
							</div>
						</div>
						<div id="file_confirm" class="layui-form-item form-button-item">
							<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo2">确定</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script src="<%=path %>/OrderSystem/layui/layui.js"></script>
		<script>
			/* 图片上传部分 */
			layui.use(['upload', 'element', 'layer'], function() {
				var $ = layui.jquery,
					upload = layui.upload,
					element = layui.element,
					layer = layui.layer;
				//拖拽上传
				upload.render({
					elem: '#test10',
					accept: 'file', //普通文件
					url:'${basePath }file/doupload2.do',
					auto: false,
					exts: 'jpg|png|gif|tiff|jpeg' //只允许上传压缩文件
						,
					field: 'mulFile',
					choose: function(obj) {
						obj.preview(function(index, file, result) {
							$('#demo1').attr('src', result); //图片链接（base64）
						});
						

					}

				});
			});

			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate,
					$ = layui.jquery;
				var pwd = document.getElementById("pwd");
				//创建一个编辑器
				var editIndex = layedit.build('LAY_demo_editor');

				// 用户名查重部分
				// 获取用户名内容框
				var userName = document.getElementById('username');
				// 获取提示文字的存放容器
				var listBox = document.getElementById('list-box');
				// 存储定时器的变量
				var timer = null;
				
				var isH = false;
				
				// 当用户在文本框中输入的时候触发
				userName.oninput = function() {
					// 清除上一次开启的定时器
					clearTimeout(timer);
					// 获取用户输入的内容
					var key = this.value;
					// 如果用户没有在搜索框中输入内容(trim的作用是去空格)
					if (key.trim().length == 0) {
						// 将提示下拉框隐藏掉
						listBox.style.display = 'none';
						// 阻止程序向下执行
						return;
					}

					// 开启定时器 让请求延迟发送
					timer = setTimeout(function() {
						// 向服务器端发送请求
						// 向服务器端索取和用户输入关键字相关的内容
						$.ajax({
							type: 'get',
							url: '<%=path%>/user/haveUser.do',
							data: {
								key: key
							},
							success: function(result) {
								var html = null;
								if (result.isHave) {
									isH = true;
									var html = result.content;
									listBox.style.color="#FF0000"; 
								} else {
									isH = false;
									var html = result.content;
									listBox.style.color="#0000FF"; 
								}
								// 将得到的字符串显示在页面中
								listBox.innerHTML = html;
								// 显示ul容器
								listBox.style.display = 'block';
							}
						})
					}, 800)
				}; 

				//自定义验证规则
				form.verify({
					usernameLength: function(value) {
						if (value.length > 10)
							return '用户名超过了10个字！';
					},
					usernamehave: function(value){
						<%-- var isH = false;
						$.ajax({
							type: 'get',
							url: '<%=path%>/user/haveUser.do',
							data: {
								key: value
							},
							success: function(result) {
								var html = null;
								if (result.isHave == true) {
									isH = true;
								}
							}
						}); --%>
						if(isH)
							return '用户名不合格'; 
					},
					passwordLength: function(value) {
						if (value.length > 16)
							return '密码超过了16位！';
					},
					passwordRep: function(value) {
						if (value != pwd.value)
							return '两次输入的密码不一致！';
					},
				});

				//监听指定开关
				form.on('switch(switchTest)', function(data) {
					layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
						offset: '6px'
					});
					layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
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
