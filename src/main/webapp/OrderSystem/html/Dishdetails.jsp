<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	session.setAttribute("basePath", basePath);
	%>
		
		<meta charset="utf-8">
		<title>商品详情</title>
		
			<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
			   
			    <script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
				<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
					<script src="https://unpkg.com/element-ui/lib/index.js"></script>
					 <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	</head>
	<body>
		
	<div id="app">
		<h2>商品详情</h2>
		<div class="main" >
			<div class="bgimg">
				<img :src="item.dishs_icon">
			</div>
			<div class="message">
				<span class="dish-id">
					<span>菜品ID：</span><span>{{item.dishs_id}}</span>
				</span>
				<span class="dish-name">
					<span>名称：</span><span>{{item.dishs_name}}</span>
				</span>
				<span class="dish-cate">
					<span>种类:</span><span>{{item.dishs_cate}}</span>
				</span>
				<span class="dish-price" style="color: red;">
					<span>单价(￥):</span><span>{{item.price}}</span>
				</span>
				<span class="dish-size">
				   <span> 规格：</span><span>{{item.size}}</span>
				</span>
				<span class="dish-taste">
					<span>口味：</span><span>{{item.taste}}</span>
				</span>
				<span  class="from">
					<span>来源：</span><span>{{item.supplier}}</span>
				</span>
			</div>
			<div class="detailIntro">
				<div class="intros_box">
				<p class="intros">~~{{item.introduce_detail}}~~</p>
				</div>
				<div class="addcar" @click="addcar">
					~~就选你了~~
				</div>
			</div>
		</div>		
	</div>
	</body>
	<script type="text/javascript">
			var app =new Vue({
				el:"#app",
				data:{
					item:{},
					
					
				},
				methods:{
					addcar:function(){
								var item4=app.item	
								var fuwu=GetQueryString("fuwu")
											  if (localStorage.getItem("user")!=null){
												    var needAdd={dishs_id:item4.dishs_id,dishs_name:item4.dishs_name,number:1,price:item4.price,cook_state:1,order_id:'',total:'',user_id:fuwu,tableNumber:''}
												      if (localStorage.getItem("shoppingthings")!=null){
												           var getvalue=localStorage.getItem("shoppingthings")
												           var getitem=window.JSON.parse(getvalue)
												           var flag=0
												  		
												           for (var it of getitem){
												              if (it.dishs_id==needAdd.dishs_id){
												                it.number+=needAdd.number
												                  flag=1
												                  break
												              }
												           }
												           if (flag==0){
												             getitem.splice(0,0,needAdd)
												           }
												           var newget=window.JSON.stringify(getitem);
												           localStorage.setItem("shoppingthings",newget)
												  								   
												        }
												        else{
												         var All=[]
												             All.splice(0,0,needAdd)
												             var newget1=window.JSON.stringify(All); 
												               localStorage.setItem("shoppingthings",newget1)  
												  									   
												        }
														alert("点餐成功！")
											  }
											  else{
												  alert("请选择桌号！")
												  return 
											  }
					
													
					     }	
					
				}
		
		
		
	});	
		
	</script>
			
	<script type="text/javascript">
		function GetQueryString(name)
		{
		     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		     var r = window.location.search.substr(1).match(reg);//search,查询？后面的参数，并匹配正则
		     if(r!=null)return  unescape(r[2]); return null;
		}
	
	window.onload=function(){
		  var id=GetQueryString("id")
		  if(id==null){
			  window.location.href="skproject.html"
			  return
		  }
		 axios.post('${basePath}getDetail.do',{"id":id}).then(res=>{
				             app.item=res.data 
							console.log(app.item)
					})
								.catch((error)=>{
				  				console.log(error)  //  错误处理 相当于error
				          })
	}
	
	</script>
	
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
		}
		body{
			background-color:  #FFC300;
		}
		#app{
			box-shadow: 0 2px 12px 0;
			border-radius: 5%;
			width: 50%;
			background-color: rgb(242,247,252);
			margin: 0 auto;
			margin-top: 100px;
			padding-bottom: 50px;
		}
		#app h2{
			text-align: center;
		}
		#app>h2{
			font-family: skfont;
			font-size: 30px;
			position: relative;
			bottom:50px;
		}
		@font-face {
			font-family:skfont;
			src: url(<%=path %>/OrderSystem/skWaiterHomePage/font/AaMuMaTi-2.ttf);
		}
		@font-face {
			font-family:skfont2;
			src: url(<%=path %>/OrderSystem/skWaiterHomePage/font/sk.ttf);
		}
		@font-face {
			font-family:skfont3;
			src: url(<%=path %>/OrderSystem/skWaiterHomePage/font/sk2.ttf);
		}
		
		.main{
			width: 45vw;
			height: 60vh;
			margin: 0 auto;
			background-color: white;
			display: flex;
			flex-direction: row;
			flex-wrap: wrap;
			
		}
		
		.addcar:hover{
			cursor:pointer;
			background-color: red;
		}
		.message{
			width: 50%;
			height: 60%;
			
			display: flex;
			flex-direction: column;
			justify-content: space-around;
		}
		.message span{
			font-size: 21px;
			width: 60%;
			margin-left: 5%;
			display: flex;
			
		}
		.message>span{
			font-family: skfont2;
			color: #999999;
		}
		.message>span span{
			text-align: start;
			display: block;
			margin-left: 10%;
			font-size: 0.8em;
			text-overflow: ellipsis;
			
		}
		.bgimg{
			width: 50%;
			height: 60%;
			
			
		}
		.bgimg img{
			width: 100%;
			height: 100%;
		}
		.detailIntro{
			height: 40%;
			width: 100%;
			
		}
		.intros_box{
			width: 100%;
			height: 60%;
			text-align: center;
			padding-top: 30px;
			box-sizing: border-box;
			font-size: 20px;
			font-family: skfont3;
		}
		.addcar{
			width: 100%;
			height: 40%;
			background-color: #008AD3;
			text-align: center;
			line-height: 270%;
			font-size: 30px;
			font-family: skfont3;
		}
	</style>
	
</html>