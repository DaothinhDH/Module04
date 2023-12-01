package com.ra.model.service;

import java.util.List;

public interface IGenericDao <T,ID>{
    List<T> findAll();
    boolean save(T t);
    T findById(ID id);

}
