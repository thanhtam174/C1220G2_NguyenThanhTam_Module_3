package model.responsitory;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerResponsitory {

    List<Customer> findAll();

    boolean delete(Integer id);

    Customer findById(Integer id);

    boolean update(Customer customer);

    boolean create(Customer customer);

}
