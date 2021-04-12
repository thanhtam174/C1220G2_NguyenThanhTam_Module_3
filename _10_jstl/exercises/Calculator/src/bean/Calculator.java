package bean;

public class Calculator {
    public static Double calculate(Double firstOperand, Double secondOperand, String operator){

        switch (operator){
            case "Addition":
                return firstOperand+secondOperand;
            case "Subtraction":
                return firstOperand-secondOperand;
            case "Multiplication":
                return firstOperand*secondOperand;
            case "Division":
                if (secondOperand != 0){
                    return firstOperand/secondOperand;
                }else {
                    throw new RuntimeException("Can't divide by zero");
                }
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
