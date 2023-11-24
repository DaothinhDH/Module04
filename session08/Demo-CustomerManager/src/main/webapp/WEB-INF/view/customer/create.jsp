<%--
  Created by IntelliJ IDEA.
  User: Thinh
  Date: 24/11/2023
  Time: 10:25 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        h1 {
            color: #333333;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"] {
            width: 200px;
            padding: 5px;
            border: 1px solid #cccccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>Thêm Mới</h1>
<a href="customer">Back</a>
<form method="post">
    <label>Họ và tên: </label>
    <input type="text" name="name" placeholder="Name Customer"><br>
    <label>Địa chỉ: </label>
    <input type="text" name="address" placeholder="address"><br>
    <label>Email: </label>
    <input type="text" name="email" placeholder="email"><br>

    <input type="submit" name="Submit">
</form>
</body>
</html>
