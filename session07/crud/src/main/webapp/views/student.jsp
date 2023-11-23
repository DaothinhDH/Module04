<%--
  Created by IntelliJ IDEA.
  User: Thinh
  Date: 22/11/2023
  Time: 2:12 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách sinh viên</h1>
<table border="1" cellspacing="0">
    <thead>
    <tr>
        <th>MSV</th>
        <th>Họ và tên</th>
        <th>Tuổi</th>
        <th>Giới tính</th>
        <th>Lớp học</th>
        <th>Địa chỉ</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
      <c:forEach items="${students}" var="st">
          <tr>
              <td>${st.studentCode}</td>
              <td>${st.studentName}</td>
              <td>${st.age}</td>
              <td>${st.sex ? "Name" : "Nữ"}</td>
              <td>${st.classRoom}</td>
              <td>${st.address}</td>
              <td>
                  <a href="student?action=edit&id=${st.studentCode}">Edit</a>
                  <a onclick="return confirm('bạn muốn xóa không')" href="student?action=delete&id=${st.studentCode}">delete</a>
              </td>
          </tr>
      </c:forEach>
    </tbody>
</table>
    <a href="student?action=add" style="text-decoration: none ">Thêm mới sinh viên</a>
</body>
</html>
