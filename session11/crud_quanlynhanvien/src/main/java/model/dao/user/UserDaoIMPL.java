package model.dao.user;

import model.entity.user.User;
import util.ConectionDB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoIMPL implements UserDAO{
    @Override
    public List<User> findAll() {
        Connection connection = null;
        List <User> userList = new ArrayList<>();
        try {
            connection = ConectionDB.oppenConection();
            CallableStatement callableStatement = connection.prepareCall("{CALL SHOW_USER()}");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                User user = new User();
                user.setUserId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("user_name"));
                user.setPhoneNumber(resultSet.getInt("phone"));
                user.setAddress(resultSet.getString("address"));
                user.setBirthday(resultSet.getDate("birthday"));
                user.setSex(resultSet.getBoolean("sex"));
                user.setSalary(resultSet.getFloat("salary"));
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConectionDB.closeConection(connection);
        }

        return userList;
    }

    @Override
    public boolean saveOrUpdate(User user) {
        Connection connection = null;
        int check;
        connection = ConectionDB.oppenConection();
        try {
            if (user.getUserId() == 0){
                CallableStatement callableStatement = connection.prepareCall("{CALL CREATE_USER(?,?,?,?,?,?)}");
                callableStatement.setString(1,user.getUsername());
                callableStatement.setInt(2,user.getPhoneNumber());
                callableStatement.setString(3,user.getAddress());
                callableStatement.setDate(4,user.getBirthday());
                callableStatement.setBoolean(5,user.isSex());
                callableStatement.setFloat(6,user.getSalary());
                check = callableStatement.executeUpdate();
            }else{
                CallableStatement callableStatement = connection.prepareCall("{CALL UPDATE_USER(?,?,?,?,?,?,?)}");
                callableStatement.setInt(1,user.getUserId());
                callableStatement.setString(2,user.getUsername());
                callableStatement.setInt(3,user.getPhoneNumber());
                callableStatement.setString(4,user.getAddress());
                callableStatement.setDate(5,user.getBirthday());
                callableStatement.setBoolean(6,user.isSex());
                callableStatement.setFloat(7,user.getSalary());
                check = callableStatement.executeUpdate();
            }
            if (check > 0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConectionDB.closeConection(connection);
        }
        return false;
    }

    @Override
    public User findById(Integer id) {
        Connection connection = null;
        User user = new User();
        connection = ConectionDB.oppenConection();
        try {
            CallableStatement callableStatement = connection.prepareCall("{CALL FIND_USER(?)}");
            callableStatement.setInt(1,id);
            ResultSet resultSet = callableStatement.executeQuery();
            if (resultSet.next()){
                user.setUserId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("user_name"));
                user.setPhoneNumber(resultSet.getInt("phone"));
                user.setAddress(resultSet.getString("address"));
                user.setBirthday(resultSet.getDate("birthday"));
                user.setSex(resultSet.getBoolean("sex"));
                user.setSalary(resultSet.getFloat("salary"));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConectionDB.closeConection(connection);
        }
        return user;
    }

    @Override
    public List<User> findByIdName(String name) {
        return null;
    }
}
