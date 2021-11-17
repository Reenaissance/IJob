<%@ page import="com.ssm.ijob.service.CourseService" %>
<%@ page import="com.ssm.ijob.service.impl.CourseServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ssm.ijob.entity.Course" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="javax.annotation.Resource" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="com.ssm.ijob.service.UserService" %>
<%@ page import="com.ssm.ijob.entity.UAC" %>
<%--<%@ page import="com.ssm.ijob.servlet.Cookiechoose" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/6
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>allCourses</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <style type="text/css">
        .searchform {
            position: relative;
            display: block;
        }
        .searchform input {
            background: #fff;
            border: 0;
            width: 200px;
            height: 30px;
            float: right;
        }
        .btn-search {
            background-color: #add8e6;
            border: 0px;
            width: 50px;
            height: 35px;
            float: right;
        }
    </style>

</head>

<body>
<br>
<form class="searchform" method="post">
    <button type="submit" class="btn-search">✈</button>
    <input type="text" class="form-control" name="keyword" placeholder="Search here..."/>
</form>
<%
    WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(config.getServletContext());
    CourseService courseService = (CourseService) wac.getBean("courseServiceImpl");
    String name = request.getParameter("keyword");
    if (name == null) {
        name = "";
    }
    List<Course> all = courseService.findAllByCourseName(name);
    Iterator<Course> iterator = all.iterator();
%>
<br>
<c:if test="${empty requestScope.pagemsg}">
    没有任何课程信息！
</c:if>
<c:if test="${!empty requestScope.pagemsg}">
    <table border="1" cellpadding="10" cellspacing="0" style="width: 800px;text-align: center;" align="center"
           rules=rows>
        <%
            while (iterator.hasNext()) {
                Course course = iterator.next();
        %>
        <tr>
            <td colspan="2"><a href="<%=course.getCourseLink()%>}">
                <img
                    src="${pageContext.request.contextPath}/images/<%=course.getCourseName()%>.png" width="120px"
                    height="120px"></a>
            </td>
            <script>
                window.onload = function () {
                    var oImg = document.getElementsByTagName('img');
                    for (var i = 0; i < oImg.length; i++) {
                        oImg[i].onmouseover = function () {
                            this.style.opacity = '0.5'
                        };
                        oImg[i].onmouseout = function () {
                            this.style.opacity = '1'
                        }
                    }
                };
            </script>
        </tr>
        <tr>
            <td style="text-align: right;height:30px" class="getCourse"><%=course.getCourseName()%>
            </td>
            <td style="text-align: left">
<%--                <div class="container" style="width: 90px">--%>
<%--                    <button type="button" class="btn btn-default" id="btn_collect" onclick="collect()">--%>
<%--                        <span class="glyphicon glyphicon-star-empty" id="btn_collect_icon" aria-hidden="true"></span>--%>
<%--                        收藏--%>
<%--                    </button>--%>
<%--                </div>--%>
                    <div class="container" style="width: 90px">
                        <input type="hidden" name="_method" value="COLLECT"/>
                            <a href="javascript:void(0);" onclick="collect(<%=course.getCourseId()%>)">收藏</a>
                    </div>
            </td>
        </tr>
<%--                <script type="text/javascript">--%>
<%--                    $(function () {--%>
<%--                        //    添加收藏--%>
<%--                        $(".collected").click(function () {--%>
<%--                            var value = ${this}.text();--%>
<%--                            var courseId = ${this}.attr("id");--%>
<%--                            if(value === "收藏"){--%>
<%--                                $.ajax({--%>
<%--                                    type:"get",--%>
<%--                                    dataType: "json",--%>
<%--                                    url:"${pageContext.request.contextPath}/collect/"+courseId,--%>
<%--                                    contentType:"application/x-www-form-urlencoded",--%>
<%--                                    data:--%>
<%--                                        {"courseId":courseId},--%>
<%--                                    success:function(data){--%>
<%--                                        $("#"+courseId).removeClass("collected").addClass("collectio").html("已收藏");--%>
<%--                                    },--%>
<%--                                });--%>
<%--                            }else{--%>
<%--                                $.ajax({--%>
<%--                                    type:"get",--%>
<%--                                    dataType: "json",--%>
<%--                                    url:"${pageContext.request.contextPath}/collect/"+courseId,--%>
<%--                                    contentType:"application/x-www-form-urlencoded",--%>
<%--                                    data:--%>
<%--                                        {"courseId":courseId},--%>
<%--                                    success:function(data){--%>
<%--                                        $("#"+courseId).removeClass("collectio").addClass("collected").html("收藏");--%>
<%--                                    },--%>
<%--                                });--%>
<%--                            }--%>
<%--                        });--%>
<%--                    });--%>
<%--                  </script>--%>
<%--                        --%>


        <%
            }
        %>

<%--                            &lt;%&ndash;收藏功能&ndash;%&gt;--%>
<%--                        <script type="text/javascript">--%>
<%--                            $("#btn_collect").click(function () {--%>
<%--                                var classname = $("#btn_collect_icon").attr("class");--%>
<%--                                $("#btn_collect_icon").removeClass("glyphicon-star-empty glyphicon-star");--%>
<%--                                if (classname === "glyphicon glyphicon-star-empty") {--%>
<%--                                    $("#btn_collect_icon").addClass("glyphicon glyphicon-star");--%>
<%--                                    alert("收藏成功");--%>
<%--                                } else {--%>
<%--                                    $("#btn_collect_icon").addClass("glyphicon glyphicon-star-empty");--%>
<%--                                    alert("取消收藏");--%>
<%--                                }--%>
<%--                            });--%>
<%--                        </script>--%>
        <script type="text/javascript">
            function collect(courseId) {
                $.post("${pageContext.request.contextPath}/collect/"+courseId.toString());
                alert("收藏成功");

            }
        </script>
    </table>
</c:if>
<br>
<%
    if (name.equals("")) {

%>
<table border="0" cellspacing="0" cellpadding="0" width="800px" style="text-align: right">
    <tr>
        <td class="td2">
            <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
            <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
            <span>
       <c:if test="${requestScope.pagemsg.currPage != 1}">
           <a href="${pageContext.request.contextPath }/allCourse?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/allCourse?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>
       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/allCourse?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/allCourse?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>
        </td>
    </tr>
</table>
<%
    }
%>
<div class="panel-footer">
    <h4 class="text-center" style="font-size: 10px; color: red">${requestScope.collectMessage}</h4>
</div>
</body>
</html>