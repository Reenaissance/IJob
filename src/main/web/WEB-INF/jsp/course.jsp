<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/10/21
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course</title>
</head>
<body>
<table border="1">
    <tr>
        <td>id</td>
        <td>name</td>
    </tr>
    <tr>
        <td>${course.courseId}</td>
        <td>${course.courseName}</td>
    </tr>
</table>
<div>
    <a href="${course.courseLink}"><img src="${pageContext.request.contextPath}/images/${course.courseName}.png" width="175" height="100"></a>
</div>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">课程列表</h3>
    </div>
    <div class="panel-body form-inline">
        <label>搜索名称关键字：<input type="text" class="form-control" placeholder="请输入要搜索的课程名称" id="course_name"></label>
        <button class="btn btn-primary" onclick="search()">搜索</button>
    </div>
</div>
</body>
</html>
