<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/10/19
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>主页</title>
    <style type="text/css">
        td {
            text-align: center;
        }

        .td2 {
            text-align: right;
        }

        .table1 {
            border: 1px solid #ddd;
            width: 900px;
        }

        thead {
            background-color: lightblue;
        }

        #menu {
            font: 20px verdana, arial, sans-serif;
        }

        #menu, #menu li {
            list-style-type: none;
            position: relative;
        }

        #menu li {
            float: left;
            width: 150px;
        }

        #menu li a {
            display: block;
            height: 35px;
            padding: 8px 50px;
            background: #ADD8E6;
            color: #fff;
            text-decoration: none;
            /*border-right:1px solid #000;*/
        }

        #menu li a:hover {
            background: #FF7D22;
            color: #fff;
            text-decoration: none;
            border-right: 1px solid #000;
        }
        th a{
            text-decoration: none;
        }

    </style>
</head>
<body>
<div>
    <ul id="menu">
        <li><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 100px;height: 50px"></li>
        <li><a href="#">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/mission">委托</a></li>
        <li><a href="${pageContext.request.contextPath}/teach">教学</a></li>
        <li><a href="${pageContext.request.contextPath}/logout.action" style="width: 600px;text-align: right">登出</a></li>

    </ul>
</div>
<hr>
<c:if test="${empty requestScope.pagemsg}">
    没有任何委托信息！
</c:if>
<c:if test="${!empty requestScope.pagemsg}">
    <table border="1" cellpadding="10" cellspacing="0" class="table1" style="width: 1000px;" >
        <thead>
        <tr>
            <td>编号</td>
            <td>类型</td>
            <td>相关内容</td>
            <td>悬赏金</td>
            <td>日期</td>
            <td>状态</td>
            <td>查看详情</td>
        </tr>
        </thead>
        <c:forEach items="${requestScope.pagemsg.lists}" var="m">
            <tr>
                <th>${m.missionId }</th>
                <th>${m.missionType }</th>
                <th>${m.missionMessage }</th>
                <th>${m.missionSalary }</th>
                <th><fmt:formatDate value="${m.missionDate}" type="date"/></th>
                <th>${m.missionStatus }</th>
                <th><a href="${pageContext.request.contextPath}/erDetail/${m.missionId}">More</a></th>

            </tr>
        </c:forEach>
    </table>
</c:if>

<table border="0" cellspacing="0" cellpadding="0" width="900px">
    <tr>
        <td class="td2">
            <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
            <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
            <span>
       <c:if test="${requestScope.pagemsg.currPage != 1}">
           <a href="${pageContext.request.contextPath }/mission?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/mission?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>
       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/mission?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/mission?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>
        </td>
    </tr>
</table>
</body>
</html>
