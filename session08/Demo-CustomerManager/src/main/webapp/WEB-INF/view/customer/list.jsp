<%--
  Created by IntelliJ IDEA.
  User: Thinh
  Date: 24/11/2023
  Time: 9:22 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
  <style>
    /*table, th, tr, td {*/

    /*    border-collapse: collapse;*/
    /*}*/
    table {
      padding: 8px;
      width: 80%;
      border-collapse: collapse;
    }

    th, td {
      padding: 5px;
      border: 1px solid #ddd;
      text-align: center; /* Căn giữa theo chiều ngang */
    }
    td {
      vertical-align: middle; /* Căn giữa theo chiều dọc */
    }
    a {
      margin: 5px;
      text-decoration: none;
    }
  </style>
</head>
<body>
<a href="customer?action=create">Create Customer</a>
<form action="customer"> <br>
  <input type="text" name="search" value="${searchname}">
  <input type="submit" value="search" name="action">
</form>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>ADDRESS</th>
        <th>EMAIL</th>
        <th>ACTION</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${customers}" var="c">
        <tr>
          <td>${c.customerId}</td>
          <td>${c.customerName}</td>
          <td>${c.address}</td>
          <td>${c.email}</td>
          <td>
              <a href="customer?action=edit&id=${c.customerId}">Edit</a>
              <a onclick="return confirm('Bạn có chắc chắn muốn xóa ?')" href="customer?action=delete&id=${c.customerId}">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>
