<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>IJob - 注册页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/vue.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css"/>

</head>
<body class="bg-primary">
<nav class="navbar navbar-default navbar-fixed-top"
     role="navigation">
    <div class="container-fluid">
        <div class="navbar-header  ">
            <p class="navbar-text">IJob - 注册页面</p>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li id="hoverLi1"><a href="${pageContext.request.contextPath}/register" target="_blank">|注册|</a></li>
        </ul>
    </div>
</nav>
<div class="panel panel-primary center-block"style="width: 450px">
    <div class="panel-heading">
        <h3 class="panel-title text-center">注册面板</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/register" method="POST">
            <div class="form-group">
                <label for="userId" class="col-sm-2 col-md-2 control-label" style="width: 90px;text-align:center">账号</label>
                <div class="col-sm-10 col-md-10" style="width: 300px">
                    <input type="text" class="form-control"
                           id="userId" name="userId" placeholder="请输入账号" oninput = "value=value.replace(/[^\d]/g,'')">
                </div>
            </div>
            <div class="form-group">
                <label for="userName" class="col-sm-2 col-md-2 control-label" style="width: 90px;text-align:center" >名字</label>
                <div class="col-sm-10 col-md-10" style="width: 300px">
                    <input type="text" class="form-control"
                           id="userName" name="userName" placeholder="请输入名字">
                </div>
            </div>

            <div class="form-group">
                <label for="userPassword" class="col-sm-2 col-md-2 control-label" style="width: 90px;text-align:center">密码</label>
                <div class="col-sm-10 col-md-10" style="width: 300px">
                    <input type="text" class="form-control"
                           id="userPassword" name="userPassword" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label for="userPassword1" class="col-sm-2 col-md-2 control-label" style="width: 90px;text-align:center">重复密码</label>
                <div class="col-sm-10 col-md-10" style="width: 300px">
                    <input type="text" class="form-control"
                           id="userPassword1" name="userPassword1" placeholder="请确认密码">
                </div>
            </div>
            <div class="form-group">
                <label for="userEmail" class="col-sm-2 col-md-2 control-label" style="width: 90px;text-align:center">邮箱</label>
                <div class="col-sm-10 col-md-10" style="width: 300px">
                    <input type="text" class="form-control"
                           id="userEmail" name="userEmail" placeholder="请输入邮箱">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-md-2 control-label" style="width: 90px;text-align:center">账号类型</label>
                <div class="col-sm-10 col-md-10" align="center" >
                    <label class="radio-inline"style="width: 100px">
                        <input type="radio" name="userPrivileges" value="委托员" >委托员
                    </label>
                    <label class="radio-inline" style="width: 100px">
                        <input type="radio" name="userPrivileges" value="申请人">申请人
                    </label>
                </div>
            </div>
            <div class="form-group" align="center">
                <button type="submit" class="btn btn-success btn-block" style="width: 100px">注册账号</button>
                <h5 class="text-center" style="color: red">${requestScope.registerMessage}</h5>
            </div>
        </form>
    </div>
    <div class="panel-footer" >
        <h5 >注册说明1：表单不能有空值</h5>
        <h5 >注册说明2：账号：11位的纯数字</h5>
        <h5 >注册说明3：密码：字母开头，长度在9~20之间，只能包含字母、数字和下划线</h5>
        <h5 >注册说明4：邮箱地址必须包含@字符、 邮箱@的右边必须有 . 点号</h5>
        <h5 >注册说明5：注册成功后，会直接登录系统</h5>

    </div>
</div>
</body>

</html>