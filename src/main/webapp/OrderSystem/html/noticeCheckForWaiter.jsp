<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.our.pojo.*" import="java.util.Map"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>公告列表</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, maximum-scale=1">
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String basePort=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+"/file/";
	session.setAttribute("basePath", basePath);
	session.setAttribute("basePort", basePort);
	%>
	<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
	<link rel="stylesheet" href="<%=path %>/OrderSystem/css/tableFormation.css">
	<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
	<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
	<link rel="stylesheet"
		href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
	<link rel="stylesheet"
		href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<li class="layui-nav-item"><a href="<%=path%>/alterSelfInfJump.do">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item"><a href="<%=path%>/OrderSystem/html/orderFormList.jsp">查看订单</a></li>
		<li class="layui-nav-item layui-this">
			<a href="<%=path %>/notice/listNotices.do">查看公告</a>
		</li>
		<li class="layui-nav-item"><a href="<%=path%>/logout.do">注销</a></li>
	</ul>
	<div class="noticeMainBody" style="margin-bottom:200px">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>公告列表</legend>
		</fieldset>
		<div class="layui-form">
				<c:if test="${notices[0]==null}">
					<div class="notice"><p>未找到目标！</p></div>
				</c:if>
				<c:if test="${notices[0]!=null}">
				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr class="title">
							<th>管理员id</th>
							<th>公告内容</th>
							<th>发布时间</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="notice" items="${notices}">
						<tr class="noticeForm">
							<td>${notice.from_id}</td>
							<td>
								${notice.content}
							</td>
							<td>${notice.time}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</c:if>
		</div>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
 	<script src="https://cdn.goeasy.io/goeasy-2.0.13.min.js"></script>
	<script>
     var goEasy = new GoEasy({
      	  host:"hangzhou.goeasy.io",
       	  appkey: "BC-93439a325fce47e78a7d90cfc2f4ffc0",
       	  modules:['pubsub']
	  });
	  goEasy.connect({

	  });
	  var pubsub = goEasy.pubsub;
	  
	  layui.use(['layer'], function () {
	  
	 	//接受实时公告
		pubsub.subscribe({
			channel: "OrderSys_Chef",
			onMessage: function (message) {
				layer.open({
					type: 1
					, offset:'100px'
					, closeBtn: false
					, area: '300px;'
					, title:false
					, shade: 0.8
					, id: 'LAY_layuipro'
					, btn: ['确认']
					, btnAlign: 'c'
					, moveType: 1 
					, content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'
						+'您有新的公告：<br><br>'+message.content+'</div>'
				});  
			}
	    });
	 })
	</script>
</body>
</html>