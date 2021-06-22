<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/InfManage.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
<title>菜品信息更改</title>
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
		<li class="layui-nav-item layui-this"><a href="<%=path %>/OrderSystem/html/adminHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item"><a href="javascript:;">菜品管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="<%=path %>/OrderSystem/html/insertDish.jsp">添加菜品</a>
				</dd>
				<dd>
					<a href="<%=path %>/OrderSystem/html/dishAdminList.jsp">更改菜品信息</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="<%=path %>/OrderSystem/html/insertUser.jsp">添加用户</a>
				</dd>
				<dd>
					<a href="<%=path %>/OrderSystem/html/userList.jsp">更改用户信息</a>
				</dd>
			</dl></li>

		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/operateOrderForm.jsp">订单管理</a></li>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/releaseNotice.jsp">发布公告</a></li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
	</ul>
	<div class="alterDishInfMainbody">
		<div class="alterPic">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 30px;">
				<legend>菜品参考图</legend>
			</fieldset>

			<div class="layui-upload pic2BUploaded">
				<button type="button" class="layui-btn" id="test1">上传图片</button>
				<button type="button" class="layui-btn">确认修改</button>
				<div class="layui-upload-list">
					<img src="<%=path %>/OrderSystem/img/茄汁培根意面.jpg" class="layui-upload-img" id="demo1"
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
				style="margin-top: 0px;">
				<legend>菜品信息修改</legend>
			</fieldset>
			<form class="layui-form layui-form-pane" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">菜品名称</label>
					<div class="layui-input-inline">
						<input type="text" name="dishName" autocomplete="off"
							placeholder="茄汁培根意面" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">价格（元）</label>
					<div class="layui-input-inline">
						<input type="text" name="price" placeholder="22.5"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">类别</label>
					<div class="layui-input-inline">
						<select name="classification" lay-filter="aihao">
							<option value="0">炒饭</option>
							<option value="1">套饭</option>
							<option value="2" selected="">面食</option>
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
						<input type="text" name="dishIntro"
							placeholder="酸咸适度，让人回味无穷，是家庭中非常有价值的美食。" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">菜品详细介绍</label>
					<div class="layui-input-block">
						<textarea name="dishDetail"
							placeholder="茄汁培根意面，小番茄 豌豆、酱油 番茄酱 白糖，茄汁培根意面是以意粉、培根为主材的制作的菜品。
                菜名: 茄汁培根意面
                菜品口味:酸咸
                主要工艺:炒
                所需时间:十分钟
                制作难度:简单
                所用厨具:炒锅 煮锅"
							class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item form-button-item">
					<button class="layui-btn" lay-submit="" lay-filter="demo2">修改</button>
				</div>
			</form>
		</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
		<script>
        layui.use('element', function(){
            var element = layui.element; //导航的hover效果、二级菜单等功能
            
            //监听导航点击
            element.on('nav(demo)', function(elem){
                layer.msg(elem.text());
            });
        });
        layui.use(['upload', 'element', 'layer'], function(){
            var $ = layui.jquery
            ,upload = layui.upload
            ,element = layui.element
            ,layer = layui.layer;
            
            //图片上传
            var uploadInst = upload.render({
                elem: '#test1'
                ,url: 'https://httpbin.org/post' //上传接口
                ,accept: 'file' //普通文件
                ,exts: 'jpg|png|gif|tiff|jpeg' //设定文件后缀
                ,before: function(obj){
                  //预读本地文件示例，不支持ie8
                  obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                  });
                  
                  element.progress('demo', '0%'); //进度条复位
                  layer.msg('上传中', {icon: 16, time: 0});
              }
              ,done: function(res){
                  //如果上传失败
                  if(res.code > 0){
                    return layer.msg('上传失败');
                  }
                  //上传成功的一些操作
                  //……
                  $('#demoText').jsp(''); //置空上传失败的状态
              }
              ,error: function(){
                  //演示失败状态，并实现重传
                  var demoText = $('#demoText');
                  demoText.jsp('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                  demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                  });
              }
              //进度条
              ,progress: function(n, elem, e){
                  element.progress('demo', n + '%'); //可配合 layui 进度条元素使用
                  if(n == 100){
                    layer.msg('上传完毕', {icon: 1});
                  }
              }
            });
        });  
        layui.use(['form', 'layedit', 'laydate'], function(){
            var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
            
            
            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');
            
            //自定义验证规则
            form.verify({
   
            });
            
            //监听指定开关
            form.on('switch(switchTest)', function(data){
                layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
                });
                layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
            });
            
            //监听提交
            form.on('submit(demo1)', function(data){
                layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
                })
                return false;
            });     
        });
    </script>
</body>
</html>