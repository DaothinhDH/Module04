<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thinh
  Date: 29/11/2023
  Time: 5:26 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="users?action=create"> ADD</a>
<table >
    <thead>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>NAME</th>
        <th>phone</th>
        <th>Address</th>
        <th>birthday</th>
        <td>sex</td>
        <td>salary</td>

        <td colspan="2">Action</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="item" varStatus="loop">
        <tr>
            <td>${loop.index+1}</td>
            <td>${item.userId}</td>
            <td>${item.username}</td>
            <td>${item.phoneNumber}</td>
            <td>${item.address}</td>
            <td>${item.birthday}</td>
            <td>${item.sex}</td>
            <td>${item.salary}</td>
            <td>
                <a href="users?action=update&id=${item.userId}">Edit</a>
                <a onclick="return confirm('ban co chac chan muon xoa khong?')"
                   href="users?action=delete&id=${item.userId}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
</html>
