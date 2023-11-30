package controller;

import model.entity.user.User;
import model.service.user.UserService;
import model.service.user.UserServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "UserController", value = "/users")
public class UserController extends HttpServlet {
    private UserService userService = new UserServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            showListUser(request, response);
        }
        switch (action) {
            case "create":
                response.sendRedirect("views/user/create_user.jsp");
                break;
            case "update":
                int idEdit = Integer.parseInt(request.getParameter("id"));
                User user = userService.findById(idEdit);
                request.setAttribute("update",user);
                request.getRequestDispatcher("views/user/update_user.jsp").forward(request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        User user = new User();
        user.setUsername(request.getParameter("name"));
        user.setPhoneNumber(Integer.parseInt(request.getParameter("phone")));
        user.setAddress(request.getParameter("address"));
        user.setBirthday(Date.valueOf(request.getParameter("birthday")));
        user.setSex(Boolean.parseBoolean(request.getParameter("sex")));
        user.setSalary(Float.parseFloat(request.getParameter("salary")));
        if (request.getParameter("id") != null){
            user.setUserId(Integer.parseInt(request.getParameter("id")));
        }
        if (userService.saveOrUpdate(user)){
            showListUser(request, response);
        }
    }

    public void showListUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.findAll();
        request.setAttribute("list", userList);
        request.getRequestDispatcher("views/user/user.jsp").forward(request, response);


    }
}