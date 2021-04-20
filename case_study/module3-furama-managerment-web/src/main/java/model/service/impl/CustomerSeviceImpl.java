package model.service.impl;

import model.bean.Customer;
import model.responsitory.CustomerResponsitory;
import model.responsitory.impl.CustomerResponsitoryImpl;
import model.service.CustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerSeviceImpl implements CustomerService {
    private CustomerResponsitory customerResponsitory = new CustomerResponsitoryImpl();
    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = this.customerResponsitory.findAll();

        for  ( int i = 0; i< customerList.size(); i++){

            if ("1".equals(customerList.get(i).getGender())){

                customerList.get(i).setGender("Male");
            }else {
                customerList.get(i).setGender("Female");
            }

            String typeCustomer= customerList.get(i).getCustomerType();

            switch (typeCustomer){

                case "1":
                    customerList.get(i).setCustomerType("Diamond");
                    break;
                case "2":
                    customerList.get(i).setCustomerType("Platinum");
                    break;
                case "3":
                    customerList.get(i).setCustomerType("Gold");
                    break;
                case "4":
                    customerList.get(i).setCustomerType("Silver");
                    break;
                default:
                    customerList.get(i).setCustomerType("Member");
                    break;
            }


        }


        return customerList;

    }

    @Override
    public boolean delete(Integer id) {
       return this.customerResponsitory.delete(id);
    }

    @Override
    public Customer findById(Integer id) {
        Customer customer = this.customerResponsitory.findById(id);

        if ("1".equals(customer.getGender())){

            customer.setGender("Male");
        }else {
            customer.setGender("Female");
        }

        String typeCustomer= customer.getCustomerType();

        switch (typeCustomer){

            case "1":
                customer.setCustomerType("Diamond");
                break;
            case "2":
                customer.setCustomerType("Platinum");
                break;
            case "3":
                customer.setCustomerType("Gold");
                break;
            case "4":
                customer.setCustomerType("Silver");
                break;
            default:
                customer.setCustomerType("Member");
                break;
        }



        return customer;
    }

    @Override
    public boolean update(Customer customer) {
        Customer customerRepo= customer;

        String gender = customerRepo.getGender().toLowerCase();

        if ("male".equals(gender)){
            customerRepo.setGender("1");
        }else {
            customerRepo.setGender("0");
        }

        String customerType = customerRepo.getCustomerType().toLowerCase();

        switch (customerType) {
            case "diamond":
                customerRepo.setCustomerType("1");
                break;
            case "platinum":
                customerRepo.setCustomerType("2");
                break;
            case "gold":
                customerRepo.setCustomerType("3");
                break;
            case "silver":
                customerRepo.setCustomerType("4");
                break;
            default:
                customerRepo.setCustomerType("5");
                break;
        }
        return this.customerResponsitory.update(customerRepo);
    }

    @Override
    public boolean create(Customer customer) {
        Customer customerRepo= customer;


        String gender = customerRepo.getGender().toLowerCase();

        if ("male".equals(gender)){
            customerRepo.setGender("1");
        }else {
            customerRepo.setGender("0");
        }

        String customerType = customerRepo.getCustomerType().toLowerCase();

        switch (customerType) {
            case "diamond":
                customerRepo.setCustomerType("1");
                break;
            case "platinum":
                customerRepo.setCustomerType("2");
                break;
            case "gold":
                customerRepo.setCustomerType("3");
                break;
            case "silver":
                customerRepo.setCustomerType("4");
                break;
            default:
                customerRepo.setCustomerType("5");
                break;
        }


        return this.customerResponsitory.create(customerRepo);
    }

}
