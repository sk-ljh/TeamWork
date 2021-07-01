<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html>

<head>
<meta charset="utf-8">
<title>个人信息修改</title>
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
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path%>/OrderSystem/layui/css/modules/layer/default/layer.css">
</head>

<body>

	<ul class="layui-nav">
		<h2>个人信息修改</h2>
	</ul>
	<div class="alterSelfInfMainBody">
		<div class="alterPic">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 30px;">
				<legend>修改头像</legend>
			</fieldset>

			<div class="layui-upload pic2BUploaded">
				<button type="button" class="layui-btn" id="test1">上传图片</button>
				<button id="file_confirm" type="button" class="layui-btn">确认修改</button>
				<div class="layui-upload-list">
					<img src="${basePort }${Userdetails.icon}"
						class="layui-upload-img" id="demo1"
						style="width: 200px; height: 200px">
				</div>
				<div class="bar" style="width: 95px;">
					<div class="layui-progress layui-progress-big"
						lay-showpercent="yes" lay-filter="demo">
						<div class="layui-progress-bar" lay-percent=""></div>
					</div>
				</div>
			</div>

			<a name="list-progress"> </a>
		</div>
		<div class="alterInf">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 20px;">
				<legend>修改个人信息</legend>
			</fieldset>
			<form class="layui-form" action="<%=path%>/alterSelfInf.do"
				method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="username" lay-verify="username"
							autocomplete="off"
							placeholder=<%=((User) session.getAttribute("loginUser")).getUser_name()%>
							class="layui-input" readonly>
					</div>
				</div>
				<div class="layui-form-item"
					style="position: relative; top: -54px; left: 40%">
					<label class="layui-form-label">性别</label>
					<%if(((User_details) session.getAttribute("Userdetails")).getSex()==null) 
					{%>
					<div class="layui-input-inline">
						<input type="radio" name="sex" value="男" title="男" checked="">
						<input type="radio" name="sex" value="女" title="女">
					</div>
					<%}else if(((User_details) session.getAttribute("Userdetails")).getSex().equals("男")) 
					{%>
					<div class="layui-input-inline">
						<input type="radio" name="sex" value="男" title="男" checked="">
						<input type="radio" name="sex" value="女" title="女">
					</div>
					<%}else if(((User_details) session.getAttribute("Userdetails")).getSex().equals("女")) 
					{%>
					<div class="layui-input-inline">
						<input type="radio" name="sex" value="男" title="男">
						<input type="radio" name="sex" value="女" title="女" checked="">
					</div>
					<%} %>
				</div>
				<div class="layui-form-item" style="position: relative; top: -50px">
					<label class="layui-form-label">旧密码</label>
					<div class="layui-input-inline">
						<input id="pwd" type="password" name="oldPwd"
							lay-verify="required" autocomplete="off" placeholder="必须*"
							class="layui-input" />
					</div>
					<div class="layui-form-item" id="list-box" style="text-align: center;"></div>
				</div>
				<div class="layui-form-item" style="position: relative; top: -45px">
					<label class="layui-form-label">新密码</label>

					<div class="layui-input-inline">
						<input id="newPwd" type="password" name="new-password"
							lay-verify="newPwd" placeholder="可选" autocomplete="off"
							class="layui-input" />
					</div>
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-inline">
						<input type="password" name="psdRep" lay-verify="pwdRep"
							placeholder="再次输入新密码" autocomplete="off" class="layui-input" />
					</div>
					<div class="layui-form-item" style="position: relative; top: 20px">
						<div class="layui-inline">
							<label class="layui-form-label">联系电话</label>
							<% if(((User_details) session.getAttribute("Userdetails")).getPhone()==null) {%>
							<div class="layui-input-inline">
								<input type="tel" name="phone" autocomplete="off" lay-verify="checkPhone"
									placeholder="" class="layui-input" />
							</div>
							<%} else {%>
							<div class="layui-input-inline">
								<input type="tel" name="phone" autocomplete="off" lay-verify="checkPhone"
									placeholder=<%=((User_details) session.getAttribute("Userdetails")).getPhone()%>
									class="layui-input" />
							</div>
							<%} %>
						</div>
					</div>
					<div class="layui-form-item form-button-item">
						<button class="layui-btn" lay-submit="" lay-filter="demo2">修改</button>
						<button type="button" class="layui-btn" onclick="face_reg()">人脸注册</button>
						<button type="button" class="layui-btn" onclick="jump_homepage()">返回主页</button>                                                
	
					</div>
			</form>
		</div>
	</div>
	
	<script src="<%=path%>/OrderSystem/js/layui.js"></script>
	 <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
	<script>
		var newPwd = document.querySelector("#newPwd");
		var pwd = document.querySelector("#pwd");
		
	
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
										data:{user_id:${loginUser.user_id} }
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

		layui.use([ 'form', 'layedit', 'laydate', 'upload', 'element','layer' ],
						function() {
							var $ = layui.jquery;
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
							var editIndex = layedit.build('LAY_demo_editor');
							
							var newPwd = document.querySelector("#newPwd");
							var pwd = document.querySelector("#pwd");
							var userId = ${loginUser.user_id};
							//密码是否正确
							var isTrue = null;
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
												isTrue = false;
												var html = result.content;
												listBox.style.color="#FF0000"; 
											} else {
												isTrue = true;
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
								required  : function(){
									if(!isTrue)
										return '旧密码错误！'
								},
								newPwd : function(value) {
									if (value.length > 0
											&& pwd.value.length == 0)
										return '修改密码前请先输入原密码！'
									else if (value.length > 0
											&& value == pwd.value)
										return '新密码与原密码一样了！';
									else if (value.length > 16)
										return '新密码超过了16位！'
								},
								pwdRep : function(value) {
									if (value != newPwd.value)
										return '两次输入的新密码不一致！'
								},
								checkPhone: [
							    	/^(\s*|1\d{10})$/
							      ,'请输入正确的电话号码'
							    ]
							});

						});
		function face_reg(){
			window.location.href="${basePath }OrderSystem/html/face_reg.jsp";
		}
		function jump_homepage(){
			window.location.href="<%=path%>/alterSelfInfJump.do";
		}
	</script>

</body>

</html>