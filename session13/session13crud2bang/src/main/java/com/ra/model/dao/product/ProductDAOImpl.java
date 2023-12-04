package com.ra.model.dao.product;

import com.ra.model.entity.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO{

    @Override
    public List<Category> findAll() {
        return null;
    }

    @Override
    public Category findById(Integer id) {
        return null;
    }

    @Override
    public boolean saveOrUpdate(Category category) {
        return false;
    }

    @Override
    public void delete(Integer id) {

    }
}
