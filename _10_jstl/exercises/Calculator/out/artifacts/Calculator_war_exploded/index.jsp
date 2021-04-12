<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<style>
    h2{
        color: red;
    }
    table{
        margin: 5px;
        padding: 0;
        border-collapse: collapse;
        border: 1px solid black;
        background-color: aquamarine;
    }
    td{
        border-radius: 7px ;
    }
    input,select{
        border-radius: 7px ;
    }
</style>
<body>
<form action="/calculate" method="get">
    <table>
        <tr>
            <th colspan="2">
                <h3>Calculator</h3>
            </th>
        </tr>
        <tr>
            <td>First operand:</td>
            <td><input type="text" name="first_operand"></td>
        </tr>
        <tr>
            <td>Operator:</td>
            <td>
                <select name="operator" id="opr">
                    <option value="Addition">Addition</option>
                    <option value="Subtraction">Subtraction</option>
                    <option value="Multiplication">Multiplication</option>
                    <option value="Division">Division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second operand:</td>
            <td><input type="text" name="second_operand"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Caculate"></td>
        </tr>
        <tr>
            <td>Result:</td>
            <td><c:out value="${result}"/></td>
        </tr>
    </table>
</form>
</body>
</html>
