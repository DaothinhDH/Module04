<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thinh
  Date: 24/11/2023
  Time: 3:22 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .center {
            text-align: center;
        }
    </style>
</head>
<h1>Danh sach danh muc</h1>
<body>
<a href="danh-muc?action=add">Them moi</a>
<table border="1" cellspacing="0">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Email</td>
        <td colspan="2">Action</td>
    </tr>
    <c:forEach items='${list}' var="item" varStatus="loop">
        <tr>
            <td>${loop.index+1}</td>
            <td>${item.categoryName}</td>
            <td>${item.status ? "Active" : "Block"}</td>
            <td><a href="/danh-muc?action=edit&id=${item.categoryId}">Edit</a></td>
            <td>
                <a onclick="return confirm('ban co chac chan muon xoa khong?')"
                   href="">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
