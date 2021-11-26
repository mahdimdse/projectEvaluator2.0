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