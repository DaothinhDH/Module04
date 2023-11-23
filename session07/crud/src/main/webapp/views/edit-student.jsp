<%--
  Created by IntelliJ IDEA.
  User: Thinh
  Date: 22/11/2023
  Time: 2:47 CH
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
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #337ab7;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>Sửa sinh viên</h1>
<form action="/student" method="post">
    <input type="hidden" value="edit" name="action" id="">
    <label for="studentCode">MSV:</label>
    <input type="text" id="studentCode" name="studentCode"  value="${student.studentCode}" readonly disabled><br>

    <label for="studentCode">Họ và tên:</label>
    <input type="text" id="studentName" name="studentName"  value="${student.studentName}"><br>

    <label for="age">Tuổi:</label>
    <input type="number" id="age" name="age" required value="${student.age}"><br>

    <label for="sex">Giới tính:</label>
    <select id="sex" name="sex">
        <option value="true" ${student.sex?"selected" : ""}>Nam</option>
        <option value="false" ${!student.sex?"selected" : ""}>Nữ</option>
    </select><br>

    <label for="classRoom">Lớp học:</label>
    <input type="text" id="classRoom" name="classRoom" required value="${student.classRoom}"><br>

    <label for="address">Địa chỉ:</label>
    <input type="text" id="address" name="address" required value="${student.address}"><br>

    <input type="submit" value="Cập nhật">

</form>


</body>
</html>
