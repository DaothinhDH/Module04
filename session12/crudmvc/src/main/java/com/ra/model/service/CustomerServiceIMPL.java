package com.ra.model.service;

import com.ra.model.dao.CustomerDaoIMPL;
import com.ra.model.dao.ICustomerDao;
import com.ra.model.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceIMPL implements CustomerService {
//    ICustomerDao customerDao = new CustomerDaoIMPL();
    @Autowired
    ICustomerDao customerDao;
    @Override
    public List<Customer> findByName(String name) {
        return customerDao.findByName(name);
    }

    @Override
    public List<Customer> findAll() {

        return customerDao.findAll();
    }

    @Override
    public boolean save(Customer customer) {
        return customerDao.save(customer);
    }

    @Override
    public Customer findById(Integer id) {
        return customerDao.findById(id);
    }
}
