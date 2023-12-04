package com.ra.model.dao.category;

import com.ra.model.dao.category.CategoryDAO;
import com.ra.model.entity.Category;
import com.ra.util.ConnectionDatabase;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository

public class CategoryDAOImpl implements CategoryDAO {
    @Override
    public List<Category> findAll() {
        Connection connection = ConnectionDatabase.openConnection();
        List<Category> categoryList = new ArrayList<>();
        try {
            CallableStatement statement = connection.prepareCall("{CALL proc_show_list_category()}");
            ResultSet resultSet = statement.executeQuery();
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getInt("id"));
                category.setCategoryName(resultSet.getString("name"));
                category.setCategoryStatus(resultSet.getBoolean("status"));
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConnectionDatabase.closeConnection(connection);
        }
        return categoryList;
    }

    @Override
    public Category findById(Integer id) {
        Connection connection = null;
        Category category = new Category();
        connection = ConnectionDatabase.openConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_FIND_BY_ID(?)}");
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            if (resultSet.next()){
                category.setCategoryId(resultSet.getInt("id"));
                category.setCategoryName(resultSet.getString("name"));
                category.setCategoryStatus(resultSet.getBoolean("status"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConnectionDatabase.closeConnection(connection);
        }
        return category;
    }

    @Override
    public boolean saveOrUpdate(Category category) {
        Connection connection = null;
        connection = ConnectionDatabase.openConnection();
        int check;
        try {
         if (category.getCategoryId() == 0){
             CallableStatement callableStatement = connection.prepareCall("{CALL PROC_ADD_CATEGORY(?) }");
             callableStatement.setString(1,category.getCategoryName());
             check = callableStatement.executeUpdate();
         }else{
             CallableStatement callableStatement = connection.prepareCall("{CALL PROC_UPDATE_CATEGORY(?,?,?)}");
             callableStatement.setString(1,category.getCategoryName());
             callableStatement.setBoolean(2,category.isCategoryStatus());
             callableStatement.setInt(3,category.getCategoryId());
             check = callableStatement.executeUpdate();
         }
         if (check > 0 ){
             return true;
         }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConnectionDatabase.closeConnection(connection);
        }
        return false;
    }

    @Override
    public void delete(Integer id) {

    }
}
