package model.service.user;

import model.dao.user.UserDAO;
import model.dao.user.UserDaoIMPL;
import model.entity.user.User;

import java.util.List;

public class UserServiceIMPL implements UserService {
    private UserDAO userDAO = new UserDaoIMPL();

    @Override
    public List<User> findAll() {
        return userDAO.findAll();
    }

    @Override
    public boolean saveOrUpdate(User user) {
        return userDAO.saveOrUpdate(user);
    }

    @Override
    public User findById(Integer id) {
        return userDAO.findById(id);
    }

    @Override
    public List<User> findByIdName(String name) {
        return null;
    }
}
