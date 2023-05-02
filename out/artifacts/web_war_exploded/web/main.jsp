<%--
  Created by IntelliJ IDEA.
  User: 15472
  Date: 2023/4/25
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
</head>
<body>
<h2>系统主页</h2>
<hr>
<h3><a href="<%=path%>/findAllUser.do">查看所有账号</a> </h3>
<h3><a href="login.html">退出</a> </h3>
<%System.out.println(path);%>

</body>
</html>
