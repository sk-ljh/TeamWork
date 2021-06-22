<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.util.* ,com.our.pojo.User_details"
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <a href="/TeamWork/user/index.do">index.do...</a> -->
	<%
		List<User_details> userDetailsList = (List<User_details>)session.getAttribute("userDetailsList");
		
		for(User_details userDetails:userDetailsList){
	%>
		<div>
			<%=userDetails %>
		</div>
	
	<%
		}
	%>
	
</body>
</html>