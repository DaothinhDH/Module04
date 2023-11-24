package com.ra.baitap2;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int firstOperand = Integer.parseInt(request.getParameter("firstOperand"));
        int secondOperand = Integer.parseInt(request.getParameter("secondOperand"));
        int operator = Integer.parseInt(request.getParameter("operator"));
        int result = 0;
        if (operator == 1) {
            result = firstOperand + secondOperand;
        }else if (operator == 2) {
            result = firstOperand - secondOperand;
        }else if (operator == 3) {
            result = firstOperand * secondOperand;
        }else if (operator == 4) {
            result = firstOperand / secondOperand;
        }

        request.setAttribute("result",result);
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }
}