<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: 雷神
  Date: 2020/6/4
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>主页</title>
</head>
<body>

<style>

    #bigDiv{

        width: 900px;
        height: 550px;
        border: 1px solid red;
        text-align: center;
        margin: auto;


    }
    .smalldiv{

        width: 200px;
        height: 200px;
        border: 1px solid red;
        float: left;
    <%-- 间距--%>
        margin-left: 12px;
        <%--上下间距--%>
        margin-top:10px;

    }
    .goodspic{

        width: 130px;
        height: 160px;

    }



</style>

<div id="bigDiv" >
    <c:forEach items="${map.list}" var="goods">
        <div class="smalldiv">
            ${goods.goodsid}${goods.goodsname}
            <a href="goods.do?p=findbyid&goodsid=${goods.goodsid}" title="查看详细"><img class="goodspic" src="image/${goods.goodspic}"></a>
        </div>

    </c:forEach><br>
</div>

<a href="goods.do?p=fenye&page=1&size=${map.size}">首页</a>
<a href="goods.do?p=fenye&page=${map.page-1}&size=${map.size}">上</a>
<a href="goods.do?p=fenye&page=${map.page+1}&size=${map.size}">下</a>
<a href="goods.do?p=fenye&page=${map.pageCount}&size=${map.size}">尾页</a>




</body>
</html>
