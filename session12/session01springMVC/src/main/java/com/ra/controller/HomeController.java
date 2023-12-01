package com.ra.controller;

import com.ra.entity.model.Acount;
import com.ra.entity.model.Student;
import com.ra.service.StudentService;
import com.ra.service.StudentServiceIMPL;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {
    private StudentService studentService = new StudentServiceIMPL();
    @RequestMapping(value = "/")
    public String home() {
        return "home";
    }

    @RequestMapping(value = "/student")
    public String student(Model model) {
        List<Student> students = studentService.findAll();
        model.addAttribute("list", students);
        return "student";
    }
    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }
    @RequestMapping(value = "/register")
    public String register(Model  model) {
        Acount acount = new Acount();
        model.addAttribute("acount", acount);
        return "register";
    }
//    @RequestMapping(value = "/register",method = RequestMethod.POST)
//    public String postRegister(){
//        return "home";
//    }
    @RequestMapping(value = "/post-register")
    public String postRegister(@ModelAttribute("Acount") Acount acount){
        System.out.println(acount.getEmail());
        System.out.println(acount.getPassword());
        return "home";
    }
}
