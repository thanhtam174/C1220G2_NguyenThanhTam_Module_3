
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Discount Calculator</title>
  </head>
  <body>
  <form action="/calculator">
    <table>
      <tr>
        <th colspan="2" style="text-align: center; color: red; font-size: 50px">Product</th>
      </tr>
      <tr>
        <td>Product Description:</td>
        <td><textarea name="description" id="des" cols="30" rows="5"></textarea></td>
      </tr>
      <tr>
        <td>List Price:</td>
        <td>$ <input type="text" name="price" /></td>
      </tr>
      <tr>
        <td>Discount Percent:</td>
        <td>% <input type="text" name="discount" /></td>
      </tr>
      <tr>
        <td>Discount Amount:</td>
        <%
          Double tmp = (Double) request.getAttribute("disAmount");

          if (tmp != null) {
        %>
        <td><strong>$ <%=tmp%> </strong></td>
        <%
          }
        %>
      </tr>
      <tr>
        <td>Discount Price:</td>
        <td>
          <%
            Double tmp2 = (Double) request.getAttribute("disPrice");

            if (tmp2 != null) {
          %>
          <strong>$ <%=tmp%> </strong></td>
        <%
          
        %>
      </tr>
      <tr>
        <td colspan="2" style="text-align: center"><input type="submit" value="OK"></td>
      </tr>
    </table>
  </form>
  </body>
</html>
