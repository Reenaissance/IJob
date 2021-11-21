<%--
  Created by IntelliJ IDEA.
  User: 54381
  Date: 2021/11/15
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图片上传</title>
    <link href="${pageContext.request.contextPath}/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .col-sm-2 {
            width: 100px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>请为您新增的课程添加课程图片</small>
                </h1>
            </div>
        </div>
    </div>
        <form action="uploadServlet" method="post" enctype="multipart/form-data">
            <div class="modal-body">
                <div class="form-group">
                    <label class="col-sm-2 control-label">课程名</label>
                    <div class="col-sm-8">
                        <input type="text" name="courseName" class="form-control" value="${courseName}">
                        <%
                            request.getSession().setAttribute("courseName",request.getParameter("courseName"));
                        %>
                    </div>
                </div>
                <br><br><br>

            <div class="form-group">
                <label class="col-sm-2 control-label">课程图片</label>
                <div class="col-sm-8">
                    <input id="file" type="file" name="file">
                    <br>
                    <input type="submit" style="margin-left: 50px" class="btn btn-default" value="上传">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
