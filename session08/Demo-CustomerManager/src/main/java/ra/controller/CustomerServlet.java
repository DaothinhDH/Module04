package ra.controller;

import ra.model.Customer;
import ra.service.customer.CustomerServiceIMPL;
import ra.service.customer.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                fromCreateCustomer(req, resp);
                break;
            case "edit":
                fromEditCustomer(req, resp);
                break;
            case "delete":
                deleteCustomer(req, resp);
                break;
            case "search":
                searchCustomer(req, resp);
                break;
            default:
                showListCustomer(req, resp);
        }
    }

    private void searchCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("search");
        List <Customer> searchList = customerService.findByName(name);
        req.setAttribute("customers", searchList);
        req.setAttribute("searchname", name);
        req.getRequestDispatcher("WEB-INF/view/customer/list.jsp").forward(req, resp);
    }

    private void deleteCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idDelete = Integer.parseInt(req.getParameter("id"));
        customerService.deleteById(idDelete);
        showListCustomer(req,resp);
    }

    private void fromEditCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idEdit = Integer.parseInt(req.getParameter("id"));
        Customer customerEdit = customerService.findById(idEdit);
        req.setAttribute("customer", customerEdit);
        req.getRequestDispatcher("WEB-INF/view/customer/edit.jsp").forward(req, resp);

    }


    private void fromCreateCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/view/customer/create.jsp").forward(req, resp);
    }

    public void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customers", customerList);
        request.getRequestDispatcher("WEB-INF/view/customer/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                actionCreateCustomer(req, resp);
                break;
            case "edit":
                actionEditCustomer(req, resp);
                break;
            default:

        }

    }

    private void actionEditCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idEdit = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String email = req.getParameter("email");
        Customer customerEdit = customerService.findById(idEdit);
        customerEdit.setCustomerName(name);
        customerEdit.setAddress(address);
        customerEdit.setEmail(email);
        customerService.save(customerEdit);
        showListCustomer(req, resp);
    }

    private void actionCreateCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = customerService.getNewId();
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String email = req.getParameter("email");
        Customer customer = new Customer(id, name, address, email);
        customerService.save(customer);
        showListCustomer(req, resp);
    }


}
