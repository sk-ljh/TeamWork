<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>欢迎用户登录</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/initiate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/css/tableFormation.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/code.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/laydate/default/laydate.css">
<link rel="stylesheet" href="<%=path %>/OrderSystem/layui/css/modules/layer/default/layer.css">
</head>

<body>
	 <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
	<div class="loginMainBody">
		<form class="layui-form layui-form-pane" action="<%=path %>/dologin.do" method="post">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 30px;">
				<legend>欢迎登录</legend>
			</fieldset>
			<div class="formWrapper loginForm">

				<div class="layui-form-item">
					<label class="layui-form-label">用户角色</label>
					<div class="layui-input-inline">
						<select lay-reqtext="未选择用户角色！" lay-verify="required"
							name="user_id" lay-filter="identity">
							<option value="" selected=""></option>
							<option value="1">服务员</option>
							<option value="2">后厨</option>
							<option value="3">管理员</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input lay-reqtext="请输入用户名！" lay-verify="required" type="text"
							name="user_name" autocomplete="off" placeholder="请输入用户名"
							class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-inline">
						<input lay-reqtext="请输入密码！" lay-verify="required" type="password"
							name="password" placeholder="请输入密码" autocomplete="off"
							class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">验证码</label>
					<div class="layui-input-inline">
						<input lay-reqtext="请输入验证码！" lay-verify="required|vcode"
							type="text" name="identify" placeholder="请输入验证码"
							autocomplete="off" class="layui-input" id="text">
						<canvas id="canvas" width="150" height="40" onclick="dj()"
							style="border: 1px solid #ccc; border-radius: 5px;"></canvas>
					</div>
				</div>
				<div class="layui-form-item form-button-item">
					<button class="layui-btn" lay-submit="" lay-filter="demo1">登录</button>
				</div>
			</div>
		</form>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>
	<script>
		var show_num = [];
		draw(show_num);
		var val = document.getElementById("text").value;
		var num = show_num.join("");
		function dj() {
			draw(show_num);
			num = show_num.join("");
		}
		layui.use(['form', 'layedit', 'laydate'], function () {
			var form = layui.form
				, layer = layui.layer
				, layedit = layui.layedit
				, laydate = layui.laydate;
			var pwd = document.getElementById("pwd");
			//创建一个编辑器
			var editIndex = layedit.build('LAY_demo_editor');

			//自定义验证规则
			form.verify({
				vcode:function(value){
					if(num.toLowerCase()!=value.toLowerCase()){
						document.getElementById("text").value = '';
						draw(show_num);
						num = show_num.join("");
						return '验证码错误！'
					}
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
				 $.ajax({
			            url: "<%=path %>/dologin.do",
			            type: "POST",
			            data:data.field,
			            success: function(data) {
			             	alert(data);
			            }
			        });
				    return false;
				  });
		});
		// function sublim() {
		// 	var val = document.getElementById("text").value;
		// 	var num = show_num.join("");
		// 	if (val.toLowerCase() == num.toLowerCase()) {
		// 		return true;
		// 	} else {
		// 		alert('验证码错误！');
		// 		document.getElementById("text").value = '';
		// 		draw(show_num);
		// 	}
		// }

		function draw(show_num) {
			var canvas_width = document.getElementById('canvas').clientWidth;
			var canvas_height = document.getElementById('canvas').clientHeight;
			var canvas = document.getElementById("canvas"); //获取到canvas的对象，演员
			var context = canvas.getContext("2d"); //获取到canvas画图的环境，演员表演的舞台
			canvas.width = canvas_width;
			canvas.height = canvas_height;
			var sCode =
				"A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0,q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m";
			var aCode = sCode.split(",");
			var aLength = aCode.length; //获取到数组的长度

			for (var i = 0; i <= 3; i++) {
				var j = Math.floor(Math.random() * aLength); //获取到随机的索引值
				var deg = Math.random() * 30 * Math.PI / 180; //产生0~30之间的随机弧度
				var txt = aCode[j]; //得到随机的一个内容
				show_num[i] = txt;
				var x = 10 + i * 20; //文字在canvas上的x坐标
				var y = 20 + Math.random() * 8; //文字在canvas上的y坐标
				context.font = "bold 20px 微软雅黑";

				context.translate(x, y);
				context.rotate(deg);

				context.fillStyle = randomColor();
				context.fillText(txt, 0, 0);

				context.rotate(-deg);
				context.translate(-x, -y);
			}
			for (var i = 0; i <= 30; i++) { //验证码上显示小点
				context.strokeStyle = randomColor();
				context.beginPath();
				var x = Math.random() * canvas_width;
				var y = Math.random() * canvas_height;
				context.moveTo(x, y);
				context.lineTo(x + 1, y + 1);
				context.stroke();
			}
		}

		function randomColor() { //得到随机的颜色值
			var r = Math.floor(Math.random() * 256);
			var g = Math.floor(Math.random() * 256);
			var b = Math.floor(Math.random() * 256);
			return "rgb(" + r + "," + g + "," + b + ")";
		}
	</script>

</body>

</html>