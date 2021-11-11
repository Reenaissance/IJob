<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/10/27
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理员</title>

    <link rel="stylesheet" type="text/css" href="css/admin/admin.css"/>
    <script type="text/javascript" src="js/admin/admin.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/vue.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/admin.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body class="bg-primary">
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" >在线教育平台-管理员-日志浏览</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="admin">用户管理</a></li>
                <li><a href="admin_course">课程管理</a></li>
                <li class="active"><a href="admin_log">操作日志</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li id="hoverLi1"><a href="./register">|注册|</a></li>
                <li id="hoverLi2"><a href="#">|退出|</a> </li>
                <li id="hoverLi3" class="ShowUserInfo"><a >|当前在线状态|</a></li>
            </ul>
        </div>
    </div>
</nav>

<div id="UserInfo">
    <p>用户类型：<%=session.getAttribute("userPrivileges")%></p>
    <p>用户账号：<%=session.getAttribute("userId")%></p>
    <p>用户名：<%=session.getAttribute("userName")%></p>
</div>

</body>

</html>
