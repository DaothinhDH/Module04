<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Thinh
  Date: 22/11/2023
  Time: 9:23 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%!
    Map<String,String> dic = new HashMap<String,String>();
%>
<%
    dic.put("hello","xin chào");
    dic.put("how","thế nào");
    dic.put("book","quyển vở");
    dic.put("computer","máy tính");

    String search = request.getParameter("search");
    String result = dic.get(search);
    PrintWriter printWriter = response.getWriter();
    if (result != null){
        printWriter.write("<h1>Vietnamese: "+search+"</h1>");
        printWriter.write("<h1>English: "+result+"</h1>");
    }else{
        printWriter.write("<h1>Not Found</h1>");
    }
%>

</body>
</html>
