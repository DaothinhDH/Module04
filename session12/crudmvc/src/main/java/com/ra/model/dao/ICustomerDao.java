package com.ra.model.dao;

import com.ra.model.entity.Customer;

import java.util.List;

public interface ICustomerDao extends IGenericDao<Customer,Integer>{
    List<Customer> findByName(String name);
}
