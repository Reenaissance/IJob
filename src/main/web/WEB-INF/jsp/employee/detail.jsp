
<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/10/20
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Mission详情</title>
    <style type="text/css">
        td{text-align: center;}
        .table1{
            border:1px solid #ddd;
            width:900px;
        }

    </style>
</head>
<body>
<hr>
<c:if test="${empty requestScope.mission}">
    没有任何委托信息！
</c:if>
<c:if test="${!empty requestScope.mission}">
    <table border="1" cellpadding="10" cellspacing="0" align="center" class="table1">
        <thead>
        <tr height="25">
            <td>编号:  ${mission.missionId }</td>
            <td>类型:  ${mission.missionType}</td>
            <td>委托人:  </td>
            <td>赏金:  ${mission.missionSalary} </td>
        </tr>
        <tr>
            <td colspan="4" height="25">委托内容</td>
        </tr>
        <tr>
            <td colspan="4" height="100"> ${mission.missionDetail}</td>
        </tr>
        <tr height="25">
            <td colspan="2">日期: <fmt:formatDate value="${mission.missionDate}" type="date"/></td>
            <td colspan="2">状态: ${mission.missionStatus}</td>
        </tr>
        </thead>
    </table>
</c:if>

</body>
</html>
