<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/2
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教学模块</title>
    <style type="text/css">
        html, body {
            margin: 0px;
            height: 100%;
        }

        #menu li {
            list-style-type: none;
            width: 300px;

        }

        #menu li a {
            display: block;
            height: 50px;
            padding: 8px 50px;
            background: #ADD8E6;
            color: #fff;
            text-decoration: none;
            font-size: 25px;
        }

        #menu li a:hover {
            background: #FF7D22;
            color: #fff;
            text-decoration: none;
            border-right: 1px solid #000;
        }

        #main_content-left-top {
            padding: 0px 110px;
        }
        #be{
            width: 250px;
            height:140px;
            background: #ADD8E6;
            margin-left: 40px;
            margin-top: -22px;
            float: left;
            padding-left: 50px;
            padding-top: 40px;
        }
    </style>
</head>
<body>
<hr>
<div>
    <div id="left"style="float:left;">
        <!-- 放置个人头像和信息 -->
        <div id="main_content-left-top">
            <!-- 显示头像 -->
            <div>
                <img src="${pageContext.request.contextPath}/images/申请人.png" width="150px" height="150px" alt="我的头像"/>
                <div id="welcome_msg" style="font-size: 20px">
                    <br/>欢迎您： ${sessionScope.userName}
                </div>
            </div>
        </div>
        <div id="menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/allCourse" target="show">所有课程</a></li>
                <li><a href="/IJob/teach/${user.userId}&tab=allCourse" target="show">我的收藏</a></li>
                <li><a href="/IJob/teach/${user.userId}&tab=allCourse" target="show">课程报错</a></li>
                <li><a href="/IJob/teach/${user.userId}&tab=allCourse" target="show">浏览历史</a></li>
            </ul>
        </div>
        <div id="be">
            <img src="${pageContext.request.contextPath}/images/logo.png" width="150px" height="80px">
        </div>
    </div>
        <div>
            <iframe name="show" width="65%" height="650px" src="${pageContext.request.contextPath}/allCourse"></iframe>
        </div>

</div>
</body>
</html>
