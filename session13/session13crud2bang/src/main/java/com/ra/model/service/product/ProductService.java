package com.ra.model.service.product;

import com.ra.model.entity.Category;
import com.ra.model.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {
    List<Product> findAll();
    Category findById(Integer id);
    boolean saveOrUpdate(Category category);
    void delete(Integer id);

}
