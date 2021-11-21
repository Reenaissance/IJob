<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 21982
  Date: 2021/11/12
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet"/>

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
                <a class="waves-effect" href=""><i class="zmdi zmdi-accounts-list"></i> 评论区 </a>
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
            <div class="iframe cur" >
                <h2>&nbsp;&nbsp;&nbsp;我的博客</h2>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <td> # </td>
                        <td> 博客标题 </td>
                        <td> 发布时间 </td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${List1}" var="blog">
                        <tr>
                            <td onclick="window.location.href='${pageContext.request.contextPath}/checkBlog/${blog.blogId}'"> ${blog.blogId}</td>
                            <td onclick="window.location.href='${pageContext.request.contextPath}/checkBlog/${blog.blogId}'"> ${blog.blogTitle}</td>
                            <td onclick="window.location.href='${pageContext.request.contextPath}/checkBlog/${blog.blogId}'"><fmt:formatDate value="${blog.blogDate}" type="date"/>
                            </td>
                            <td>
                                <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/editBlog/${blog.blogId}'"> 编辑 </button>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/deleteBlog/${blog.blogId}'"> 删除 </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div style="margin-top: 200px;">
                    &nbsp;&nbsp;&nbsp;
                    <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/getBlogList'"> 返回 </button>
                </div>
            </div>
        </div>

    </section>
</section>
<script src="${pageContext.request.contextPath}/plugins/jquery.1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/waves-0.7.5/waves.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/BootstrapMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/device.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fullPage/jquery.fullPage.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fullPage/jquery.jdirk.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>