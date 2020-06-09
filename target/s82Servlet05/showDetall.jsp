<%--
  Created by IntelliJ IDEA.
  User: 雷神
  Date: 2020/6/4
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>详细</title>
</head>
<body>
${goods.goodsid}
${goods.goodsname}
${goods.goodsprice}
${goods.goodscount}
<img src="image/${goods.goodspic}">

<c:forEach items="${goods.set}" var ="pic">
    <img src="image/${pic.pname}" height="200"  width="150">
</c:forEach>

<input type="text" value="1" id="num">

<a href="javascript:void(0)" onclick="addCar()">加入购物车</a>
<a href="user.do?p=addcollection&goodsid=${goods.goodsid}">收藏</a>


</body>
</html>


<script>

    function addCar(){
        var num = document.getElementById("num").value;
        location = "goods.do?p=addCar&num="+num+"&goodsid=${goods.goodsid}" ;

    }

</script>



