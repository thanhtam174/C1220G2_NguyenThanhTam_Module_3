package model.responsitory;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface UserReponsitory {

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public List<User> search(String country);

    public User getUserById(int id);

    public void insertUserStore(User user) throws SQLException;

    public void addUserTransaction(User user, int[] permision);

    public void insertUpdateWithoutTransaction();

}
