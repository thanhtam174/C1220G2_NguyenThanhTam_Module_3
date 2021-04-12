<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <style>
        h2{
            text-align: center;
            color: red;
        }
        table{
            border-collapse: collapse;
            margin-left: 350px;
        }
        td,th{
            text-align: center;
            height: 70px;
            width: 120px;
            border-bottom: 1px solid black;
        }
        img{
            height: 50px;
            width: 50px;
        }
    </style>
</head>
<body>
<h2>Danh Sách Khách Hàng</h2>
<table>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${listCustomer}">
        <tr>
            <td style="text-align: left; width: 170px"><c:out value="${customer.fullName}"/></td>
            <td><c:out value="${customer.dateOfBirth}"/></td>
            <td><c:out value="${customer.address}"/></td>
            <td><img src="${customer.img}"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
