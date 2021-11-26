<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><% String title = (String)request.getAttribute("title"); %><%= title %></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/toastr.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" />
</head>
<body>
<div id="particles-js">
</div>	