
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/6
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin-所有课程</title>
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
                <small>课程列表--显示所有课程</small>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/toAddCourse">新增课程</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/allCourse">显示所有课程</a>
        </div>
        <div class="col-md-4 column"></div>
        <div class="col-md-4 column">
            <form class="form-inline" action="${pageContext.request.contextPath}/queryCourseByName" method="post">
                <span style="color: red">${courseError}</span>
                <label>
                    <input type="text" name="courseName" placeholder="请输入要查询的课程名称" class="form-control">
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
                    <th>课程ID</th>
                    <th>课程名称</th>
                    <th>课程链接</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${courses}" var="course" >
                    <tr>
                        <td>${course.courseId}</td>
                        <td>${course.courseName}</td>
                        <td>
                            <div style="width:120px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${course.courseLink}">
                                ${course.courseLink}
                            </div>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/toUpdateCourse?courseId=${course.courseId}">修改</a>  &nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/deleteCourse/${course.courseId}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="panel-footer" >
    <h4 class="text-center" style="font-size: 10px; color: red">${requestScope.msg}</h4>
</div>
</body>
</html>