package model.responsitory.impl;

import model.bean.Customer;
import model.responsitory.CustomerResponsitory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerResponsitoryImpl implements CustomerResponsitory {

    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_managerment";
    private String jdbcUsername = "root";
    private String jdbcPassword = "thtam363";

    private static final String SQL_SELECT_ALL_CUSTOMER = "SELECT *" + "from customer";

    private static final String SQL_DELETE_CUSTOMER = "delete from customer where customer_id = ?;";
    private static final String SQL_SELECT_BY_ID = "select * from customer where customer_id = ?" ;
    private static final String SQL_UPDATE_CUSTOMER = "update customer set customer_type_id = ?, customer_name = ?,\n" +
            "            customer_birthday = ?, customer_gender = ?, customer_id_card =?, customer_phone = ?, customer_email = ?, " +
            "customer_address = ?\n" +
            "            where  customer_id = ?;" ;

    private static final String SQL_CREATE_CUSTOMER = "insert into customer \n" +
            "\tvalues\n" +
            "\t\t(?,?,?,?,?,?,?,?,?);";

    public CustomerResponsitoryImpl() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();

        try {
            Statement statement = this.getConnection().createStatement();

            ResultSet resultSet = statement.executeQuery(SQL_SELECT_ALL_CUSTOMER);

            Customer customer =null;



            while (resultSet.next()){

                customer = new Customer(resultSet.getString("customer_id"),resultSet.getString("customer_name"),
                        resultSet.getString("customer_birthday"),resultSet.getString("customer_id_card"),
                        resultSet.getString("customer_phone"),resultSet.getString("customer_email"),
                        resultSet.getString("customer_address"),resultSet.getString("customer_type_id"),
                        resultSet.getString("customer_gender"));

                customerList.add(customer);
            }



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }





        return customerList;
    }

    @Override
    public boolean delete(Integer id){
        boolean checkActionDelete = false;

        try {
            PreparedStatement preparedStatement = this.getConnection().prepareStatement(SQL_DELETE_CUSTOMER);

            preparedStatement.setInt(1,id);

            checkActionDelete = preparedStatement.executeUpdate()>0;


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return checkActionDelete;
    }

    @Override
    public Customer findById(Integer id) {
        Customer customer = null;

        try {
            PreparedStatement preparedStatement = this.getConnection().prepareStatement(SQL_SELECT_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();

            customer = new Customer(resultSet.getString("id"),resultSet.getString("name"),
                    resultSet.getString("date_of_birth"),resultSet.getString("id_card"),
                    resultSet.getString("phone"),resultSet.getString("email"),
                    resultSet.getString("address"),resultSet.getString("customer_type_id"),
                    resultSet.getString("gender"));



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return customer;
    }

    @Override
    public boolean update(Customer customer) {
        boolean checkUpdate = false;

        try {
            PreparedStatement preparedStatement = this.getConnection().prepareStatement(SQL_UPDATE_CUSTOMER);
            preparedStatement.setInt(9, Integer.parseInt(customer.getId()));
            preparedStatement.setString(1,customer.getCustomerType());
            preparedStatement.setString(2,customer.getName());
            preparedStatement.setString(3,customer.getDateOfBirth());
            preparedStatement.setInt(4, Integer.parseInt(customer.getGender()));
            preparedStatement.setString(5,customer.getIdCard());
            preparedStatement.setString(6,customer.getPhone());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getAddress());


            checkUpdate= preparedStatement.executeUpdate()>0;


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return checkUpdate;
    }

    @Override
    public boolean create(Customer customer) {
        boolean checkCreate = false;

        try {
            PreparedStatement preparedStatement = this.getConnection().prepareStatement(SQL_CREATE_CUSTOMER);
            preparedStatement.setInt(1, Integer.parseInt(customer.getId()));
            preparedStatement.setString(2,customer.getCustomerType());
            preparedStatement.setString(3,customer.getName());
            preparedStatement.setString(4,customer.getDateOfBirth());
            preparedStatement.setInt(5, Integer.parseInt(customer.getGender()));
            preparedStatement.setString(6,customer.getIdCard());
            preparedStatement.setString(7,customer.getPhone());
            preparedStatement.setString(8,customer.getEmail());
            preparedStatement.setString(9,customer.getAddress());


            checkCreate= preparedStatement.executeUpdate()>0;


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return checkCreate;
    }

}
