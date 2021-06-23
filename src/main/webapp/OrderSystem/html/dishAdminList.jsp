<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.our.pojo.*"%>
<html>

<head>
<meta charset="utf-8">
<title>菜单列表</title>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/adminHomepage.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/alterSelfInf.jsp">个人信息修改</a>
		</li>
		<li class="layui-nav-item  layui-this"><a href="javascript:;">菜品管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="<%=path %>/OrderSystem/html/insertDish.jsp">添加菜品</a>
				</dd>
				<dd>
					<a href="<%=path %>/Dish/listDishsAll.do">更改菜品信息</a>
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
		<form class="search layui-form" action="<%=path %>/Dish/listDishsByKey.do"
			style="position: relative; left: 62%">
			<input lay-verify="required" lay-reqtext="请输入关键字！" type="text"
				name="dishKey"
				style="border-radius: 1.5em; height: 32px; width: 35%;"
				autocomplete="off" placeholder="输入关键字查询菜品" class="layui-input" />
			<button class="layui-btn" type="submit" lay-submit=""
				style="height: 28px; line-height: 28px; position: relative; left: 31.3%; top: -29.6px;">搜索</button>
		</form>
	</ul>
	<div class="dishAdminListMainBody">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>菜品管理列表</legend>
		</fieldset>
		<div class="layui-form">
				<c:if test="${dishs==null}">
					<jsp:forward page="test/AdminList.do"/>
				</c:if>
				<c:if test="${dishs[0]==null}">
					<div class="book"><p>未找到目标！</p></div>
				</c:if>
				<c:if test="${dishs[0]!=null}">
				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr class="title">
							<th>编号</th>
							<th>菜品</th>
							<th>简介</th>
							<th>是否推荐</th>
							<th>单价（元）</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="dish" items="${dishs}">
						<tr class="dishForm site-demo-flow" id="lazy_flow">
							<td>${dish.dishs_id}</td>
							<td>
								<c:if test="${dish.dishs_delete==1}">
									<a href="<%=path %>/OrderSystem/html/dishDetail.jsp">
										<div title="${dish.dishs_name}（点击查看菜品详情）" class="removed" style="font-size:1.5em;color:white;position:absolute;top:50%;transform:translateY(-54%);width:250px;height:250px;background-color: rgba(145, 145, 145,0.7);;text-align:center;line-height:250px;">
											已&nbsp&nbsp下&nbsp&nbsp架
										</div>
									</a>
								</c:if>
								<a href="<%=path %>/OrderSystem/html/dishDetail.jsp">
									<img title="${dish.dishs_name}（点击查看菜品详情）" src="${dish.dishs_icon}" style="max-width:300px;width: 250px; height: 250px">
								</a>
								<a title="查看菜品详情" href="<%=path %>/OrderSystem/html/dishDetail.jsp">${dish.dishs_name}</a>
							</td>
							<td>${dish.introduction}</td>
							<td>
								<c:if test="${dish.recommend==1}">
									是
								</c:if>
								<c:if test="${dish.recommend==0}">
									否
								</c:if>
							</td>
							<td>￥${dish.price}</td>
							<td><a href="alterDishInf.jsp"><button title="修改菜品信息" type="button" class="layui-btn layui-btn-warm">修改</button></a>
								<c:if test="${dish.dishs_delete==0}">
									<button title="下架此菜品" type="button" class="layui-btn layui-btn-warm">下架</button></td>
								</c:if>
								<c:if test="${dish.dishs_delete==1}">
									<button title="重新上架此菜品" type="button" style="font-size:0.6em !important" class="layui-btn layui-btn-warm">重新上架</button></td>
								</c:if>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</c:if>
		</div>
		<div id="pages" style="text-align: center;"></div>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>

	<script language="javascript">
        layui.use('element', function () {
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function (elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });
        function deleteOrder() {
            alert("删除成功！");
            return false; //阻止表单默认提交
        }
        layui.use(['laypage', 'layer'], function () {
            var laypage = layui.laypage,
                layer = layui.layer;
            laypage.render({
                elem: 'pages',
                count: 100,
                theme: '#FFB800',
                first: '首页',
                last: '尾页',
                prev: '<em>←</em>',
                next: '<em>→</em>'
            });
        });
        layui.use('flow', function(){
			  var flow = layui.flow;	  
			  //图片懒加载
			  flow.lazyimg({
			    elem: '#lazy_flow>td>a>img'
			    ,scrollElem: '#lazy_flow'
			  });
			  
			});
        
    </script>
</body>

</html>