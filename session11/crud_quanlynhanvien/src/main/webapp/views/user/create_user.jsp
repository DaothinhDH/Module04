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
            <h1 class="text-center text-danger">Thêm mới nhan vien </h1>
            <form action="<%=request.getContextPath()%>/users" method="post">
                <div class="form-group">
                    <label >Họ và Tên: </label>
                    <input type="text" class="form-control"  name="name">
                </div>
                <div class="form-group">
                    <label >phone: </label>
                    <input type="text" class="form-control"  name="phone">
                </div>
                <div class="form-group">
                    <label >address: </label>
                    <input type="text" class="form-control"  name="address">
                </div>
                <div class="form-group">
                    <label >birthday: </label>
                    <input type="date" class="form-control"  name="birthday">
                </div>
                <div class="form-group">
                   <select name="sex">
                       <option value="true">Nam</option>
                       <option value="false">Nu</option>
                   </select>
                </div>
                <div class="form-group">
                    <label >salary: </label>
                    <input type="text" class="form-control"  name="salary">
                </div>
                <button type="submit" class="btn btn-primary">Add</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
