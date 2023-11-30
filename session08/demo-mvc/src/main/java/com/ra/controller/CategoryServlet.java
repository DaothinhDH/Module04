package com.ra.controller;

import com.ra.model.entity.Category;
import com.ra.model.service.CategoryService;
import com.ra.model.service.CategorySeviceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/danh-muc")
public class CategoryServlet extends HttpServlet {
    private CategoryService categoryService = new CategorySeviceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            showList(request, response);
        }
        switch (action) {
            case "add":
                response.sendRedirect("views/add-category.jsp");
                break;
            case "edit":
                int  id = Integer.parseInt(request.getParameter("category"));
                Category category = categoryService.findById(id);
                request.setAttribute("category",category);
                request.getRequestDispatcher("views/edit.jsp").forward(request,response);
                break;
            case "delete":
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            // lay du lieu
            Category category =  new Category();
            category.setCategoryName(request.getParameter("categoryName"));
            category.setStatus(Boolean.parseBoolean(request.getParameter("status")));
            if (categoryService.saveOrUpdate(category)){
                showList(request, response);
            }
            response.sendRedirect("views/add-category.js?err");
        }
        if (action.equals("edit")){
            editCategory(request,response);
        }

    }

    private void editCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idEdit = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("categoryName");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        Category category = new Category(idEdit, name, status);
        if (categoryService.saveOrUpdate(category)){
            showList(request, response);
        }else {
            response.sendRedirect("views/add-category.js?err");
        }
    }

    public void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> list = categoryService.findAll();
        request.setAttribute("list", list);
        request.getRequestDispatcher("views/category.jsp").forward(request, response);

    }
}