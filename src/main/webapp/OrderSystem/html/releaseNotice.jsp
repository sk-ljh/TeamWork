<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/initiate.css">
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../layui/css/modules/code.css">
<link rel="stylesheet"
	href="../layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="../layui/css/modules/layer/default/layer.css">
<title>发布公告</title>
</head>

<body>
	<ul class="layui-nav">
		<h3>XXX用户，您已登录。</h3>
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
		<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="insertUser.jsp">添加用户</a>
				</dd>
				<dd>
					<a href="userList.jsp">更改用户信息</a>
				</dd>
			</dl></li>

		<li class="layui-nav-item"><a href="operateOrderForm.jsp">订单管理</a></li>
		<li class="layui-nav-item layui-this"><a href="releaseNotice.jsp">发布公告</a></li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
	</ul>
	<div class="releaseNoticeMainBody" style="height: 400px">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>发布公告</legend>
		</fieldset>
		<div style="text-align: center; height: 350px">
			<div style="display: inline-block; width: 600px; height: 100%">
				<div class="layui-bg-gray"
					style="padding: 30px; width: 500px; height: 100%">
					<form class="layui-form" action="">
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">内容</label>
							<div class="layui-input-block">
								<textarea style="height: 300px" name="content"
									lay-verify="required|contentLength" lay-reqtext="公告内容不能为空！"
									placeholder="请输入公告内容" class="layui-textarea"></textarea>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button
									style="position: relative; top: 15px; left: -15%; background: linear-gradient(to left, #186dec 10%, #8a31f0 100%); color: white"
									type="reset" class="layui-btn">重置</button>
								<button style="position: relative; top: 15px; left: -5%"
									type="submit" class="layui-btn" lay-submit=""
									lay-filter="demo1">立即提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="../layui/layui.js" charset="utf-8"></script>
<script>
  layui.use(['form', 'layedit', 'laydate'], function () {
    var form = layui.form
      , layer = layui.layer
      , layedit = layui.layedit
      , laydate = layui.laydate;

    //创建一个编辑器
    var editIndex = layedit.build('LAY_demo_editor');

    //自定义验证规则
    form.verify({
      contentLength:function(value){
        if(value.length>200)
          return '公告长度不得超过200字！'
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
        title: '提交的公告'
      })
      return false;
    });
  });
</script>

</html>