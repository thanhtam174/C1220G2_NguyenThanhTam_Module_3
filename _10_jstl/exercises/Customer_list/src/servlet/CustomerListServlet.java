package servlet;

import bean.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "servlet.CustomerListServlet", urlPatterns = {"","/customerList"})
public class CustomerListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> listCustomer = new ArrayList<>();
        listCustomer.add(new Customer("Mai Văn Hoàn","1983/08/20","Hà Nội","https://img.lovepik.com/element/40058/1049.png_860.png"));
        listCustomer.add(new Customer("Nguyễn Văn Nam","1983/08/21","Bắc Giang","https://icdn.dantri.com.vn/k:72b62a2872/2015/11/19/thay-giao1-1447903697979/the-he-8x-9x-thay-doi-hinh-anh-nguoi-lam-nghe-day-hoc.jpg"));
        listCustomer.add(new Customer("Nguyễn Thái Hòa","1983/08/22","Nam Định","https://chuathanhlangson.com/uploads/news/2019_01/001_51.jpg"));
        listCustomer.add(new Customer("Trần Đăng Khoa","1983/08/17","Hà Tây","https://img.lovepik.com/photo/50036/6498.jpg_wh860.jpg"));
        listCustomer.add(new Customer("Nguyễn Đình Thi","1983/08/19","Hà Nội","https://c8n8e4j6.rocketcdn.me/wp-content/uploads/2017/03/b1-1.jpg"));

        request.setAttribute("listCustomer",listCustomer);
        request.getRequestDispatcher("customer-list.jsp").forward(request,response);
    }
}
