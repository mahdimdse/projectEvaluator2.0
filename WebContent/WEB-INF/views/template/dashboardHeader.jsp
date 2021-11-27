<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><% String title = (String)request.getAttribute("title"); %><%= title %></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard_style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/toastr.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" />
<link rel="stylesheet" href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
<%@ page import="java.text.*" %> 
</head>
<body>
<%
 String firstName = (String)session.getAttribute("first_name");
 String lastName = (String)session.getAttribute("last_name");
 String role_id = (String)session.getAttribute("role_id");
 String user_id = (String)session.getAttribute("user_id");
 %>
 
 <div id="preloader">
 <svg class="pl" viewBox="0 0 200 200" width="200" height="200" xmlns="http://www.w3.org/2000/svg">
	<defs>
		<linearGradient id="pl-grad1" x1="1" y1="0.5" x2="0" y2="0.5">
			<stop offset="0%" stop-color="hsl(313,90%,55%)" />
			<stop offset="100%" stop-color="hsl(223,90%,55%)" />
		</linearGradient>
		<linearGradient id="pl-grad2" x1="0" y1="0" x2="0" y2="1">
			<stop offset="0%" stop-color="hsl(313,90%,55%)" />
			<stop offset="100%" stop-color="hsl(223,90%,55%)" />
		</linearGradient>
	</defs>
	<circle class="pl__ring" cx="100" cy="100" r="82" fill="none" stroke="url(#pl-grad1)" stroke-width="36" stroke-dasharray="0 257 1 257" stroke-dashoffset="0.01" stroke-linecap="round" transform="rotate(-90,100,100)" />
	<line class="pl__ball" stroke="url(#pl-grad2)" x1="100" y1="18" x2="100.01" y2="182" stroke-width="36" stroke-dasharray="1 165" stroke-linecap="round" />
</svg>
 </div>