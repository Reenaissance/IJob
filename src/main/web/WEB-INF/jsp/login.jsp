<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/10/21
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--<head>--%>
<%--    <title>IJOb</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<table>--%>
<%--    <tr>--%>
<%--        <td><a href="index11.jsp">首页</a></td>--%>
<%--        <td><a href="/IJob/mission">委托</a></td>--%>
<%--        <td><a href="/IJob/course">教学</a></td>--%>
<%--    </tr>--%>
<%--</table>--%>
<%--</body>--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>IJob - 登录页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/vue.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>

</head>
<body class="bg-primary">
<nav class="navbar navbar-default navbar-fixed-top"
     role="navigation">
    <div class="container-fluid">
        <div class="navbar-header  ">
            <p class="navbar-text">IJob - 登录页面</p>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li id="hoverLi1"><a href="${pageContext.request.contextPath}/register" target="_blank">|注册|</a></li>
        </ul>
    </div>
</nav>
<div class="panel panel-primary center-block" style="width: 400px">
    <div class="panel-heading">
        <h3 class="panel-title text-center">登录面板</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" role="form" action="login" method="post">
            <div class="form-group">
                <label for="userId" class="col-sm-2 col-md-2 control-label">账号</label>
                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control"
                           id="userId" name="userId" placeholder="请输入账号">
                </div>
            </div>

            <div class="form-group">
                <label for="userPassword" class="col-sm-2 col-md-2 control-label">密码</label>
                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control"
                           id="userPassword" name="userPassword" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label for="userPrivileges" class="col-sm-2 col-md-2 control-label" style="width: 90px;">账号类型</label>
                <div class="col-sm-10 col-md-10" align="center">
                    <label class="radio-inline">
                        <input type="radio" name="userPrivileges" id="userPrivileges" value="管理员"checked >管理员
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="userPrivileges"value="委托员">委托员
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="userPrivileges"value="申请人">申请人
                    </label>
                </div>
            </div>

            <div class="form-group" align="center">

                <button type="submit" class="btn btn-info btn-block" style="width: 100px" >登录</button>
            </div>
        </form>
    </div>
    <div class="panel-footer" >
        <h4 class="text-center" style="font-size: 10px; color: red">${requestScope.loginMessage}</h4>
    </div>
</div>
</body>
</html>
