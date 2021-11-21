<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/14
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .form-control {
            width: 250px;
        }

        .col-sm-2 {
            width: 150px;
            text-align: center;
        }
    </style>
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
            <a class="navbar-brand">IJob-管理员</a>
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
                <li id="hoverLi3" class="ShowUserInfo"><a>|当前在线状态|</a></li>
            </ul>
        </div>
    </div>
</nav>
<br><br>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改用户</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/updateUser" method="post">
        <input type="hidden" name="userId" value="${user.userId}">
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-8">
                <input type="text" name="userName" class="form-control" value="${user.userName}">
                <span class="help-block"></span>
            </div>
        </div>
        <br><br><br>

        <div class="form-group">
            <label class="col-sm-2 control-label">用户密码</label>
            <div class="col-sm-8">
                <input type="text" name="userPassword" class="form-control" value="${user.userPassword}">
                <span class="help-block"></span>
            </div>
        </div>
        <br><br><br>

        <div class="form-group">
            <label class="col-sm-2 control-label">用户邮箱</label>
            <div class="col-sm-8">
                <input type="email" name="userEmail" class="form-control" value="${user.userEmail}">
                <span class="help-block"></span>
            </div>
        </div>
        <br><br><br>
        <div class="form-group">
            <label class="col-sm-2 control-label">当前用户权限：</label>
            <div class="col-sm-8">
                <span style="color: red">${user.userPrivileges}</span>
            </div>
        </div>
        <br><br><br>
        <div class="form-group">
            <label class="col-sm-2 control-label">用户权限修改为：</label>
            <div class="col-sm-8">
                <label class="radio-inline">
                    <input type="radio" name="userPrivileges" id="userPrivileges" value="管理员" checked>管理员
                </label>
                <label class="radio-inline">
                    <input type="radio" name="userPrivileges" value="委托员">委托员
                </label>
                <label class="radio-inline">
                    <input type="radio" name="userPrivileges" value="申请人">申请人
                </label>
            </div>
        </div>

        <br><br><br>
        <div style="margin-left: 150px">
            <input type="submit" class="btn btn-default" value="修改">
        </div>
    </form>

</div>
</body>
</html>
