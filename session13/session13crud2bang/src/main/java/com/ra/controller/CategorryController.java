package com.ra.controller;

import com.ra.model.entity.Category;
import com.ra.model.service.category.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class CategorryController {
    @Autowired
    private CategoryService categoryService;
    @RequestMapping("/category")
    public String index (Model model) {
        List<Category> list = categoryService.findAll();
        model.addAttribute("category", list);
        return "category/index";
    }

    @GetMapping("/category-add")
    public String addCategory (Model model){
        Category category = new Category();
        model.addAttribute("add", category);
        return "category/add";
    }
    @PostMapping("/create-category")
    public String createCategory (@ModelAttribute ("add") Category category, RedirectAttributes redirectAttributes){
        categoryService.saveOrUpdate(category);
        redirectAttributes.addFlashAttribute("mess","Theme moi ok");
        return "redirect:/category";
    }

    @GetMapping("category/edit/{id}")
    public String editCategory (@PathVariable("id") Integer id,Model model){
        Category category = categoryService.findById(id);
        model.addAttribute("edit", category);
        return "category/edit";
    }
    @PostMapping("category-update")
    public String categoryUpdate(@ModelAttribute("edit")Category category,RedirectAttributes redirectAttributes){
        categoryService.saveOrUpdate(category);
        redirectAttributes.addFlashAttribute("mess","Sửa Thành công");
        return "redirect:/category";
    }



}
