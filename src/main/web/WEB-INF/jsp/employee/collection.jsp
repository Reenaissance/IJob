<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="com.ssm.ijob.service.CourseService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/12
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的收藏</title>
</head>
<body>
<c:if test="${empty requestScope.collectList}">
    啊哦, 收藏为空！快去收藏吧~
</c:if>
<c:if test="${!empty requestScope.collectList}">

    <table border="1" cellpadding="10" cellspacing="0" class="table1" align="center" style="width: 700px;text-align: center" >
        <div style="text-align: center">
            <p>您收藏的课程：</p>
        </div>

        <c:forEach items="${requestScope.collectList}" var="course">
            <tr>
                <td>
                    <a href="${course.courseLink}">
                    <img src="${pageContext.request.contextPath}/images/${course.courseName}.png"
                         width="120px" height="120px">
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                        ${course.courseName}
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
