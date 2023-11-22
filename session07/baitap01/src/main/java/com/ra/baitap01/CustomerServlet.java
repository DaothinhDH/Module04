    package com.ra.baitap01;

    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import java.io.IOException;
    import java.util.ArrayList;
    import java.util.List;

    @WebServlet(name = "CustomerServlet",value = "/custommer")

    public class CustomerServlet extends HttpServlet {

        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            List <Customer> customers = new ArrayList<>();
            customers.add(new Customer("Anh béo","1/1/2011","Hà Nội","https://phunugioi.com/wp-content/uploads/2021/11/Hinh-anh-Lisa-Blackpink-bui-toc-2-ben.jpg"));
            customers.add(new Customer("Anh béo","1/1/2011","Hà Nội","https://phunugioi.com/wp-content/uploads/2021/11/Hinh-anh-Lisa-Blackpink-bui-toc-2-ben.jpg"));
            customers.add(new Customer("Anh béo","1/1/2011","Hà Nội","https://phunugioi.com/wp-content/uploads/2021/11/Hinh-anh-Lisa-Blackpink-bui-toc-2-ben.jpg"));
            customers.add(new Customer("Anh béo","1/1/2011","Hà Nội","https://phunugioi.com/wp-content/uploads/2021/11/Hinh-anh-Lisa-Blackpink-bui-toc-2-ben.jpg"));
            request.setAttribute("customers" ,customers);
            request.getRequestDispatcher("customers.jsp").forward(request,response);
        }



    }
