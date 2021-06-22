<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Live2D</title>
    <% String path = request.getContextPath();%>
    <link rel="stylesheet" type="text/css" href="<%=path %>/OrderSystem/skWaiterHomePage/assets/waifu.css"/>
 <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
     <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
     <script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
 
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	 <link rel="stylesheet" type="text/css" href="<%=path %>/OrderSystem/skWaiterHomePage/assets/waifu.css">
	 <link rel="stylesheet" type="text/css" href="<%=path %>/OrderSystem/skWaiterHomePage/assets/flat-ui.min.css"/>
	 <!--  <link rel="shortcut icon" href="../favicon.ico">-->
	 <link rel="stylesheet" type="text/css" href="<%=path %>/OrderSystem/skWaiterHomePage/css/demo.css" />
	 <link rel="stylesheet" type="text/css" href="<%=path %>/OrderSystem/skWaiterHomePage/css/diancai.css"/>
	 <script type="text/javascript" src="js/modernizr.custom.26887.js"></script> 
	<link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">
	 <noscript>
	 	<link rel="stylesheet" type="text/css" href="<%=path %>/OrderSystem/skWaiterHomePage/css/noscript.css" />
	 </noscript>
</head>
<body>
	<div class="menuHolder">
		<div class="menuWindow">
			<ul class="p1">
				<li class="s1"><a href="#" style="font-size: 18px;">点餐</a>
					<ul class="p2">
						<li class="s2"><a href="#"><span>就餐区一</span></a>
							<ul class="p3 a3">
								<li><a href="#">1号桌</a></li>
								<li><a href="#">2号桌</a></li>
								<li><a href="#">3号桌</a></li>
							</ul>	
						</li>
						<li class="s2"><a href="#"><span>就餐区二</span></a>
							<ul class="p3 a3">
								<li><a href="#">4号桌</a></li>
								<li><a href="#">5号桌</a></li>
								<li><a href="#">6号桌</a></li>
							</ul>
						</li>
						<li class="s2"><a href="#"><span>就餐区三</span></a>
							<ul class="p3 a6">
								<li><a href="#">7号桌</a></li>
								<li><a href="#">8号桌</a></li>
								<li><a href="#">9号桌</a></li>
								<li><a href="#">10号桌</a></li>
								<li><a href="#">11号桌</a></li>
								<li><a href="#">12号桌</a></li>
							</ul>
						</li>
						<li class="s2"><a href="#"><span>就餐区四</span></a>
							<ul class="p3 a3">
								<li><a href="#">13号桌</a></li>
								<li><a href="#">14号桌</a></li>
								<li><a href="#">15号桌</a></li>
							</ul>
						</li>
						<li class="s2"><a href="#"><span>就餐区五</span></a>
							<ul class="p3 a3">
								<li><a href="#">16号桌</a></li>
								<li><a href="#">17号桌</a></li>
								<li><a href="#">18号桌</a></li>
							</ul>
						</li>
						<li class="s2 b6"><a href="#"><span>就餐区六</span></a>
							<ul class="p3 a5">
								<li><a href="#">19号桌</a></li>
								<li><a href="#">20号桌</a></li>
								<li><a href="#">21号桌</a></li>
								<li><a href="#">22号桌</a></li>
								<li><a href="#">23号桌</a></li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
<div class="skdaohang">
<ul class="layui-nav" lay-bar="disabled">
	<li class="layui-nav-item">
	  <a href="">菜品<span class="layui-badge"></span></a>
	</li>
  <li class="layui-nav-item">
    <a href="">查看订单<span class="layui-badge">9</span></a>
  </li>
  <li class="layui-nav-item">
    <a href="">查看公告<span class="layui-badge-dot"></span></a>
  </li>
  <li class="layui-nav-item">
    <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
    <dl class="layui-nav-child">
      <dd><a href="javascript:;">修改信息</a></dd>
      <dd><a href="javascript:;">安全管理</a></dd>
      <dd><a href="javascript:;">退出</a></dd>
    </dl>
  </li>
