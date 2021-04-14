package model.sevice.impl;

import model.bean.User;
import model.responsitory.UserReponsitory;
import model.responsitory.impl.UserReponsitoryImpl;
import model.sevice.UserSevice;

import java.sql.SQLException;
import java.util.List;

public class UserSeviceImpl implements UserSevice {
    private UserReponsitory userReponsitory = new UserReponsitoryImpl();
    @Override
    public void insertUser(User user) throws SQLException {
        this.userReponsitory.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return this.userReponsitory.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return this.userReponsitory.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return this.userReponsitory.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return this.userReponsitory.updateUser(user);
    }

    @Override
    public List<User> search(String country) {
        return this.userReponsitory.search(country);
    }
}
