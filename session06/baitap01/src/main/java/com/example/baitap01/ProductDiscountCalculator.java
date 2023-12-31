package com.example.baitap01;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class ProductDiscountCalculator extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) {

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException, ServletException {
        String description = req.getParameter("description");
        double list_price = Double.parseDouble(req.getParameter("discount_amount"));
        double discount_percent = Double.parseDouble(req.getParameter("discountPrice"));

        double discount_amount = list_price * discount_percent * 0.01;
        double discountPrice = list_price - discount_amount;

        req.setAttribute("discount_amount",discount_amount);
        req.setAttribute("discountPrice",discountPrice);
        req.getRequestDispatcher("discount.jsp").forward(req,resp);
    }

    public void destroy() {

    }

}
