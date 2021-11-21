<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/17
  Time: 1:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>新增委托</title>
    <link href="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增委托</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="modal-body">
        <form action="${pageContext.request.contextPath}/addMission" method="post">
            <div class="form-group">
                <label class="col-sm-2 control-label">委托ID</label>
                <div class="col-sm-8">
                    <input type="text" name="missionId" class="form-control" placeholder="请输入委托ID">
                    <span class="help-block"></span>
                </div>
            </div>
            <br><br><br>
            <div class="form-group">
                <label class="col-sm-2 control-label">委托类型</label>
                <div class="col-sm-8">
                    <input type="text" name="missionType" class="form-control" placeholder="请输入委托类型">
                </div>
            </div>
            <br><br><br>

            <div class="form-group">
                <label class="col-sm-2 control-label">委托简介</label>
                <div class="col-sm-8">
                    <input type="text" name="missionMessage" class="form-control" placeholder="请输入委托简介">
                    <span class="help-block"></span>
                </div>
            </div>
            <br><br><br>

            <div class="form-group">
                <label class="col-sm-2 control-label">委托金</label>
                <div class="col-sm-8">
                    <input type="text" name="missionSalary" class="form-control" placeholder="请输入委托金">
                    <span class="help-block"></span>
                </div>
            </div>
            <br><br><br>

            <div class="form-group">
                <label class="col-sm-2 control-label">委托日期</label>
                <div class="col-sm-8">
                    <input type="date" name="missionDate" class="form-control" placeholder="请输入委托日期">
                </div>
            </div>
            <br><br><br>
            <div class="form-group">
                <label class="col-sm-2 control-label">委托状态</label>
                <div class="col-sm-8">
                    <input type="text" name="missionStatus" class="form-control" value="待完成"/>
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
