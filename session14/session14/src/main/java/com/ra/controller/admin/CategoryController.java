package com.ra.controller.admin;

import com.ra.model.entity.Category;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class CategoryController {
    @RequestMapping("/category")
    public String index(){
        return "admin/category/index";
    }
    @GetMapping("/category")
    public String index(Model model){
        List<Category> list = new ArrayList<>();
        list.add(new Category(1,"ca1",true));
        list.add(new Category(2,"ca2",true));
        list.add(new Category(3,"ca3",true));
        model.addAttribute("list",list);
        return "admin/category/index";
    }

    @PostMapping("/category")
    public String add(){
        return "admin/category/add";
    }
}
