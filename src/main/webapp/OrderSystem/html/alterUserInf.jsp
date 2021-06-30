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
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
		
		String basePort=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+"/file/";
		session.setAttribute("basePath", basePath);
		session.setAttribute("basePort", basePort);
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
	</ul>
		<%
			int userId = (int)session.getAttribute("userId");
			User_details userDetails = (User_details)session.getAttribute("userDetails");
		%>

		<div class="alterUserInfMainbody">
			<div class="alterPic">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>用户头像</legend>
				</fieldset>

				<div class="layui-upload pic2BUploaded">
					<button type="button" class="layui-btn" id="test1">上传图片</button>
					<button id="file_confirm" type="button" class="layui-btn">确认修改</button>
					<div class="layui-upload-list">
						<img src="${basePort }<%=userDetails.getIcon() %>" class="layui-upload-img" id="demo1"
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
							<%
								String userName = (String)session.getAttribute("userName");
							%>
							<div class="layui-input-inline">
								<label class="layui-form-label"><%=userName%></label>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">原密码</label>
							<div class="layui-input-inline">
								<input id="pwd" lay-verify="passwordLength" type="password" name="pwd"
									placeholder="修改密码时需填" autocomplete="off" class="layui-input">
							</div>
							<div id="list-box" style="text-align: center;"></div>
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
		<script src="<%=path%>/OrderSystem/layui/layui.js"></script>
		<script>
			layui.use('element', function() {
				var element = layui.element; //导航的hover效果、二级菜单等功能

				//监听导航点击
				element.on('nav(demo)', function(elem) {
					layer.msg(elem.text());
				});
			});
			layui.use([ 'upload', 'element', 'layer' ],
				function() {
					var $ = layui.jquery, upload = layui.upload, element = layui.element, layer = layui.layer;
					var uploadInst = upload.render({
						elem : '#test1',
						url : '${basePath }file/doupload.do' //上传接口
						,
						accept : 'file' //普通文件
						,
						exts : 'jpg|png|gif|tiff|jpeg' //设定文件后缀
						,
						field:'mulFile'
						 ,
						auto:false
						,
						bindAction: '#file_confirm'
						,
						data:{user_id:<%=userId%> }
						,
						choose: function(obj){
							obj.preview(function(index,file, result) {
										$('#demo1').attr('src',result); //图片链接（base64）
									});
							element.progress('demo', '0%'); //进度条复位
						 },
						
						done : function(res) {
							//如果上传失败
							if (res.code > 0) {
								return layer.msg('上传失败');
							}
							//上传成功的一些操作
							//……
							 $('#demoText').html(''); //置空上传失败的状态
						},
						error : function() {
							//演示失败状态，并实现重传
							var demoText = $('#demoText');
							demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
							demoText.find('.demo-reload').on(
									'click', function() {
										uploadInst.upload();
									});
						}
						//进度条
						,
						progress : function(n, elem, e) {
							element.progress('demo', n + '%'); //可配合 layui 进度条元素使用
							if (n == 100) {
								layer.msg('上传完毕', {
									icon : 1
								});
							}
						}
					});
				});

			layui.use(['form', 'layedit', 'laydate'],function() {
				var form = layui.form,
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate,
					$ = layui.jquery;
				var newPwd = document.querySelector("#newPwd");
				var pwd = document.querySelector("#pwd");
				var userId = <%=userId%>;
				//创建一个编辑器
				var editIndex = layedit.build('LAY_demo_editor');
				
				// 用户名查重部分
				// 获取用户名内容框
				var userName = document.getElementById('pwd');
				// 获取提示文字的存放容器
				var listBox = document.getElementById('list-box');
				// 存储定时器的变量
				var timer = null;
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
							url: '<%=path%>/user/isTrue.do',
							data: {
								key: key,
								userId: userId
							},
							success: function(result) {
								var html = null;
								if (!result.isTrue) {
									var html = result.content;
									listBox.style.color="#FF0000"; 
								} else {
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
					},
					pwd: function(){
						
					},
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
