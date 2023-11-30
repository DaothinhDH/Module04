package com.ra.model.dao;

import com.ra.model.entity.Category;
import com.ra.util.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAOImpl implements CategoryDAO{
    @Override
    public List<Category> findAll() {
        Connection connection =null;
        List<Category> categoryList = new ArrayList<>();
        try {
            connection = ConnectionDB.openConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT * FROM category");
            ResultSet resultSet = pstm.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getInt("id"));
                category.setCategoryName(resultSet.getString("name"));
                category.setStatus(resultSet.getBoolean("status"));
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConnectionDB.closeConection(connection);
        }
        return categoryList;
    }

    @Override
    public boolean saveOrUpdate(Category category) {
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            String sql = "INSERT INTO category(name, status) VALUES (?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,category.getCategoryName());
            statement.setBoolean(2,category.getStatus());
            int check = statement.executeUpdate();
            if (check > 0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConnectionDB.closeConection(connection);
        }
        return false;
    }

    @Override
    public Category findById(Integer integer) {
        List<Category> categoryList = findAll();
        for (Category category : categoryList) {
            if (category.getCategoryId() == integer){
                return category;
            }
        }
        return null;
    }

    @Override
    public void delete(Integer integer){
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            String sql = "DELETE FROM category WHERE(id=?)";
            PreparedStatement statement = null;
            statement = connection.prepareStatement(sql);
            statement.setInt(1, integer);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConnectionDB.closeConection(connection);
        }

    }
}