</ul>
</div>
	<div class="head-bg">
		
	</div>
	<div class="welcome" id="welcome">
		<h1 class="Welcome_w">欢迎点餐</h1>
		<h2 class="Welcome_t">Team Work</h2>
	</div>
	<div class="dishs_lunbo">
		
		<div class="layui-carousel" id="test1">
			<div class="intro">
					<p>餐厅里每一个角落都是经过精心布置的，漂亮的灯具，温暖的抱枕，让在这儿进餐的人完
			全不会有西餐厅的拘束感。</p>
					</div>
		  <div carousel-item>
		    <div class="lunbo-item">
				<img class="b" src="<%=path %>/OrderSystem/skWaiterHomePage/images/lunbo1.jpg" >
				<img class="m" src="<%=path %>/OrderSystem/skWaiterHomePage/images/lunbo2.jpg" >
				<img class="d" src="<%=path %>/OrderSystem/skWaiterHomePage/images/lunbo3.jpg" >
			</div>
		    <div class="lunbo-item">
				
				<img class="b" src="<%=path %>/OrderSystem/skWaiterHomePage/images/lunbo2.jpg" >
				<img class="m" src="<%=path %>/OrderSystem/skWaiterHomePage/images/lunbo3.jpg" >
				<img  class="d" src="<%=path %>/OrderSystem/skWaiterHomePage/images/lunbo1.jpg" >
				</div>
		    <div class="lunbo-item">
				<img  class="b" src="<%=path %>/OrderSystem/skWaiterHomePage/images/lunbo3.jpg" >
				<img class="m" src="<%=path %>/OrderSystem/skWaiterHomePage/images/lunbo1.jpg" >
				<img class="d" src="<%=path %>/OrderSystem/skWaiterHomePage/images/lunbo2.jpg" >
				</div>
		    
		  </div>
		</div>
	</div>
	<div class="dishs_dish">
		<div class="placehead">
			<h2 class="placeintro">就餐环境</h2>
		</div>
		<ul class="g2">
		<li><a class="example-image-link" href="" data-lightbox="example-set" data-title=" "><img class="example-image" src="<%=path %>/OrderSystem/skWaiterHomePage/images/place1.jpg" alt=""></a></li>
		<li><a class="example-image-link" href="" data-lightbox="example-set" data-title=" "><img class="example-image" src="<%=path %>/OrderSystem/skWaiterHomePage/images/place2.jpg" alt=""></a></li>
		<li><a class="example-image-link" href="" data-lightbox="example-set" data-title=" "><img class="example-image" src="<%=path %>/OrderSystem/skWaiterHomePage/images/place3jpg.jpg" alt=""></a></li>
		<li><a class="example-image-link" href="" data-lightbox="example-set" data-title=" "><img class="example-image" src="<%=path %>/OrderSystem/skWaiterHomePage/images/place4.jpeg" alt=""></a></li>
		
		<li><a class="example-image-link" href="" data-lightbox="example-set" data-title=" "><img class="example-image" src="<%=path %>/OrderSystem/skWaiterHomePage/images/place5.jpg" alt=""></a></li>
		<li><a class="example-image-link" href="" data-lightbox="example-set" data-title=" "><img class="example-image" src="<%=path %>/OrderSystem/skWaiterHomePage/images/place6.jpeg" alt=""></a></li>
		<li><a class="example-image-link" href="" data-lightbox="example-set" data-title=" "><img class="example-image" src="<%=path %>/OrderSystem/skWaiterHomePage/images/place7j.jpg" alt=""></a></li>
		<li><a class="example-image-link" href="" data-lightbox="example-set" data-title=" "><img class="example-image" src="<%=path %>/OrderSystem/skWaiterHomePage/images/place8.jpg" alt=""></a></li>
		</ul>
		
	</div>
	<div class="best_food">
		
			<svg t="1624201234531" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="15973" width="50" height="50"><path d="M320 620.4l387.8-109v109L320 734.2z" fill="#F1BE1A" p-id="15974"></path><path d="M791.7 130.5c-15.8-7.4-32-14.2-48.7-19.5-15.2-4.9-31.9-10.1-48.1-9.1-15.8 1-32.6 7.6-45.4 16.8-14.3 10.2-23.9 25-28.9 41.7-5.1 17.1-4.9 35.3-5.5 52.9-0.3 9.4 8.5 18.4 18 18 10-0.4 17.7-7.9 18-18 0.2-6.9 0.3-13.8 0.7-20.7 0.2-3.1 0.4-6.1 0.7-9.1 0.2-1.5 0.7-4.4 0.1-1.2l0.9-5.1c0.6-2.9 1.3-5.8 2.2-8.6l1.5-4.2c0.7-1.9-0.2 0.6-0.3 0.8 0.5-0.9 0.9-1.8 1.3-2.7 1.6-3.1 3.4-5.9 5.4-8.7 1.2-1.7 0 0.1-0.3 0.4 0.4-0.5 0.8-0.9 1.2-1.4 1.1-1.1 2.2-2.1 3.3-3.2 2.5-2.2-2 1.3 0.9-0.6 1.3-0.8 2.5-1.6 3.8-2.4 2.9-1.7 5.9-3.1 8.9-4.6 2.4-1.2-2.6 0.9 0 0 0.7-0.3 1.4-0.6 2.1-0.8 1.4-0.5 2.8-1 4.2-1.4 1.3-0.4 2.7-0.8 4.1-1.2 0.8-0.2 5.4-1.2 2.8-0.7-2.6 0.5 1.6 0 2.4 0 1.5 0 3 0 4.6 0.1 0.8 0 1.6 0.1 2.4 0.2 0.3 0 2.9 0.3 0.8 0-2.1-0.2 0.4 0.1 0.7 0.1 1 0.2 2 0.3 3 0.5 7 1.3 13.9 3.4 20.7 5.5 7.7 2.4 15.4 5.1 23 8 2.1 0.8 4.3 1.7 6.4 2.6 0.1 0 2.7 1.1 1 0.4-1.5-0.7 1.6 0.7 1.8 0.8 4 1.8 8.1 3.6 12 5.5 8.5 4 19.8 2.7 24.6-6.5 4.3-7.9 2.7-20.3-6.3-24.6zM834.7 436.2H189.2v-175h645.5v175z m-595.5-50h545.5v-75H239.2v75z" fill="#3077BC" p-id="15975"></path><path d="M771.5 311.1H248.6V190.6h522.9v120.5z m-472.9-50h422.9v-20.5H298.6v20.5zM650.9 929.1H369.1c-42.5 0-77.1-34.7-77.6-77.4l-29.3-465.5h495.7l-29.3 465.4c-0.2 20.7-8.2 40.1-22.8 54.7-14.8 14.7-34.2 22.8-54.9 22.8zM315.4 436.2L341.5 850v0.8c0 15.6 12.4 28.3 27.6 28.3h281.8c7.3 0 14.2-2.9 19.4-8.1 5.3-5.4 8.3-12.5 8.2-20.1v-0.8l0.1-0.8 26-413H315.4z" fill="#3077BC" p-id="15976"></path></svg>
			<div class="bestfood">
				<h2 class="bestfoodintro">新品推荐</h2>
				<p class="bestfoodbelow">你想要的都在这里哦！</p>
			</div>
			<svg t="1624201112872" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="9635" width="50" height="50"><path d="M416.6 928.6a256.5 31.6 0 1 0 513 0 256.5 31.6 0 1 0-513 0z" fill="#EEEEEE" p-id="9636"></path><path d="M283.7 909.7c-10.3-3.5-20.3-7.3-30.1-11.2l-166.8-354-0.9-1.9h42.2l1.9 4.4 153.7 362.7z m67.7 18.9c-8.8-2-17.5-4.1-26.1-6.4l-127-360.1c13.7 2.4 28.1 4.7 43.3 6.8l109.8 359.7z" fill="#FFE486" p-id="9637"></path><path d="M413 939.4c-8.1-1-16.2-2.2-24.2-3.5l-84.2-359.6c13.4 1.3 27.1 2.5 41.2 3.5L413 939.4z m58.8 5.2c-7.8-0.4-15.6-0.9-23.3-1.5L407 583.4c13.2 0.6 26.7 1.1 40.3 1.5l24.5 359.7z m75.9-358.9L529.5 945c-7.2 0.2-14.5 0.3-21.8 0.3h-1.3l1.1-359.5h10.8c9.9 0.1 19.7 0 29.4-0.1z m100.9-3.2l-60.7 358.7c-7.8 0.9-15.6 1.6-23.5 2.2l43.7-359c13.7-0.6 27.2-1.2 40.5-1.9z" fill="#FFDD7B" p-id="9638"></path><path d="M751.6 574.2L648.7 931.9c-8.2 1.6-16.4 3.1-24.8 4.4l86.1-358c14.3-1.3 28.2-2.6 41.6-4.1z m108.3-16.1L714.8 915.2c-9 2.8-18 5.4-27.3 7.8l128.2-357.1c15.6-2.4 30.4-5.1 44.2-7.8z" fill="#FFCF67" p-id="9639"></path><path d="M325.3 922.3c-14.2-3.8-28.1-8-41.6-12.6L129.9 546.9c19.6 5.6 42.5 10.7 68.3 15.2l127.1 360.2z" fill="#FDCD00" p-id="9640"></path><path d="M388.8 935.9c-12.7-2.1-25.2-4.5-37.5-7.2L241.6 568.9c19.9 2.7 41 5.2 63.1 7.3l84.1 359.7z m59.7 7.2c-12-0.9-23.8-2.2-35.5-3.7l-67.1-359.6c19.7 1.5 40.1 2.7 61 3.6l41.6 359.7z m59-357.2l-1.1 359.5c-11.7 0-23.2-0.3-34.6-0.8l-24.5-359.7c19.7 0.6 39.8 0.9 60.2 1z m100.6-1.6l-43.7 359c-11.5 0.9-23.1 1.5-34.8 1.8l18.2-359.3c20.4-0.3 40.6-0.8 60.3-1.5z m101.9-6.1l-86.1 358c-11.8 1.9-23.9 3.5-36.1 4.8l60.7-358.7c21.2-1 41.7-2.4 61.5-4.1z" fill="#FDB600" p-id="9641"></path><path d="M815.7 565.9L687.5 923c-12.7 3.3-25.6 6.3-38.7 8.9l102.9-357.6c22.6-2.5 44-5.3 64-8.4z m113.8-23.4l-0.9 1.9L759 899.5c-14.3 5.7-29 11-44.2 15.7L860 558.1c23.5-4.7 44.2-10 61.5-15.6h8z" fill="#FCA700" p-id="9642"></path><path d="M950.2 515.5c0 19-7.2 37.3-20.6 54.4-30.5 19.7-64.2 40.9-88.2 55.3-9.3-11.9-18.5-23.9-27.5-35.9-14.3 9.6-28.8 19-43.4 28.3-8.8 5.6-17.7 11.3-26.7 16.8-7-7.9-13.9-15.9-20.7-23.9-3.6-4.2-7.2-8.4-10.7-12.5-4.6 3-9.1 6-13.7 9-17.4 11.3-35 22.5-52.8 33.4-11.9-12.4-23.7-24.8-35.3-37.3-20.7 13.6-41.7 26.9-62.9 40.1-13.2-12.7-26.3-25.6-39.1-38.5-19.5 12.8-39.2 25.5-59.2 37.9-14.5-13.2-28.8-26.5-42.9-40-18.2 12.2-36.7 24.2-55.4 36.1-11.6-10.2-23.1-20.4-34.5-30.7-4.1-3.7-8.1-7.4-12.2-11.1-8 5.5-16.1 11-24.2 16.4-9.1 6.1-18.2 12.1-27.4 18.1-4.7-4-9.4-8-14-12-12.2-10.6-24.3-21.2-36.3-31.9-15.7 11.2-31.6 22.4-47.7 33.3-17.4-14.7-47.8-39.9-74.3-62.5-8.3-13.8-12.7-28.2-12.7-43 0-7 1-14 2.9-20.8C95.9 405.2 286.5 292 512.9 292c236.6 0 425.7 119.6 436.7 214.9 0.4 2.8 0.6 5.7 0.6 8.6z" fill="#DC7130" p-id="9643"></path><path d="M948.9 540.1c0 19-7.2 37.3-20.6 54.4-24.3 15.7-50.7 32.4-72.6 45.8-8.8 5.4-20.4 3.3-26.7-4.9-1.7-2.2-3.4-4.4-5-6.6-6.4-8.4-18.2-10.4-27.1-4.6-9.2 6-18.4 12-27.7 18-4 2.5-7.9 5.1-11.9 7.6-8.5 5.3-19.6 3.7-26.2-3.9l-9.3-10.8c0-0.1-0.1-0.1-0.1-0.2-6.1-7.1-16.4-8.5-24.2-3.5l-0.1 0.1c-12.8 8.3-25.7 16.6-38.8 24.7-8.1 5.1-18.8 3.8-25.4-3.2-4.1-4.3-8.2-8.7-12.3-13.1-6.7-7.1-17.4-8.4-25.6-3.1-11.7 7.6-23.4 15-35.3 22.4-7.9 5-18.3 3.8-25-2.7-5.4-5.3-10.8-10.6-16.1-15.9-6.8-6.7-17.2-7.8-25.2-2.6-10.7 7-21.5 13.9-32.4 20.7-7.8 4.9-17.9 3.9-24.6-2.3-6.7-6.1-13.3-12.3-19.8-18.5-6.8-6.4-17.1-7.3-24.9-2.2-9.7 6.4-19.4 12.7-29.2 19-7.6 4.9-17.6 4.1-24.4-1.9-7.7-6.8-15.4-13.7-23-20.6l-0.2-0.2c-7-6.4-17.5-7.1-25.3-1.6-6.9 4.9-14.4 10.3-20.5 14.7-7 5-16.4 5.1-23.4 0.1-9.5-6.7-22.8-16.3-33.1-24.1-7-5.4-16.7-5.6-24-0.5-7.5 5.3-15.1 10.6-22.7 15.9-7.4 5.1-17.2 4.6-24.1-1.1-17.6-14.8-41.4-34.6-62.8-52.8-8.3-13.8-12.7-28.2-12.7-43 0-7 1-14 2.9-20.8 18.5 16.1 53.7 43.5 75.5 61.4 6.5 5.4 15.7 5.9 22.9 1.4 7.9-5 15.8-9.7 23.7-14.7 7.7-4.9 17.7-4.1 24.5 2 10.5 9.4 21 18.8 31.7 28.1 4.2 3.7 10.5 4.1 15.2 1 10.4-7 20.7-14 30.9-21 7.7-5.4 18.1-4.6 25 1.8 7.8 7.2 15.6 14.3 23.5 21.4 6.9 6.2 17.1 7 24.9 1.9 9.9-6.5 19.7-13 29.4-19.5 7.9-5.3 18.3-4.4 25.1 2.1 6.6 6.3 13.2 12.6 19.9 18.9 6.8 6.4 17.2 7.3 25 2.3 11-7.1 21.9-14.2 32.7-21.4 8-5.3 18.6-4.3 25.4 2.6l16.2 16.2c6.7 6.7 17.3 7.8 25.3 2.7 12-7.7 24-15.5 35.8-23.3 8.2-5.5 19.1-4.2 25.8 3.1 4.1 4.4 8.2 8.9 12.4 13.3 6.7 7.1 17.6 8.5 25.8 3.2 12.9-8.3 25.7-16.7 38.4-25.2 8.5-5.7 19.9-4.1 26.5 3.7 2.8 3.4 5.7 6.7 8.6 10 6.6 7.7 18 9.3 26.5 3.8 13.7-8.9 27.3-17.9 40.7-27 8.8-6 20.7-4 27.1 4.5 1.8 2.4 3.7 4.8 5.5 7.3 6.2 8.1 17.5 10.2 26.2 4.8 25.8-16 60.9-38.5 83-53 0.1 3.1 0.3 6 0.3 8.9z" fill="#C65D1E" p-id="9644"></path><path d="M806.1 345.1c0 83-134.6 37.6-300.6 37.6s-300.6 45.4-300.6-37.6 134.6-150.3 300.6-150.3 300.6 67.3 300.6 150.3z" fill="#FFDA78" p-id="9645"></path><path d="M507.6 210.8c-138.9 14.8-263.5 70-282.6 140.1-0.3-2.1-0.4-4.4-0.4-6.8 0-73.7 119.5-133.5 267-133.5 5.4 0 10.7 0.1 16 0.2z" fill="#FCF1A6" p-id="9646"></path><path d="M806.1 345.1c0 83-134.6 37.6-300.6 37.6-138.2 0-254.6 31.5-289.7-5.8 59 0.9 145.1-13.3 240.9-13.3 178 0 322.2 48.7 322.2-40.3 0-22.6-9.3-44.1-26.1-63.6 33.6 24.2 53.3 53.7 53.3 85.4z" fill="#FFB73B" p-id="9647"></path><path d="M407.1 162a98.4 98.4 0 1 0 196.8 0 98.4 98.4 0 1 0-196.8 0z" fill="#FC5400" p-id="9648"></path><path d="M603.9 162c0 54.3-44 98.4-98.4 98.4-34.7 0-65.2-18-82.7-45.1 15.3 9.9 33.6 15.6 53.2 15.6 54.3 0 98.4-44 98.4-98.4 0-19.6-5.7-37.9-15.6-53.2 27.1 17.5 45.1 48 45.1 82.7z" fill="#F63B00" p-id="9649"></path><path d="M266.3 468.1c9.4 16-9.4 32.7-42 37.4s-66.7-4.6-76.1-20.6c-9.4-16 9.4-32.7 42-37.4 32.7-4.7 66.7 4.6 76.1 20.6z" fill="#FFFFFF" p-id="9650"></path><path d="M140.277 482.57a11.4 13.6 44.101 1 0 18.929-19.533 11.4 13.6 44.101 1 0-18.93 19.532zM456.9 153.5c-10.2-1.1-17.6-10.3-16.5-20.4 1.1-10.2 10.3-17.6 20.4-16.5 10.2 1.1 17.6 10.3 16.5 20.4-1 10.1-10.2 17.5-20.4 16.5z" fill="#FFFFFF" p-id="9651"></path><path d="M435.1 125.9a9.1 9.1 0 1 0 18.2 0 9.1 9.1 0 1 0-18.2 0z" fill="#FFFFFF" p-id="9652"></path></svg>
		
	</div>
	<div class="best_food_main">
		<div class="best_food_item type_one">
			<img class="best_food_img" src="<%=path %>/OrderSystem/skWaiterHomePage/images/bestone.jpg" >
			<div class="best_food_message">
				<h2 class="name">商品名</h2>
				<p class="best_goods_intro">这是一段描述的话</p>
				<div class="price">
					¥99
				</div>
				<a href="">详情></a>
			</div>
		</div>
		<div class="best_food_item type_two">
			<div class="best_food_message">
				<h2 class="name">商品名</h2>
				<p class="best_goods_intro">这是一段描述的话</p>
				<div class="price">
					¥99
				</div>
				<a href="">详情></a>
			</div>
			<img class="best_food_img" src="<%=path %>/OrderSystem/skWaiterHomePage/images/besttwo.jpg" >
			
			
		</div>
		
	</div>
	<div class="dishs_dish2">
		<div class="dish_body_head">
			<h2 class="dish_body_h2">菜品一览</h2>
		</div>
		<div class="dish_body">
			<img src="<%=path %>/OrderSystem/skWaiterHomePage/images/cate.webp">
			<div class="category" id="cate" >
				
				<div class="cate_item"  v-for="item in catedata" :key="item">
					{{item}}
				</div>
			</div>
			
			<div class="dish_body_item">
				
			</div>
			
		</div>
	</div>
 
	<div class="waifu" id="waifu">
        <div class="waifu-tips" style="opacity: 1;"></div>
        <canvas id="live2d" width="280" height="250" class="live2d"></canvas>
        <div class="waifu-tool">
            <span class="fui-home"></span>
            <span class="fui-chat"></span>
            <span class="fui-eye"></span>
            <span class="fui-user"></span>
            <span class="fui-photo"></span>
            <span class="fui-info-circle"></span>
            <span class="fui-cross"></span>
        </div>
    </div>
    
