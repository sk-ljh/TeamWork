<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*" import="java.util.List" import="java.util.Map"%>
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
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/tableFormation.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet"
	href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
<title>查看订单</title>
</head>

<body>
	<%
			User_details user_details;
			String name="null";
			if(session.getAttribute("loginUser")!=null)
			{
		 	user_details=(User_details)session.getAttribute("Userdetails");
		 	User temp=(User)session.getAttribute("loginUser");
		 	name=temp.getUser_name();
			}
			boolean is_update=true;
			if(session.getAttribute("is_update")!=null){
				is_update=(boolean)session.getAttribute("is_update");
				session.removeAttribute("is_update");
			}
			if(is_update==true)
				response.sendRedirect(path + "/orderHistory.do");
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
		<li class="layui-nav-item"><a href="<%=path%>/alterSelfInfJump.do">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a>
		</li>
		
		<li class="layui-nav-item layui-this"><a href="<%=path%>/OrderSystem/html/orderFormList.jsp">查看订单</a></li>
		<li class="layui-nav-item">
			<a href="<%=path %>/notice/listNotices.do">查看公告</a>
		</li>
		<li class="layui-nav-item"><a href="<%=path%>/logout.do">注销</a></li>
	</ul>
	<div class="orderFormListMainBody">
		<form name="myForm" class="layui-form" action=""
			onsubmit="return sumbit_sure()">

			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 50px;">
				<legend>正在进行的订单</legend>
			</fieldset>
			<table class="layui-table" lay-even="" lay-skin="nob">
				<thead>
					<tr class="title">
						<th>订单ID</th>
						<th>桌号</th>
						<th>服务员</th>
						<th>总价（元）</th>
						<th>开餐时间</th>
						<th>结餐时间</th>
						<th>详情</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<%
				@SuppressWarnings("unchecked")
				List<Order_history> order_history = (List<Order_history>)session.getAttribute("order_history");
				@SuppressWarnings("unchecked")
				Map<Integer, String> user_idToName = (Map<Integer, String>)session.getAttribute("user_idToName");
				if(order_history!=null&&user_idToName!=null)
					for(Order_history order:order_history){
				%>
					<tr class="orderForm">
						<td><%=order.getOrder_id() %></td>
						<td><%=order.getTable_number() %></td>
						<td><%=user_idToName.get(order.getUser_id()) %></td>
						<td><%=order.getTotal_price() %></td>
						<td><%=order.getBegin_time() %></td>
						<td><%=order.getEnd_time()==null?"——":order.getEnd_time()%></td>
						<td><a href="<%=path %>/getOrderDetail.do?order_id=<%=order.getOrder_id()%>">查看</a></td>
						<%if(order.getPayment_state()==0){ %>
						<td><a href="<%=path %>/changePaymentState.do?order_id=<%=order.getOrder_id()%>"><button title="点击提交订单" type="button" class="cooking layui-btn"
								 id="btn">结算提交</button>
							</a>
						</td>
						<%}else if(order.getPayment_state()==3){ %>
						<td><a href=""><button title="订单已提交,正在处理中!" type="button" class="toBcooked layui-btn"
								 id="btn">正在提交</button>
							</a>
						</td>
						<% } %>
					</tr>
				<% } %>
				</tbody>
			</table>
		</form>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
<!-- 	<script src="https://cdn.goeasy.io/goeasy-2.0.13.min.js"></script> -->
	<script>
// 	var goEasy = new GoEasy({
// 		host:"hangzhou.goeasy.io",
// 		appkey:"BC-93439a325fce47e78a7d90cfc2f4ffc0",
// 		modules:['pubsub']
// 	})
// 	goEasy.connect({
// 		onSuccess:function(){	
		
// 		},
// 		onFailed:function(error){
			
// 		},
// 		onProgress:function(attempts){
			
// 		}
// 	});
// 	var pubsub = goEasy.pubsub;
// 	pubsub.subscribe({
// 		channel:"yyr_goEasy",
// 		onMessage:function(message){
// 			alert(message.content);
// 		}
// 	});
		// 公告
		layui.use('layer', function () { 
			var $ = layui.jquery, layer = layui.layer; 
			
			var btns = document.querySelectorAll("#btn");
			for (let i = 0; i < btns.length; i++) {
				btns[i].onclick = function () {
						var tr = btns[i].parentNode.parentNode.parentNode;
						//找到表格
						var tbody = tr.parentNode;
						//删除行
						tbody.removeChild(tr);
						layer.msg('成功结束该条订单', {icon: 1});
				}
			}

			//触发事件
			var active = {
				notice: function () {
					//示范一个公告层
					layer.open({
						type: 1
						, title: false //不显示标题栏
						, closeBtn: false
						, area: '300px;'
						, shade: 0.8
						, id: 'LAY_layuipro' //设定一个id，防止重复弹出
						, btn: ['确认']
						, btnAlign: 'c'
						, moveType: 1 //拖拽模式，0或者1
						, content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">15号桌的顾客申请多点一碗香菇炖鸡汤，请尽快处理！</div>'
					});
				}
			};

			$('#layerDemo .layui-btn').on('click', function () {
				var othis = $(this), method = othis.data('method');
				active[method] ? active[method].call(this, othis) : '';
			});
		});
		layui.use(['form', 'layedit', 'laydate'], function () {
			var form = layui.form
			//自定义验证规则
			form.verify({
				pass: [
					/^\d{1,2}$/
				]
			});
		});
		function sumbit_sure() {
			alert("提交成功！");
			return false; //阻止表单默认提交
		}
		
		  var btns = document.querySelectorAll("#btn");
		  for (let i = 0; i < btns.length; i++) {
			  btns[i].onclick = function () {
				  if (btns[i].classList.contains('cooking')) {
					  layer.msg('提交成功!等待管理员处理...', {icon: 1});
					  
					  btns[i].classList.remove("cooking");
				      btns[i].classList.add("toBcooked");
					  btns[i].innerHTML = "正在提交";
				      btns[i].title="订单已提交,正在处理中...";
				  }
			  }
		  }
	</script>

</body>

</html>