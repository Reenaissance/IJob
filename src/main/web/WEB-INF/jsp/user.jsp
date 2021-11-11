<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/htm1; charset=UTF-8">
    <title>客户信息</title>
</head>
<body>
    <table border="1">
        <tr>
            <td>id</td>
            <td>name</td>
            <td>password</td>
            <td>email</td>
            <td>privilege</td>
        </tr>
        <tr>
            <td>${user.userId}</td>
            <td>${user.userName}</td>
            <td>${user.userPassword}</td>
            <td>${user.userEmail}</td>
            <td>${user.userPrivileges}</td>
        </tr>
    </table>
</body>