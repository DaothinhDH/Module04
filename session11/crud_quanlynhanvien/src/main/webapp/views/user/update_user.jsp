<%--
  Created by IntelliJ IDEA.
  User: Thinh
  Date: 30/11/2023
  Time: 8:25 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <h1 class="text-center text-danger">cap nhat nhan vien </h1>
            <form action="<%=request.getContextPath()%>/users?action=update&id=${update.userId}" method="post">
                <input type="hidden" name="id" value="${update.userId}">
                <div class="form-group">
                    <label >Họ và Tên: </label>
                    <input type="text" class="form-control"  name="name" value="${update.username}">
                </div>
                <div class="form-group">
                    <label >phone: </label>
                    <input type="text" class="form-control"  name="phone" value="${update.phoneNumber}">
                </div>
                <div class="form-group">
                    <label >address: </label>
                    <input type="text" class="form-control"  name="address" value="${update.address}">
                </div>
                <div class="form-group">
                    <label >birthday: </label>
                    <input type="date" class="form-control"  name="birthday" value="${update.birthday}">
                </div>
                <div class="form-group">
                   <select name="sex">
                       <option value="${update.sex}">Nam</option>
                       <option value="${!update.sex}">Nu</option>
                   </select>
                </div>
                <div class="form-group">
                    <label >salary: </label>
                    <input type="text" class="form-control"  name="salary" value="${update.salary}">
                </div>
                <button type="submit" class="btn btn-primary">Add</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
