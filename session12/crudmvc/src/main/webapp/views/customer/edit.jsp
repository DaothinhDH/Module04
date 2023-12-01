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
        <form action="/customer/edit" method="post">
            <div class="form-group">
                <h1>Form Edit</h1>
            </div>
            <div class="form-group">
                <p>Id:</p>
                <input class="form-control" type="text" name="customerId"value="${cusEdit.customerId}" readonly />
            </div>
            <div class="form-group">
                <p>Name:</p>
                <input class="form-control" type="text" name="customerName" value="${cusEdit.customerName}"/>
            </div>
            <div class="form-group">
                <p>Address:</p>
                <input class="form-control" type="text" name="address" value="${cusEdit.address}" />
            </div>
            <div class="form-group">
                <p>Email:</p>
                <input class="form-control" type="text" name="email" value="${cusEdit.email}"/>
            </div>
            <div class="form-group">
                <button class="btn btn-primary" type="submit">Edit customer</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
