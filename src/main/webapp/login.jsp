<%--
  Created by IntelliJ IDEA.
  User: 雷神
  Date: 2020/6/8
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>

<form method="post" action="user.do?p=login">
    用户名:<input type="text" name="username">
    用户密码:<input type="password" name="password">
    <input type="submit" value="登录">

</form>

</body>
</html>
