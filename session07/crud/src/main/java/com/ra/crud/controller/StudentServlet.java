package com.ra.crud.controller;

import com.ra.crud.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "studentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private final List<Student> students = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        students.add(new Student("B11", "Anh béo", "Bình Dương", 18, "10a", true));
        students.add(new Student("B12", "Anh béo", "Bình Dương", 18, "10b", true));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // lấy về action  System.out.println(req.getParameter("action"));
        String action = req.getParameter("action");
        if (action == null) {
            showStudent(req, resp);
        } else {
            switch (action) {
                case "add":
                    // điều hướng về view add (form thên mới);
                    resp.sendRedirect("views/add-student.jsp");
                    break;
                case "edit":
                    // lấy về id trên url
                    String studentCode = req.getParameter("id");
                    Student student = findByStudentCode(studentCode);
                    req.setAttribute("student",student);
                    req.getRequestDispatcher("views/edit-student.jsp").forward(req,resp);
                    break;
                case "delete":
                    String studentCodeDelete = req.getParameter("id");
                    Student studentDelete = findByStudentCode(studentCodeDelete);
                    students.remove(studentDelete);
                    showStudent(req,resp);
                    break;
                default:

            }
        }


    }

    public void showStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("students", students);
        req.getRequestDispatcher("views/student.jsp").forward(req, resp);
    }

    public Student findByStudentCode(String id){
        for (Student student : students) {
            if (student.getStudentCode().equals(id)){
                return student;
            }
        }
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        String studentCode = req.getParameter("studentCode");
        String studentName = req.getParameter("studentName");
        int age = Integer.parseInt(req.getParameter("age"));
        Boolean sex = Boolean.valueOf(req.getParameter("sex"));
        String classRoom = req.getParameter("classRoom");
        String address = req.getParameter("address");

        if (action == null){
            Student student = new Student(studentCode, studentName,address,age,classRoom,sex);
            students.add(student);
        }else{
            Student studentEdit = findByStudentCode(studentCode);
            studentEdit.setStudentName(studentName);
            studentEdit.setAddress(address);
            studentEdit.setAge(age);
            studentEdit.setClassRoom(classRoom);
            studentEdit.setSex(sex);
        }
        showStudent(req,resp);
    }
}
