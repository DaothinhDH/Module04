package com.ra.model.dao.product;

import com.ra.model.entity.Category;

import java.util.List;

public interface ProductDAO {
    List<Category> findAll();
    Category findById(Integer id);
    boolean saveOrUpdate(Category category);
    void delete(Integer id);
}
