<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.our.pojo.*" import="java.util.Map" pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>后厨主页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/tableFormation.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
</head>

<body>

	<%
		User_details user_details;
			String name="null";
			if(session.getAttribute("loginUser")!=null)
			{
		 	User user=(User)session.getAttribute("loginUser");
		 	
		 	name=user.getUser_name();
			}
			boolean is_update=true;
			if(session.getAttribute("is_update")!=null){
				is_update=(boolean)session.getAttribute("is_update");
				session.removeAttribute("is_update");
			}
			if(is_update==true)
				response.sendRedirect(path + "/chefHomepage.do");
			response.setHeader("refresh", "10;url="+ path + "/chefHomepage.do");
	%>
	<ul class="layui-nav">
		<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">
			<img src="${basePort }${Userdetails.icon}" style="width:50px;height:50px;border-radius:2em;float:left;position:relative;top:10px;">
		</a>
		<h3>
			&nbsp&nbsp&nbsp&nbsp&nbsp用户&nbsp&nbsp
			<a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp"><%=name%></a>
			&nbsp&nbsp，您已登录。
		</h3>
		<li class="layui-nav-item layui-this"><a href="<%=path %>/chefHomepage.do">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a></li>
		<li class="layui-nav-item">
			<a href="<%=path %>/notice/listNotices.do">查看公告</a>
		</li>
		<li class="layui-nav-item"><a href="<%=path%>/logout.do">注销</a></li>
	</ul>
	<div class="chefHomepageMainBody">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px; font-size: 50px;">
			<legend>点餐信息列表</legend>
		</fieldset>

		<table class="layui-table" lay-even="" lay-skin="nob">
			<thead>
				<tr class="title">
					<th>菜品名称</th>
					<th>菜品桌号</th>
					<th>菜品数量</th>
					<th>烹制状态</th>
				</tr>
			</thead>
			<tbody style="font-size: 20px;">
				<% 
					@SuppressWarnings("unchecked")
					List<Order_list> order_list = (List<Order_list>)session.getAttribute("order_list");
					@SuppressWarnings("unchecked")
					Map<Integer, Integer> map=(Map<Integer, Integer>)session.getAttribute("table_number_map");
					if(order_list!=null&&map!=null)
						for(Order_list order:order_list){
				%>
				<tr class="cook">
					<td><%=order.getDishs_name() %></td>
					<td><%=map.get(order.getOrder_id()) %></td>
					<td><%=order.getNumber() %></td>
				<% if(order.getCook_state()==1){ %>
					<td><a href="<%=path %>/updateOrder.do?order_list_id=<%=order.getOrder_list_id()%>"><button title="点击切换状态"
								type="button" class="toBcooked layui-btn layui-icon layui-icon-time" id="btn">准备烹饪</button></a></td>
				<% }else if(order.getCook_state()==2){ %>
					<td><a href="<%=path %>/updateOrder.do?order_list_id=<%=order.getOrder_list_id()%>"><button title="点击以结束烹饪"
								type="button" class="cooking layui-btn layui-icon layui-icon-fire" id="btn">正在烹饪</button></a></td>
					<% } %>
				</tr>
				<% } %>
			</tbody>
		</table>
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
		  var btns = document.querySelectorAll("#btn");
		  for (let i = 0; i < btns.length; i++) {
			  btns[i].onclick = function () {
				  if (btns[i].classList.contains('cooking')) {
					  var tr = btns[i].parentNode.parentNode.parentNode;
					  //找到表格
					  var tbody = tr.parentNode;
					  //删除行
					  tbody.removeChild(tr);
					  layer.msg('成功结束该条烹饪记录！', {icon: 1});
				  }
				  else {
					  btns[i].classList.remove("toBcooked");
				      btns[i].classList.add("cooking");
					  btns[i].innerHTML = "正在烹饪";
				      btns[i].title="点击以结束烹饪";
				  }
			  }
		  }
	 })
	</script>

</body>

</html>