</body>

	<script type="text/javascript">
			var cate=new Vue({
				el:"#cate",
				data:{
					catedata:'',
				},
				methods:{
					getdate:function(){
						
					axios.get("http://localhost:8090/TeamWork/getCate.do").then(function(data){			
							cate.catedata=data.data.cate
							console.log(cate.catedata)
						});
					}
				}
			})
			window.onload=function(){
				cate.getdate()
			}
			 
			
		
		
		
	</script>


<script src="<%=path %>/OrderSystem/skWaiterHomePage/assets/live2d.js"></script>
    <script src="<%=path %>/OrderSystem/skWaiterHomePage/assets/waifu-tips.js"></script>
    <script type="text/javascript">initModel()</script>
	<script src="<%=path %>/OrderSystem/skWaiterHomePage/layui/layui.js"></script>
	<script>
	layui.use('carousel', function(){
	  var carousel = layui.carousel;
	  //建造实例
	  carousel.render({
	    elem: '#test1'
	    ,width: '100%'//设置容器宽度
		,height:'80%'
	    ,arrow: 'always'//始终显示箭头
		,interval:3000
	  });
	});
	</script>
	
	<style type="text/css">
		@font-face {
			font-family:skfont2;
			src: url(<%=path %>/OrderSystem/skWaiterHomePage/font/sk.ttf);
		}
		.dish_body{
			display: flex;
			margin-top: 30px;
		}
		.cate_item{
			text-shadow: #000000;
			
				background-color: rgba(255,255,255,0.1);
				text-align: center;
				max-width: 372px;
				min-width: 200px;
				display: block;
				border-radius: 6%;
				box-shadow: 0 2px 12px 0 ;
				height: 105px;
				line-height: 105px;
				font-family: skfont2;
				font-size: 20px;
				font-weight: 800px;
				margin-right: 10% ;
		}
		.cate_item:hover{
			color: red;
		}
		.category{
			margin-left: 10%;
			
			width: 80%;
			min-width: 1100px;
			height: 350px;
			background-color:white;
			
			flex-wrap: wrap;
			display: flex;
			flex-direction: row;
			justify-content:flex-start;
			
		}
		.dishs_dish2{
			height: 100vh;
			width: 100vw;
			background-color: white;
			background-size: cover;
			background-repeat: no-repeat;
			
		}
		.dish_body_h2{
			text-align: center;
			line-height: 150px;
		}
		.dish_body_head{
			height: 150px;
			width: 100%;
			background-color: #FFF9EC;
		}
		.best_food_message{
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		.best_food_item img{
			width: 46%;
			min-width: 600px;
			height: 430px;
			padding: 10px;
			
		}
		.best_food_item>div{
			width: 50%;
			min-width: 600px;
			border-bottom: solid 2px #FFC300;
		}
		
		.best_food_item{
			display: flex;
			width: 85%;
			
			margin: 0 auto;
			
			background-color: white;
			
		}
		.bestfoodbelow{
			text-align: center;
			margin-top: 10px;
			font-family: skfont2;
			font-weight: 600;
		}
		.bestfoodintro,.dish_body_h2{
			font-family: skfont;
			letter-spacing: 15px;
			    font-size: 50px;
			    font-weight: 900;
		}
		.best_food{
			display: flex;
			justify-content: space-around;
			align-items: center;
		}
		.best_food{
			height: 150px;
			width: 100%;
			background-color: rgb(250,244,233);
		}
		.placeintro{
			font-family: skfont;
			color: white;
			letter-spacing: 15px;
			font-size: 50px;
			font-weight: 900;
			text-shadow: 5px 5px 5px #000000;
		}
		.placehead{
			text-align: center;
			margin-top: 80px;
			margin-bottom: 80px;
		}
		.example-image-link{
			position: relative;
		}
		
		.example-image-link::after{
			content: "";
			width: 20vw;
			height: 21vh;
			position: absolute;
			top:-9.5vh;
			left: 0;
			background-color: rgba(0,0,0,0.5);
		}
		.example-image-link:hover.example-image-link::after{
			background-color: rgba(0,0,0,0);
		}
		
		.g2{
			
			width: 80vw ;
			display: flex;
			justify-content: center;
			align-items: center;
			flex-wrap: wrap;
			margin: 0 auto;
		}
		
		.example-image{
			
			width: 20vw;
			height: 21vh;
		}
		.dishs_dish{
			height: 80vh;
			width: 100vw;
			background-image: url(<%=path %>/OrderSystem/skWaiterHomePage/images/placebg.jpg);
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-size:cover;
			background-position-x: center;
			background-position-y: center;
		}
		.layui-nav-item{
			margin-left: 50px;
			
		}
		.skdaohang .layui-nav .layui-nav-item a{
		   font-size: 20px;
		   color: rgb(255,255,255);
		   font-weight: 900;
		}
		.skdaohang .layui-nav .layui-nav-item .layui-nav-child a{
			color: #000000;
			font-weight: 600;
		}
		.layui-nav-item:hover{
			color: red;
		}
		
		.layui-nav{
			
			background:rgba(25,12, 255, 0);
			position:fixed;
			top:0;
			right: 0;
			overflow:visible;
		}
		#myheader{
			background-color: rgb(0,0,0,1);
		}
		@font-face {
			font-family:"skfont";
			src: url('<%=path %>/OrderSystem/skWaiterHomePage/font/sk2.ttf');
		}
		body{
			display: flex;
			flex-direction: column;
			overflow-y: scroll;
			position: relative;
			background-color: white;
		}
		
		
		.lunbo-item{
			
			overflow: hidden;
			
		}
		.lunbo-item img{
			height: 100%;
			display: inline-block;
			background-repeat: no-repeat;
			
		}
		.b{
			width: 20vw;
			overflow: hidden;
			float: left;
		}
		.m{
			
			width: 50vw;
			margin-left: 5%;
			margin-right:  5%;
				
		}
		.d{
			width: 20vw;
			overflow: hidden;
			float: right;
		}
		.head-bg{
			background-image:url(<%=path %>/OrderSystem/skWaiterHomePage/images/skbg.jpg) ;
			height: 100vh; 
			width: 100vw;
			background-size: cover;
			background-repeat: no-repeat;
			background-attachment: scroll;
			background-position: center center;
			position: relative;
			z-index: -2;
			
		}
		.layui-carousel{
			overflow: hidden;
		}
		.layui-carousel:hover .intro{
			transform: translateY(-540px);
			transition: 1.5s;
		}
		.intro{
			
			position: absolute;
			left:20vw;
			top:560px;
			margin-left:5% ;
			width: 50vw;
			height: 500px;
			background-color:rgba(0,0,0,0.5);
			z-index: 100;
			text-align: center;
			box-sizing: border-box;
			padding: 20px;
			
		}
		.intro p{
			display: inline-block;
			margin-top: 40%;
			font-size: 20px;
			color: white;
			letter-spacing: 2px;
		}
		.dishs_lunbo{
			background-color: white;
			height: 700px;
			width: 100vw;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		
		.welcome{
			display: flex;
			font-family: skfont;
			justify-content: center;
			align-items: center;
			position: fixed;
			left:45%;
			top: 50%;
			
			z-index: -1;
	
		}
		.Welcome_w,.Welcome_t{
			position: relative;
			padding: 0;
			margin: 0;
			color: #FFFFFF;
			font-weight: bold;
			
		}
		.Welcome_w{
			font-size: 6rem;
			animation: 5s rotate ease-in-out infinite;
		}
		.Welcome_t{
			font-size: 3rem;
		}
		.Welcome_w::after,
		.Welcome_w::before{
			content:"欢迎点餐"; ;
		}
		.Welcome_t::after,
		.Welcome_t::before{
			content:"Team Work"; ;
		}
		
		.Welcome_w::before,
		.Welcome_w::after,
		.Welcome_t::before,
		.Welcome_t::after{
			position: absolute;
			top: 0;
			left: 0;
			z-index: -1;
			
		}
		.Welcome_w::before{
			
			
			color: #009CDE;
			animation: 5s rotateB ease-in-out infinite;
		}
		.Welcome_t::before{
			
			transform: translate3d(3px,-1px,-2px);
			color: #009CDE;
		}
		.Welcome_w::after{
			animation: 5s rotateE ease-in-out infinite;
			
			color: #003C71;
			z-index: -2;
		}
		.Welcome_t::after{
			
			transform: translate3d(5px,-2px,-2px);
			color: #003C71;
		}
		@keyframes rotate{
			0%,100%{
				transform: rotate3d(0,1,0,-20deg);
			}
			50%{
				transform: rotate3d(0,1,0,20deg);
			}
		}
		@keyframes rotateB{
			0%,100%{
				transform: translate3d(5px,-2px,-2px);
			}
			50%{
				transform: translate3d(-5px,-2px,-2px);
			}
		}
		@keyframes rotateE{
			0%,100%{
				transform: translate3d(10px,-4px,-4px);
			}
			50%{
				transform: translate3d(-10px,-4px,-4px);
			}
		}
		
	</style>
	
</html>
