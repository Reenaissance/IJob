<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/14
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增用户</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js" type="text/javascript"
            charset="utf-8"></script>
    <link href="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .form-control {
            width: 200px;
        }

        .col-sm-2 {
            width: 100px;
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
                <h1>
                    <small>新增用户</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="modal-body">
        <form action="${pageContext.request.contextPath}/addUser" method="post">
            <div class="form-group">
                <label class="col-sm-2 control-label">用户ID</label>
                <div class="col-sm-8">
                    <input type="text" name="userId" class="form-control" placeholder="请输入用户ID">
                    <span class="help-block"></span>
                </div>
            </div>
            <br><br><br>
            <div class="form-group">
                <label class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-8">
                    <input type="text" name="userName" class="form-control" placeholder="请输入用户名">
                    <span style="color: red">${errorName}</span>
                </div>
            </div>
            <br><br><br>

            <div class="form-group">
                <label class="col-sm-2 control-label">用户密码</label>
                <div class="col-sm-8">
                    <input type="text" name="userPassword" class="form-control" placeholder="请输入用户密码">
                    <span class="help-block"></span>
                </div>
            </div>
            <br><br><br>

            <div class="form-group">
                <label class="col-sm-2 control-label">用户邮箱</label>
                <div class="col-sm-8">
                    <input type="email" name="userEmail" class="form-control" placeholder="请输入用户邮箱">
                    <span class="help-block"></span>
                </div>
            </div>
            <br><br><br>

            <div class="form-group">
                <label class="col-sm-2 control-label">用户权限</label>
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
                <input type="submit" class="btn btn-default" value="添加">
            </div>
        </form>

    </div>
</div>
</body>
</html>
