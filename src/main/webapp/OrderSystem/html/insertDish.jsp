<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
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
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/InfManage.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
<title>添加菜品</title>
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
	<% String defaultDishIcon=path+"/OrderSystem/img/茄汁培根意面.jpg";%>
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
			href="<%=path %>/adminHome/getParts.do">首页</a></li>
		<li class="layui-nav-item"><a
			href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a></li>
		<li class="layui-nav-item  layui-this"><a href="javascript:;">菜品管理</a>
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
	<div class="alterDishInfMainbody">
		<div class="alterInf">
			<form class="layui-form layui-form-pane" action="">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>上传菜品参考图</legend>
				</fieldset>
				<div class="layui-upload pic2BUploaded" style="position:relative;left:50%;transform:translateX(-50%)">
					<button type="button" class="layui-btn" id="test1" style="position:relative;width:200px;top:215px;left:50%;transform:translateX(-50%)">
						上传图片
					</button>
					<div class="layui-upload-list" >
						<img src="<%= defaultDishIcon %>" class="layui-upload-img" id="demo1"
							style="width: 200px; height: 200px;position:relative;left:50%;transform:translateX(-50%)">
					</div>
					<div class="bar" style="width: 200px;position:relative;left:50%;transform:translateX(-50%)">
						<div class="layui-progress layui-progress-big"
							lay-showpercent="yes" lay-filter="demo">
							<div class="layui-progress-bar" lay-percent=""></div>
						</div>
					</div>
				</div>
	
				<a name="list-progress"> </a>
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 30px;">
					<legend>输入菜品信息</legend>
				</fieldset>
				<div class="layui-form-item">
					<label class="layui-form-label">菜品名称</label>
					<div class="layui-input-block">
						<input lay-reqtext="未输入菜品名！" lay-verify="required|nameLength"
							type="text" name="name" autocomplete="off"
							placeholder="不超过30个字" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">类别</label>
					<div class="layui-input-inline">
						<select lay-reqtext="未选择菜品类别！" lay-verify="required"
							name="category" lay-filter="category">
							<option value="" selected=""></option>
							<option value="美味闷锅">美味闷锅</option>
							<option value="热乎炒菜">热乎炒菜</option>
							<option value="湘菜系谱">湘菜系谱</option>
							<option value="经典水煮">经典水煮</option>
							<option value="飘香煮菜">飘香煮菜</option>
							<option value="可口煎菜">可口煎菜</option>
							<option value="开胃炸菜">开胃炸菜</option>
							<option value="软烂炖菜">软烂炖菜</option>
							<option value="浓香蒸菜">浓香蒸菜</option>
							<option value="其它">其它</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">是否推荐</label>
					<div class="layui-input-inline">
						<select name="recom" lay-filter="isRecommend">
							<option value="是" selected="">是</option>
							<option value="否">否</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">价格（元）</label>
					<div class="layui-input-inline">
						<input lay-reqtext="未输入价格！"
							lay-verify="required|floatIdentification" type="text"
							name="price" placeholder="输入价格（元）" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">供应商</label>
					<div class="layui-input-inline">
						<input lay-reqtext="未输入供应商！" lay-verify="required|supplierLength"
							type="text" name="supplier" placeholder="不超过10个字"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">菜品规格</label>
					<div class="layui-input-inline">
						<input lay-reqtext="未输入菜品规格！" lay-verify="required|sizeLength"
							type="text" name="size" placeholder="不超过5个字"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">口味</label>
					<div class="layui-input-inline">
						<input lay-reqtext="未输入菜品的口味！" lay-verify="required|flavorLength"
							type="text" name="flavor" placeholder="不超过5个字"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">菜品简介</label>
					<div class="layui-input-block">
						<input lay-reqtext="未输入菜品简介！" lay-verify="required|introLength"
							type="text" name="introduction" placeholder="不超过100个字"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">菜品详细介绍</label>
					<div class="layui-input-block">
						<textarea lay-reqtext="未输入菜品的详细介绍！"
							lay-verify="required|detailLength" name="detail"
							placeholder="不超过200个字" class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item form-button-item">
					<button class="layui-btn" lay-submit="" lay-filter="demo2">确定</button>
				</div>
			</form>
		</div>
	</div>
	<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
    layui.use('element', function () {
      var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	      //监听导航点击
	      element.on('nav(demo)', function (elem) {
	        //console.log(elem)
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
    layui.use(['form', 'layedit', 'laydate'], function () {
      var form = layui.form
        , layer = layui.layer
        , layedit = layui.layedit
        , laydate = layui.laydate;

      //创建一个编辑器
      var editIndex = layedit.build('LAY_demo_editor');

      //自定义验证规则
      form.verify({
        nameLength: function (value) {
          if (value.length > 30)
            return '菜品名称超过30个字了！';
        },
        floatIdentification: [
          /^((\d+\.\d+)|(\d+))$/
          , '请正确输入价格！'
        ],
        supplierLength:function(value){
        	if(value.length>10)
        		return '供应商名超过10个字了！';
        },
        sizeLength: function (value) {
          if (value.length > 5)
            return '菜品规格超过5个字了！';
        },
        flavorLength: function (value) {
          if (value.length > 5)
            return '菜品口味超过5个字了！';
        },
        introLength: function (value) {
          if (value.length > 100)
            return '菜品简介超过100个字了！';
        },
        detailLength: function (value) {
          if (value.length > 200)
            return '菜品详细介绍超过200个字了！';
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
      form.on('submit(demo2)', function (data) {
      console.log("121221");
      		$.ajax({
					url : "${basePath}dishDetail/insertDish.do",
					type : "POST",
					data : data.field,
					dataType : "json",
					success : function(data) {
								if (data.res == "success") {
									layer.msg('成功添加菜品！', {
										icon: 1,
										time:1000,
										offset:['50px','900px'],
										end:function(){
											window.location.href="<%=path %>/OrderSystem/html/insertDish.jsp";	
										}
									});	
								}
							}		
				});
			return false;
      });
    });
  </script>
</body>

</html>