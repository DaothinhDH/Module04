package com.example.demo1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "demoServlet",value = "/demo-Servlet")
public class DemoServlet extends HttpServlet {
    @Override
    public  void init()throws ServletException {
        System.out.println("khoi tao");
    }

    @Override
    public void doGet(HttpServletRequest reg, HttpServletResponse resp) throws ServletException {
        System.out.println("ok ok ok");
    }
    @Override
    public void destroy() {
        System.out.println("hủy servlet");
    }

}

