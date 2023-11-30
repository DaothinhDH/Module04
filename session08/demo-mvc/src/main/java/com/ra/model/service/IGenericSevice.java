package com.ra.model.service;

import java.util.List;

public interface IGenericSevice <T ,ID>{
    List<T> findAll();
    boolean saveOrUpdate(T t);
    T findById(ID id);
    void delete(ID id);
}
