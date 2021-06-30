<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%  
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	session.setAttribute("basePath", basePath);
%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
<title>发布公告</title>
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
			<img src="${basePort }${Userdetails.icon}" style="width:50px;height:50px;border-radius:2em;float:left;position:relative;top:10px;">
		</a>
		<h3>
			&nbsp&nbsp&nbsp&nbsp&nbsp用户&nbsp&nbsp
			<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp"><%=user_name%></a>
			&nbsp&nbsp，您已登录。
		</h3>
		<li class="layui-nav-item layui-this"><a
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
		<li class="layui-nav-item"><a href="<%=path%>/logout.do">注销</a></li>
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
					<form class="layui-form" action="" method="">
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">内容</label>
							<div class="layui-input-block">
								<textarea style="height: 300px" name="content"
									lay-verify="required|contentLength" lay-reqtext="公告内容不能为空！"
									placeholder="请输入公告内容" class="layui-textarea"></textarea>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">发送给</label>
							<div class="layui-input-inline">
								<select name="target" lay-filter="isRecommend">
									<option value="entire" selected="">服务员&nbsp/&nbsp后厨</option>
									<option value="waiter">服务员</option>
									<option value="chef">后厨</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button
									style="position: relative; top: 15px; left: -15%; background: linear-gradient(to left, #186dec 10%, #8a31f0 100%); color: white"
									type="reset" class="layui-btn">重置</button>
								<button style="position: relative; top: 15px; left: -5%"
									type="submit" class="layui-btn" lay-submit=""
									lay-filter="release">立即提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
 	<script src="https://cdn.goeasy.io/goeasy-2.0.13.min.js"></script>
<script>
  layui.use(['form', 'layedit', 'laydate'], function () {
    var form = layui.form
      , layer = layui.layer
      , layedit = layui.layedit
      , laydate = layui.laydate;
	var goEasy = new GoEasy({
		host:"hangzhou.goeasy.io",
	    appkey: "BC-93439a325fce47e78a7d90cfc2f4ffc0",
	    modules:['pubsub']
	});
	var goEasy2 = new GoEasy({
		host:"hangzhou.goeasy.io",
	    appkey: "BC-05fb82608a1f4474b934175a7b67e9a6",
	    modules:['pubsub']
	});
	goEasy.connect({

	});
	goEasy2.connect({
	
	});
	var pubsub = goEasy.pubsub;
    var pubsub2 = goEasy2.pubsub;
    
    var $ = layui.jquery
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
    form.on('submit(release)', function (data) {
	  $.ajax({
			url : "${basePath}notice/insertNotice.do",
			type : "POST",
			data : data.field,
			dataType : "json",
			success : function(result) {
				if (result.res == "success") {
				  layer.msg('已成功发布公告！', {
						icon: 1,
						time:1000,
						offset:['50px','900px'],
						end:function(){
					      if(result.target=="chef"||result.target=="entire"){
							  pubsub.publish({
							      channel: "OrderSys_Chef",
							      message: result.content
							  });
						  }
						  if(result.target=="waiter"||result.target=="entire"){
							  pubsub2.publish({
							      channel: "OrderSys_Waiter",
							      message: result.content
							  });
						  }
						  window.location.href="<%=path %>/OrderSystem/html/releaseNotice.jsp";
						}
				  });
			   }
		   }		
	  });	
      return false;
    });
  });
</script>

</html>