<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/2
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee</title>
    <style type="text/css">
        #menu {
            font:20px verdana, arial, sans-serif;
        }
        #menu, #menu li {
            list-style-type: none;
            position: relative;
        }
        #menu li {
            float:left;
            width: 150px;
        }
        #menu li a {
            display:block;
            height: 35px;
            padding:8px 50px;
            background: #ADD8E6;
            color:#fff;
            text-decoration:none;
            /*border-right:1px solid #000;*/
        }
        #menu li a:hover {
            background: #FF7D22;
            color:#fff;
            text-decoration:none;
            border-right:1px solid #000;
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
        <li><a href="#" style="width: 600px;text-align: right">登录</a></li>
    </ul>
</div>
</body>
</html>
