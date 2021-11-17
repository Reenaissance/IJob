<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/10/27
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>委托员</title>
</head>
<style type="text/css">
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

         /* 下拉按钮样式 */
     .dropbtn {
         background-color: #ADD8E6;
         color: white;
         padding: 8px 50px;
         font-size: 20px;
         width: 150px;
         height: 50px;
         border: none;
         cursor: pointer;
     }

    /* 容器 <div> - 需要定位下拉内容 */
    .dropdown {
        position: relative;
        display: inline-block;
    }

    /* 下拉内容 (默认隐藏) */
    .dropdown-content {
        display: none;
        position: absolute;
        font-size: 20px;
        background-color: #f9f9f9;
        min-width: 180px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    }

    /* 下拉菜单的链接 */
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    /* 鼠标移上去后修改下拉菜单链接颜色 */
    .dropdown-content a:hover {background-color: #FF7D22}

    /* 在鼠标移上去后显示下拉菜单 */
    .dropdown:hover .dropdown-content {
        display: block;
    }

    /* 当下拉内容显示后修改下拉按钮的背景颜色 */
    .dropdown:hover .dropbtn {
        background-color: #FF7D22;
    }
</style>

</head>
<body>
<div>
    <ul id="menu">
        <li><img src="${pageContext.request.contextPath}/images/logo.png" style="width: 100px;height: 50px"></li>
        <li><a href="#">首页</a></li>
        <li>
            <div class="dropdown">
                <button class="dropbtn">委托</button>
                <div class="dropdown-content">
                    <a href="${pageContext.request.contextPath}/employer/mission">全部委托</a>
                    <a href="${pageContext.request.contextPath}/myMission/${sessionScope.userId}">我的委托</a>
                </div>
            </div>
        </li>
        <li><a href="${pageContext.request.contextPath}/teach">教学</a></li>

        <li><a href="${pageContext.request.contextPath}/logout.action" style="width: 600px;text-align: right">登出</a></li>
    </ul>
</div>
</body>
</html>
