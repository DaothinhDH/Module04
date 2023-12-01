package com.ra.service;

import com.ra.entity.model.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentServiceIMPL implements StudentService{
    @Override
    public List<Student> findAll() {
        List<Student> students = new ArrayList<>();
        students.add(new Student(1,"Nguyễn văn A",18,true));
        students.add(new Student(2,"Nguyễn văn b",17,false));
        students.add(new Student(3,"Nguyễn văn c",17,true));
        students.add(new Student(4,"Nguyễn văn d",12,false));
        return students;
    }
}
