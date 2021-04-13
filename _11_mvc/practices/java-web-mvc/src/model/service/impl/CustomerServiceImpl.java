package model.service.impl;

import model.bean.Customer;
import model.responsitory.CustomerResponsitory;
import model.responsitory.impl.CustomerResponsitoryImpl;
import model.service.CustomerService;

import java.util.List;


public class CustomerServiceImpl implements CustomerService {

    private CustomerResponsitory customerResponsitory = new CustomerResponsitoryImpl();

    @Override
    public List<Customer> findAll() {
        return this.customerResponsitory.findAll();
    }

    @Override
    public void save(Customer customer) {
        this.customerResponsitory.save(customer);
    }

    @Override
    public Customer findById(int id) {
        return this.customerResponsitory.findById(id);
    }

    @Override
    public void update(int id, Customer customer) {
        this.customerResponsitory.update(id,customer);
    }

    @Override
    public void remove(int id) {
        this.customerResponsitory.remove(id);
    }
}
