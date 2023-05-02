<%@ page import="java.util.List" %>
<%@ page import="cn.tedu.demo.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 15472
  Date: 2023/4/24
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账号信息列表</title>
</head>
<body>
    <h2>账号信息列表</h2>
    <hr>
    <%
        List<User> list = (List<User>) request.getAttribute("list");
        for (User user : list){
    %>
    <ul>
        <li><%= user.getId()%></li>
        <li><%= user.getUserName()%></li>
        <li><%= user.getPassword()%></li>
        <li><%= user.getPhone()%></li>
        <li><%= user.getEmail()%></li>
        <li><%= user.getCreated()%></li>
        <li><%= user.getUpdated()%></li>
    </ul>
    <input type="button" value="删除账号" onclick="deleteUser(<%= user.getId()%>)">
    <input type="button" value="编辑账号" onclick="window.location.href='findByIdUser.do?id=<%= user.getId()%>'">
    <%
        }
    %>
    <script>
        function deleteUser(id){
            var isDelete = window.confirm('确定删除吗?如果点击确定,数据无法恢复');
            if (isDelete){
                window.location.href = "deleteUser.do?id="+id;
            }
        }
    </script>
</body>
</html>
