<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>个人信息修改</title>
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/InfManage.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
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
				<button type="button" class="layui-btn">确认修改</button>
				<div class="layui-upload-list">
					<img src="<%=path %>/OrderSystem/img/head1.jpg" class="layui-upload-img" id="demo1"
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
			<form class="layui-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="username" lay-verify="username"
							autocomplete="off" placeholder="张三" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item"
					style="position: relative; top: -54px; left: 40%">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-inline">
						<input type="radio" name="sex" value="男" title="男" checked="">
						<input type="radio" name="sex" value="女" title="女">
					</div>
				</div>
				<div class="layui-form-item" style="position: relative; top: -50px">
					<label class="layui-form-label">旧密码</label>
					<div class="layui-input-inline">
						<input id="pwd" type="password" name="oldPwd" autocomplete="off"
							placeholder="修改密码时需输入" class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item" style="position: relative; top: -45px">
					<label class="layui-form-label">新密码</label>

					<div class="layui-input-inline">
						<input id="newPwd" type="password" name="new-password"
							lay-verify="newPwd" placeholder="需输入原密码" autocomplete="off"
							class="layui-input" />
					</div>
					<label class="layui-form-label">再输入一次</label>
					<div class="layui-input-inline">
						<input type="password" name="psdRep" lay-verify="pwdRep"
							placeholder="再次输入新密码" autocomplete="off" class="layui-input" />
					</div>
					<div class="layui-form-item" style="position: relative; top: 20px">
						<div class="layui-inline">
							<label class="layui-form-label">联系电话</label>
							<div class="layui-input-inline">
								<input type="tel" name="phone" autocomplete="off"
									placeholder="15111123389" class="layui-input" />
							</div>
						</div>
					</div>
					<div class="layui-form-item form-button-item">
						<button
							style="height: 50px !important;; line-height: 50px !important; position: relative; top: 45px; left: 30%"
							class="layui-btn" lay-submit="" lay-filter="demo2">修改</button>
						<a href="javascript:;">
							<button
								style="height: 50px !important;; line-height: 50px !important; position: relative; top: 45px; left: 35%; background: linear-gradient(to right, rgb(253, 79, 79) 10%, rgb(255, 115, 0) 100%);"
								class="layui-btn" lay-submit="" lay-filter="demo2">返回主页</button>
						</a>
					</div>
			</form>
		</div>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
		var newPwd=document.querySelector("#newPwd");
		var pwd=document.querySelector("#pwd");
		layui.use(['upload', 'element', 'layer'], function () {

			var $ = layui.jquery,
				upload = layui.upload,
				element = layui.element,
				layer = layui.layer;


			var uploadInst = upload.render({
				elem: '#test1'
				, url: 'https://httpbin.org/post' //上传接口
				, accept: 'file' //普通文件
				, exts: 'jpg|png|gif|tiff|jpeg' //设定文件后缀
				, before: function (obj) {
					//预读本地文件示例，不支持ie8
					obj.preview(function (index, file, result) {
						$('#demo1').attr('src', result); //图片链接（base64）
					});

					element.progress('demo', '0%'); //进度条复位
					layer.msg('上传中', { icon: 16, time: 0 });
				}
				, done: function (res) {
					//如果上传失败
					if (res.code > 0) {
						return layer.msg('上传失败');
					}
					//上传成功的一些操作
					//……
					$('#demoText').jsp(''); //置空上传失败的状态
				}
				, error: function () {
					//演示失败状态，并实现重传
					var demoText = $('#demoText');
					demoText.jsp('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
					demoText.find('.demo-reload').on('click', function () {
						uploadInst.upload();
					});
				}
				//进度条
				, progress: function (n, elem, e) {
					element.progress('demo', n + '%'); //可配合 layui 进度条元素使用
					if (n == 100) {
						layer.msg('上传完毕', { icon: 1 });
					}
				}
			});
		});

		layui.use(['form', 'layedit', 'laydate', 'upload', 'element', 'layer'], function () {
			var form = layui.form,
				layer = layui.layer,
				layedit = layui.layedit,
				laydate = layui.laydate;
			var editIndex = layedit.build('LAY_demo_editor');

			//自定义验证规则
			form.verify({
				newPwd: function (value) {
					if(value.length>0&&pwd.value.length==0)
						return '修改密码前请先输入原密码！'
					else if (value.length>0&&value == pwd.value)
						return '新密码与原密码一样了！';
					else if (value.length > 16)
						return '新密码超过了16位！'
				},
				pwdRep:function(value){
					if(value!=newPwd.value)
						return '两次输入的新密码不一致！'
				}
			});
		});
	</script>

</body>

</html>