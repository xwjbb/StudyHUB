<%@ page import="cn.tedu.demo.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 15472
  Date: 2023/4/24
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑账号</title>
</head>
<body>
    <h2>修改用户的邮箱或手机号</h2>
    <hr>
    <%User user = (User) request.getAttribute("user");%>
    <form action="userUpdate.do" method="post">
        <input type="hidden" name="id" value="<%=user.getId()%>">
        邮箱:
        <input type="text" name="email" value="<%= user.getEmail()%>"><br><br>
        手机:
        <input type="text" name="phone" value="<%= user.getPhone()%>"><br><br>
        <input type="submit" value="确认修改">
    </form>

</body>
</html>
