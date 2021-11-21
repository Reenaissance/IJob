<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/17
  Time: 0:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的委托</title>
    <link href="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <small>我的委托--显示所有委托</small>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/toAddMission">新增委托</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/myMission/${sessionScope.userId}">显示所有委托</a>
        </div>
        <div class="col-md-4 column"></div>
        <div class="col-md-4 column">
            <form class="form-inline" action="${pageContext.request.contextPath}/queryMissionById" method="post">
                <label>
                    <input type="text" name="missionId" placeholder="请输入要查询的委托ID" class="form-control">
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
                    <th>编号</th>
                    <th>类型</th>
                    <th>相关内容</th>
                    <th>悬赏金</th>
                    <th>日期</th>
                    <th>状态</th>
                    <th>查看详情</th>
                </tr>
                </thead>
                <c:forEach items="${requestScope.user.missions}" var="m">
                    <tr>
                        <td>${m.missionId}</td>
                        <td>${m.missionType }</td>
                        <td>${m.missionMessage }</td>
                        <td>${m.missionSalary }</td>
                        <td><fmt:formatDate value="${m.missionDate}" type="date"/></td>
                        <td>${m.missionStatus }</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/toUpdateMission?id=${m.missionId}">修改</a>  &nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/deleteMission/${m.missionId}">删除</a>
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
