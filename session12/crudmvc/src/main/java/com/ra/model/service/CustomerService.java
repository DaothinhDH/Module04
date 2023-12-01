package com.ra.model.service;

import com.ra.model.entity.Customer;

import java.util.List;

public interface CustomerService extends IGenericDao<Customer,Integer> {
    List<Customer> findByName(String name);
}
