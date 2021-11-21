<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/14
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" >IJob-管理员</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/allUser">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/allCourse">课程管理</a></li>

            </ul>
            <%--            <%=session.getAttribute("userName")%>--%>
            <ul class="nav navbar-nav navbar-right">
                <li id="hoverLi1"><a href="#">管理员:${sessionScope.userName}</a></li>
                <li id="hoverLi2">
                    <a href="${pageContext.request.contextPath}/logout.action">|退出|</a>
                </li>
                <li id="hoverLi3" class="ShowUserInfo"><a >|当前在线状态|</a></li>
            </ul>
        </div>
    </div>
</nav>
<br><br>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <small>用户列表--显示所有用户</small>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/toAddUser">新增用户</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/allUser">显示所有用户</a>
        </div>
        <div class="col-md-4 column"></div>
        <div class="col-md-4 column">
            <form class="form-inline" action="${pageContext.request.contextPath}/queryUserByName" method="post">
                <span style="color: red">${error}</span>
                <label>
                    <input type="text" name="userName" placeholder="请输入要查询的用户名称" class="form-control">
                </label>
                <input type="submit" class="btn btn-primary" value="查询">
            </form>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>用户账号</th>
                    <th>用户名</th>
                    <th>用户密码</th>
                    <th>用户邮箱</th>
                    <th>用户权限</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="user" >
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.userPassword}</td>
                        <td>${user.userEmail}</td>
                        <td>${user.userPrivileges}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/toUpdateUser?id=${user.userId}">修改</a>  &nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/deleteUser/${user.userId}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
