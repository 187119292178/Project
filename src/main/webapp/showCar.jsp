<%--
  Created by IntelliJ IDEA.
  User: 雷神
  Date: 2020/6/5
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>购物车</title>
</head>
<body>
<c:forEach items="${map}" var="m">
    ${m.key.goodsid}|${m.key.goodsname}|<a href="">-</a> ${m.value}
    <a href="goods.do?p=addcarnum&goodsid=${m.key.goodsid}">+</a>
    <a href="goods.do?p=delfromcar&goodsid=${m.key.goodsid}">
        删除</a> <br>
</c:forEach>

</body>
</html>
