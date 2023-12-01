<%--
  Created by IntelliJ IDEA.
  User: Thinh
  Date: 01/12/2023
  Time: 11:13 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        create
    </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="form-container">
        <form action="/customer/create" method="post">
            <div class="form-group">
                <h1>Form Add</h1>
            </div>
            <div class="form-group">
                <p>Name:</p>
                <input class="form-control" type="text" name="customerName"/>
            </div>
            <div class="form-group">
                <p>Address:</p>
                <input class="form-control" type="text" name="address"/>
            </div>
            <div class="form-group">
                <p>Email:</p>
                <input class="form-control" type="text" name="email"/>
            </div>
            <div class="form-group">
                <button class="btn btn-primary" type="submit">Add customer</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
