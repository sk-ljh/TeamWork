<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html>

<head>
<meta charset="utf-8">
<title>添加用户</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
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
		<h3>用户<%=user_name %>，您已登录。</h3>
		<li class="layui-nav-item"><a href="adminHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">菜品管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="insertDish.jsp">添加菜品</a>
				</dd>
				<dd>
					<a href="dishAdminList.jsp">更改菜品信息</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item layui-this"><a href="javascript:;">用户管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="insertUser.jsp">添加用户</a>
				</dd>
				<dd>
					<a href="userList.jsp">更改用户信息</a>
				</dd>
			</dl></li>

		<li class="layui-nav-item"><a href="operateOrderForm.jsp">订单管理</a></li>
		<li class="layui-nav-item"><a href="releaseNotice.jsp">发布公告</a></li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
	</ul>
	<div class="alterUserInfMainbody">
		<div class="alterInf">
			<form class="layui-form layui-form-pane" action="">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 30px;">
					<legend>上传用户头像图片</legend>
				</fieldset>
				<div class="layui-upload-drag" id="test10">
					<i class="layui-icon"></i>
					<p>点击上传，或将文件拖拽到此处</p>
					<div class="layui-hide" id="uploadDemoView">
						<hr>
						<img src="" alt="上传成功后渲染" style="width: 200px; height: 200px">
					</div>
				</div>
				<a name="list-progress"> </a>
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 30px;">
					<legend>填充用户信息</legend>
				</fieldset>
				<div class="formWrapper">
					<div class="layui-form-item">
						<label class="layui-form-label">用户名</label>
						<div class="layui-input-inline">
							<input lay-reqtext="用户名不能为空！"
								lay-verify="required|usernameLength" type="text" name="username"
								autocomplete="off" placeholder="用户名不超过10个字" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">填写密码</label>
						<div class="layui-input-inline">
							<input id="pwd" lay-reqtext="密码不能为空！"
								lay-verify="required|passwordLength" type="password" name="pwd"
								placeholder="密码不超过16个字符" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">确认密码</label>
						<div class="layui-input-inline">
							<input id="pwdRep" lay-reqtext="确认密码不能为空！"
								lay-verify="required|passwordRep" type="password" name="pwdRep"
								placeholder="" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">用户角色</label>
						<div class="layui-input-inline">
							<select lay-reqtext="未选择用户角色！" lay-verify="required"
								name="identity" lay-filter="identity">
								<option value="" selected=""></option>
								<option value="1">服务员</option>
								<option value="2">后厨</option>
								<option value="3">管理员</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item form-button-item">
						<button type="submit" class="layui-btn" lay-submit=""
							lay-filter="demo2">确定</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
    layui.use(['upload', 'element', 'layer'], function () {
      var $ = layui.jquery
        , upload = layui.upload
        , element = layui.element
        , layer = layui.layer;
      //拖拽上传
      upload.render({
        elem: '#test10'
        , url: 'https://httpbin.org/post' //改成您自己的上传接口
        , accept: 'file' //普通文件
        , exts: 'jpg|png|gif|tiff|jpeg' //只允许上传压缩文件
        , done: function (res) {
          layer.msg('上传成功');
          layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', res.files.file);
          console.log(res)
        }
      });
    });
    layui.use(['form', 'layedit', 'laydate'], function () {
      var form = layui.form
        , layer = layui.layer
        , layedit = layui.layedit
        , laydate = layui.laydate;
      var pwd=document.getElementById("pwd");
      //创建一个编辑器
      var editIndex = layedit.build('LAY_demo_editor');

      //自定义验证规则
      form.verify({
        usernameLength: function (value) {
          if (value.length > 10)
            return '用户名超过了10个字！';
        },
        passwordLength: function (value) {
          if (value.length > 16)
            return '密码超过了16位！';
        },
        passwordRep: function (value) {
          if (value != pwd.value)
            return '两次输入的密码不一致！';
        }
      });

      //监听指定开关
      form.on('switch(switchTest)', function (data) {
        layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
          offset: '6px'
        });
        layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
      });

      //监听提交
      form.on('submit(demo1)', function (data) {
        layer.alert(JSON.stringify(data.field), {
          title: '最终的提交信息'
        })
        return false;
      });
    });
  </script>

</body>

</html>