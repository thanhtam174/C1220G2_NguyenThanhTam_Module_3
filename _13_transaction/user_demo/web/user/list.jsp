<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Application</title>
    <style>
        table{
            border-collapse: collapse;
            background-color: lightblue;
        }
        td,th{
            padding: 5px;
            border: 2px solid black;
        }
        h1{
            color: red;
        }
        input{
            border-radius: 5px;
        }
        a{
            color: mediumblue;
        }
        caption{
            color: blue;
        }
    </style>
</head>
<body>
<div style="text-align: center;">
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
</div>
<div align="center">
    <table>
        <caption>
            <h2>List of Users</h2>
                <form action="/users" method="post">
                    <input type="hidden" name="action" value="search">
                    <input type="text" name="country" value="Enter country">
                    <input type="submit" value="Search" style="background-color: red; color: white">
                </form>
        </caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
