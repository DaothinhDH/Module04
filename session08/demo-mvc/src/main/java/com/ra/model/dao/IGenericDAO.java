package com.ra.model.dao;

import java.sql.SQLException;
import java.util.List;

public interface IGenericDAO <T,ID>{
    List<T> findAll();
    boolean saveOrUpdate(T t);
    T findById(ID id);
    void delete(ID id) throws SQLException;


}
