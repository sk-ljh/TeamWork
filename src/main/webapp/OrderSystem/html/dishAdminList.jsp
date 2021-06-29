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
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String basePort=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+"/file/";
	session.setAttribute("basePath", basePath);
	session.setAttribute("basePort", basePort);
	%>
<link rel="stylesheet" href="<%=path %>/OrderSystem/font-awesome-4.7.0/css/font-awesome.min.css">
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
					<a href="<%=path%>/user/getUserList.do">更改用户信息</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/operateOrderForm.jsp">订单管理</a></li>
		<li class="layui-nav-item"><a href="<%=path %>/OrderSystem/html/releaseNotice.jsp">发布公告</a></li>
		<li class="layui-nav-item"><a href="javascript:;">注销</a></li>
		<form class="search layui-form" action="<%=path %>/Dish/listDishsByKey.do?currentDish_Page=1"
			style="position: relative; left: 62%;width:80%">
			<input lay-verify="required" lay-reqtext="请输入关键字！" type="text"
				name="dishKey"
				style="border-radius: 1.5em; height: 32px; width: 35%;"
				autocomplete="off" placeholder="输入关键字查询菜品" class="layui-input" />
			<button class="layui-btn" type="submit" lay-submit=""
				style="height: 28px; line-height: 28px; position: absolute; width:6%;left: 28.8%; top: 6.5%;">搜索</button>
		</form>
	</ul>
	<div class="dishCategories" id="dishCategories">
		<ul>
			<li><a href="<%=path %>/Dish/listDishsAll.do?currentDish_Page=1">全部</a></li>
			<li><a href="<%=path %>/Dish/listDishsByCategory.do?category=美味闷锅&currentDish_Page=1">美味闷锅</a></li>
			<li><a href="<%=path %>/Dish/listDishsByCategory.do?category=热乎炒菜&currentDish_Page=1">热乎炒菜</a></li>
			<li><a href="<%=path %>/Dish/listDishsByCategory.do?category=湘菜系谱&currentDish_Page=1">湘菜系谱</a></li>
			<li><a href="<%=path %>/Dish/listDishsByCategory.do?category=经典水煮&currentDish_Page=1">经典水煮</a></li>
			<li><a href="<%=path %>/Dish/listDishsByCategory.do?category=飘香煮菜&currentDish_Page=1">飘香煮菜</a></li>
			<li><a href="<%=path %>/Dish/listDishsByCategory.do?category=可口煎菜&currentDish_Page=1">可口煎菜</a></li>
			<li><a href="<%=path %>/Dish/listDishsByCategory.do?category=开胃炸菜&currentDish_Page=1">开胃炸菜</a></li>
			<li><a href="<%=path %>/Dish/listDishsByCategory.do?category=软烂炖菜&currentDish_Page=1">软烂炖菜</a></li>
			<li><a href="<%=path %>/Dish/listDishsByCategory.do?category=浓香蒸菜&currentDish_Page=1">浓香蒸菜</a></li>
			<li><a href="<%=path %>/Dish/listDishsByCategory.do?category=其它&currentDish_Page=1">其它</a></li>
		</ul>
		<a href="javascript:;">
			<div id="cate_handle">
				&nbsp
				<i title="查看菜品分类" class="fa fa-chevron-circle-right fa-3x" aria-hidden="true"></i>
			</div>
		</a>
	</div>
	<div class="dishAdminListMainBody">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>菜品管理列表</legend>
		</fieldset>
		<div class="layui-form">
				<c:if test="${dishs==null}">
					<jsp:forward page="Dish/listDishsAll.do"/>
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
									<a href="<%=path %>/dishDetail/showDishInf.do?dishId=${dish.dishs_id}">
										<div title="${dish.dishs_name}（已下架）（点击查看菜品详情）" class="removed" style="z-index:999;font-size:1.5em;font-weight:550;color:white;position:absolute;top:50%;transform:translateY(-54%);width:250px;height:250px;background-color: rgba(145, 145, 145,0.7);text-align:center;line-height:250px;">
											已&nbsp&nbsp&nbsp下&nbsp&nbsp&nbsp架
										</div>
									</a>
								</c:if>
								<a href="<%=path %>/dishDetail/showDishInf.do?dishId=${dish.dishs_id}">
									<img title="${dish.dishs_name}（点击查看菜品详情）" src="${dish.dishs_icon}" style="max-width:300px;width: 250px; height: 250px">
								</a>
								<a title="查看菜品详情" href="<%=path %>/dishDetail/showDishInf.do?dishId=${dish.dishs_id}">${dish.dishs_name}</a>
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
							<td><a href="<%=path %>/dishDetail/showDishInf.do?alter=true&dishId=${dish.dishs_id}"><button title="修改菜品信息" type="button" class="layui-btn layui-btn-warm">修改</button></a>
								<c:if test="${dish.dishs_delete==0}">
									<button title="下架此菜品" data-name=${dish.dishs_name} data-id=${dish.dishs_id} type="button" class="layui-btn toRemove layui-btn-warm">下架</button></td>
								</c:if>
								<c:if test="${dish.dishs_delete==1}">
									<button title="重新上架此菜品" data-name=${dish.dishs_name} data-id=${dish.dishs_id} type="button" style="font-size:0.4em !important" class="layui-btn toRestore layui-btn-warm">上架</button></td>
								</c:if>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</c:if>
		</div>
		<c:if test="${DishQueriedNumber>0}">
			<div id="pages" style="text-align: center;"></div>
		</c:if>
	</div>
	<script src="<%=path %>/OrderSystem/js/layui.js"></script>

	<script language="javascript">
		var dishCategories=document.querySelector("#dishCategories");
		var handle=document.querySelector("#cate_handle");
	    var selectedCategory="<%=session.getAttribute("selectedCategory")%>";
	 	var categories=document.querySelectorAll(".dishCategories>ul>li");
	 	var a=document.querySelectorAll(".dishCategories>ul a");
	    if(selectedCategory!=null){
  			for(let i=0;i<categories.length;i++){
	    		if(selectedCategory==a[i].innerText)
	    			categories[i].classList.add("selected");
	    		else categories[i].classList.remove("selected");
	    	}
	    }
	    else categories[0].classList.add("selected");
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
            var laypage = layui.laypage,layer = layui.layer;
            var $ = layui.jquery;
            laypage.render({
                elem: 'pages',
                count: ${DishQueriedNumber},
                theme: '#FFB800',
                limit: 4,
                first: '首页',
                last: '尾页',
                curr: ${currentDish_Page},
                prev: '<em>←</em>',
                next: '<em>→</em>',
                jump: function (obj, first) {
	                if (!first) {
	                	var dishKey="<%=session.getAttribute("dishKey")%>"; 
	                	if(dishKey!="null"){
							window.location.href="<%=path %>/Dish/listDishsByKey.do?dishKey=${dishKey}&currentDish_Page="+obj.curr;
						}
						else if(selectedCategory=="全部"){
							window.location.href="<%=path %>/Dish/listDishsAll.do?currentDish_Page="+obj.curr;
	                	}
	                	else {
	                		window.location.href="<%=path %>/Dish/listDishsByCategory.do?category="+selectedCategory+"&currentDish_Page="+obj.curr;
	                	}
	                }
            	}
            });
            $('.toRemove').on('click', function(){
			    var othis = $(this);
			    layer.open({
				       content:'确定要下架该菜品吗？',
				       title:false,
				       skin:'layui-layer-Orange',
				       icon:3,
				       shade: [0.8, 'rgb(77, 77, 77)'],
				       shadeClose:true,
				       shift:6,
				       time: 20000,
				       btn: ['确定','取消'],
				       offset:'300px',
				       btn1:function(index){
				       		layer.msg('成功下架菜品：'+othis.data('name')+'!', {
					       		icon: 1,
					       		time:1000,
					       		offset:['50px','900px'],
					       		end:function () {
					        		window.location.href="<%=path %>/Dish/removeDish.do?dishId="+othis.data('id');	
         						}
					       	});	
						   	layer.close(index);
					   }
				});  
			});
            $('.toRestore').on('click', function(){
			    var othis = $(this);
			    layer.open({
				       content:'确定要重新上架该菜品吗？',
				       title:false,
				       skin:'layui-layer-Orange',
				       icon:3,
				       shade: [0.8, 'rgb(77, 77, 77)'],
				       shadeClose:true,
				       shift:6,
				       time: 20000,
				       btn: ['确定','取消'],
				       offset:'300px',
				       btn1:function(index){
				       		layer.msg('已重新上架菜品：'+othis.data('name')+'!', {
					       		icon: 1,
					       		time:1000,
					       		offset:['50px','900px'],
					       		end:function () {
					        		window.location.href="<%=path %>/Dish/restoreDish.do?dishId="+othis.data('id');	
         						}
					       	});		
					   },
				});  
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
		handle.onmouseover=function(){
			dishCategories.classList.remove("moveL");
			dishCategories.classList.add("moveR");
		}
		dishCategories.addEventListener("mouseleave",function(){
			dishCategories.classList.remove("moveR");
			dishCategories.classList.add("moveL");
		})
 
    </script>
</body>

</html>