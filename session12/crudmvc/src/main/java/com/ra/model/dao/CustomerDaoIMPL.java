package com.ra.model.dao;

import com.ra.model.entity.Customer;
import com.ra.model.until.ConectionDB;
import org.springframework.stereotype.Component;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@Component
public class CustomerDaoIMPL implements ICustomerDao{
    @Override
    public List<Customer> findByName(String name) {
        Connection connection = null;
        connection = ConectionDB.openConnection();
        List<Customer> customers = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_FIND_BY_NAME(?)}");
            callableStatement.setString(1,name);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(resultSet.getInt("id"));
                customer.setCustomerName(resultSet.getString("name"));
                customer.setAddress(resultSet.getString("address"));
                customer.setEmail(resultSet.getString("email"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConectionDB.closeConection(connection);
        }
        return customers;
    }

    @Override
    public List<Customer> findAll() {
        Connection connection = null;
        connection = ConectionDB.openConnection();
        List<Customer> customers = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_SHOW_LIST()}");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(resultSet.getInt("id"));
                customer.setCustomerName(resultSet.getString("name"));
                customer.setAddress(resultSet.getString("address"));
                customer.setEmail(resultSet.getString("email"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConectionDB.closeConection(connection);
        }
        return customers;
    }

    @Override
    public boolean save(Customer customer) {
        Connection connection = null;
        connection = ConectionDB.openConnection();
        int check;
        try {
            if (customer.getCustomerId() == 0) {
                CallableStatement callableStatement = connection.prepareCall("{CALL PROC_CREATE_CUSTOMER(?,?,?)}");
                callableStatement.setString(1, customer.getCustomerName());
                callableStatement.setString(2, customer.getAddress());
                callableStatement.setString(3, customer.getEmail());
                check = callableStatement.executeUpdate();
            }else {
                CallableStatement callableStatement = connection.prepareCall("{CALL PROC_UPDATE_CUSTOMER(?,?,?,?)}");
                callableStatement.setInt(1, customer.getCustomerId());
                callableStatement.setString(2, customer.getCustomerName());
                callableStatement.setString(3, customer.getAddress());
                callableStatement.setString(4, customer.getEmail());
                check = callableStatement.executeUpdate();
            }
            if (check>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConectionDB.closeConection(connection);
        }
        return false;
    }

    @Override
    public Customer findById(Integer integer) {
        Connection connection = null;
        Customer customer = new Customer();
        connection = ConectionDB.openConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_FIND_BY_ID(?)}");
            callableStatement.setInt(1, integer);
            ResultSet resultSet = callableStatement.executeQuery();
            if (resultSet.next()) {
                customer.setCustomerId(resultSet.getInt("id"));
                customer.setCustomerName(resultSet.getString("name"));
                customer.setAddress(resultSet.getString("address"));
                customer.setEmail(resultSet.getString("email"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConectionDB.closeConection(connection);
        }

        return customer;
    }
}
