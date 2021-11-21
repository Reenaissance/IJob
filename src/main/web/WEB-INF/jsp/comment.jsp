<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 21982
  Date: 2021/11/12
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/plugins/fullPage/jquery.fullPage.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/plugins/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/plugins/waves-0.7.5/waves.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet"/>
    <style>
        #header {background: #29A176;}
    </style>
</head>
<body>
<header id="header">
    <ul id="menu">
        <li id="guide" class="line-trigger">
            <div class="line-wrap">
                <div class="line top"></div>
                <div class="line center"></div>
                <div class="line bottom"></div>
            </div>
        </li>
        <li id="logo" class="hidden-xs">
            <a href="../html/index.html">
            </a>
            <span id="system_title">IJob</span>
        </li>
        <li class="pull-right">
            <span class="fl" >欢迎回来, ${sessionScope.userName}&nbsp;|&nbsp;</span>
            <span class="fl" onclick="window.location.href='${pageContext.request.contextPath}/logout.action'"> 注销  </span>
        </li>
    </ul>
</header>
<section id="main">
    <!-- 左侧导航区 -->
    <aside id="sidebar">
        <!-- 菜单区 -->
        <ul class="main-menu">

            <li >
                <a class="waves-effect" href="${pageContext.request.contextPath}/getCommentList"><i class="zmdi zmdi-accounts-list"></i> 评论区 </a>
            </li>
            <li >
                <a class="waves-effect" href="${pageContext.request.contextPath}/getBlogList"><i class="zmdi zmdi-accounts"></i> 个人博客 </a>
            </li>

        </ul>
        <!-- /菜单区 -->
    </aside>
    <!-- /左侧导航区 -->

    <section id="content">
        <div class="content_main" style="overflow:scroll;">
            <div style="height: 40px;padding-top: 10px;">
                &nbsp;&nbsp;&nbsp;
                <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/addMain'"> 我要分享 </button>
            </div>
            <div>
                <c:if test="${sessionScope.temp2}">
                    <tr>
                        <form action="${pageContext.request.contextPath}/addMainComment">
                            <td colspan="3">
                                <textarea id="firComment" class="form-control" placeholder="评论内容" name="firContent"></textarea>
                            </td>
                            <td>
                                <button class="button" type="submit"> 提交 </button>
                            </td>
                        </form>
                    </tr>
                </c:if>
            </div>
            <div class="comment" >
                <c:forEach items="${commentList}" var="comment">
                    <table class="table table-bordered">
                        <tr class="success">
                            <td colspan="4">${comment.username}</td>
                        </tr>
                        <tr class="success">
                            <td colspan="4"> ${comment.commentContext} </td>
                        </tr>
                        <tr class="success">
                            <td colspan="3" style="width: 300px">
                                <button class="button" style="width: 50px" onclick="window.location.href='${pageContext.request.contextPath}/dianzan/${comment.commentId}'" >赞</button> &nbsp;&nbsp;${comment.commentGood}
                            </td>
                            <td> <fmt:formatDate value="${comment.commentDate}" type="date"/> </td>
                        </tr>
                        <tr class="success">
                            <td colspan="3" style="width: 300px"></td>
                            <td><button class="bottom" onclick="window.location.href='${pageContext.request.contextPath}/setComment/${comment.commentId}'">我要评论</button></td>
                        </tr>
                        <c:forEach items="${comment.ICBU}" var="second">
                        <tr class="success">
                            <td>${second.username}</td>
                            <td colspan="2">${second.commentSecondContext}</td>
                            <td>
                                <fmt:formatDate value="${second.time}" type="date"/>
                                <c:if test="${second.secUserId == sessionScope.userId}">
                                    <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/deleteSec/${second.secId}'">删除评论</button>
                                </c:if>
                            </td>
                        </tr>
                        </c:forEach>
                        <c:if test="${sessionScope.secondId == comment.commentId && sessionScope.temp}">
                            <tr>
                                <form action="${pageContext.request.contextPath}/addSecComment/${comment.commentId}">
                                    <td colspan="3">
                                        <textarea id="secondComment" class="form-control" placeholder="评论内容" name="SecondContent"></textarea>
                                    </td>
                                    <td>
                                        <button class="button" type="submit"> 提交 </button>
                                    </td>
                                </form>
                            </tr>
                        </c:if>
                    </table>
                </c:forEach>
            </div>
        </div>
    </section>
</section>
<script src="${pageContext.request.contextPath}/plugins/jquery.1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/waves-0.7.5/waves.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jquery-confirm/jquery-confirm.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/BootstrapMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/device.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fullPage/jquery.fullPage.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fullPage/jquery.jdirk.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>
