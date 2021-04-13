<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search product</title>
</head>
<body>
<p>
    <c:if test="${searchList.isEmpty}">
        <p>${message}</p>
    </c:if>
</p>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Price</th>
    </tr>
        <c:forEach items='${requestScope["searchList"]}' var="product">
    <tr>
        <td>${product.getName()}</td>
        <td>${product.getPrice()}</td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
