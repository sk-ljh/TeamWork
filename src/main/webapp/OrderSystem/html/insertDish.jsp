<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/initiate.css">
<link rel="stylesheet" href="../css/InfManage.css">
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../layui/css/modules/code.css">
<link rel="stylesheet"
	href="../layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="../layui/css/modules/layer/default/layer.css">
<title>添加菜品</title>
</head>

<body>
	<ul class="layui-nav">
		<h3>XXX用户，您已登录。</h3>
		<li class="layui-nav-item"><a href="adminHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item  layui-this"><a href="javascript:;">菜品管理</a>
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
		<li class="layui-nav-item"><a href="releaseNotice.jsp">发布公告</a></li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
	</ul>
	<div class="alterDishInfMainbody">
		<div class="alterInf">
			<form class="layui-form layui-form-pane" action="">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 30px;">
					<legend>上传菜品参考图</legend>
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
					<legend>填充菜品信息</legend>
				</fieldset>
				<div class="layui-form-item">
					<label class="layui-form-label">菜品名称</label>
					<div class="layui-input-inline">
						<input lay-reqtext="菜品名不能为空！" lay-verify="required|titleLength"
							type="text" name="dishName" autocomplete="off"
							placeholder="菜品名称不超过10个字" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">价格（元）</label>
					<div class="layui-input-inline">
						<input lay-reqtext="价格不能为空！"
							lay-verify="required|floatIdentification" type="text"
							name="price" placeholder="" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">类别</label>
					<div class="layui-input-inline">
						<select lay-reqtext="未选择菜品类别！" lay-verify="required"
							name="classification" lay-filter="aihao">
							<option value="" selected=""></option>
							<option value="0">炒饭</option>
							<option value="1">套饭</option>
							<option value="2">面食</option>
							<option value="3">炒菜</option>
							<option value="4">焖菜</option>
							<option value="5">烧烤</option>
							<option value="6">油炸</option>
							<option value="7">冷菜</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">菜品简介</label>
					<div class="layui-input-block">
						<input lay-reqtext="菜品简介不能为空！" lay-verify="required|InfLength"
							type="text" name="dishIntro" placeholder="菜品简介不超过20个字"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">菜品详细介绍</label>
					<div class="layui-input-block">
						<textarea lay-reqtext="菜品详细介绍不能为空！"
							lay-verify="required|DetailLength" name="dishDetail"
							placeholder="菜品详情不超过150个字" class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item form-button-item">
					<button class="layui-btn" lay-submit="" lay-filter="demo2">确定</button>
				</div>
			</form>
		</div>
	</div>
	<script src="../layui/layui.js" charset="utf-8"></script>
	<script>
    layui.use('element', function () {
      var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

      //监听导航点击
      element.on('nav(demo)', function (elem) {
        //console.log(elem)
        layer.msg(elem.text());
      });
    });
    layui.use(['upload', 'element', 'layer'], function () {
      var $ = layui.jquery
        , upload = layui.upload
        , element = layui.element
        , layer = layui.layer;
      //拖拽上传
      upload.render({
        elem: '#test10'
        , url: 'https://httpbin.org/post' //上传接口
        , accept: 'file' //普通文件
        , exts: 'jpg|png|gif|tiff|jpeg' //只允许上传压缩文件
        , done: function (res) {
          layer.msg('上传成功');
          layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', res.files.file);
        }
      });
    });
    layui.use(['form', 'layedit', 'laydate'], function () {
      var form = layui.form
        , layer = layui.layer
        , layedit = layui.layedit
        , laydate = layui.laydate;

      //创建一个编辑器
      var editIndex = layedit.build('LAY_demo_editor');

      //自定义验证规则
      form.verify({
        titleLength: function (value) {
          if (value.length > 10)
            return '菜品名超过了10个字！';
        },
        floatIdentification: [
          /^((\d+\.\d+)|(\d+))$/
          , '请正确输入价格！'
        ],
        InfLength: function (value) {
          if (value.length > 20)
            return '菜品简介超过了20个字！';
        },
        DetailLength: function (value) {
          if (value.length > 150)
            return '菜品详情超过了150个字！';
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