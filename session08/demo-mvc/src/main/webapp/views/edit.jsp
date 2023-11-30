<%--
  Created by IntelliJ IDEA.
  User: Thinh
  Date: 24/11/2023
  Time: 3:56 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        form {
            width: 300px;
            margin: 0 auto;
        }

        label {
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 8px 12px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;

        }
        a {
            margin: 5px;
            text-decoration: none;
            display: inline-block;
            padding: 6px 12px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<h1>EDIT</h1>
<form method="post" action="<%=request.getContextPath()%>/danh-muc">
    <h1>Thêm mới</h1>
    <label>Mã danh mục</label>
    <input type="hidden" name="categoryId" value="${category.categoryId}">
    <label>Tên danh muc: </label>
    <input type="text" name="categoryName" value="${category.categoryName}"><br>
    <label >Active </label>
    <input type="radio"  name="status" value="true" checked>
    <label >Block </label>
    <input type="radio" name="categoryStatus" value="false"><br>
    <a href="<%=request.getContextPath()%>/danh-muc">Back</a>
    <input type="submit" name="Submit">
</form>
</body>
</html>
