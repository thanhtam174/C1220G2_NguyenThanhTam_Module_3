package servlet;

import bean.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "servlet.CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double firstOperand = Double.parseDouble(request.getParameter("first_operand"));
        Double secondOperand = Double.parseDouble(request.getParameter("second_operand"));
        String operator = request.getParameter("operator");
        Double result = Calculator.calculate(firstOperand,secondOperand,operator);

        request.setAttribute("result",result);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
