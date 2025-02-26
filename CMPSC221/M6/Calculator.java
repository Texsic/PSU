import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Calculator implements ActionListener {
    private static JTextField inputBox;
    private double memoryValue = 0.0;
    private String base = "";
    private boolean isExponentMode = false;

    public Calculator() {}

    public static void main(String[] args) {
        createWindow();
    }

    private static void createWindow() {
        JFrame frame = new JFrame("Calculator");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        createUI(frame);
        frame.setSize(400, 600);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }

    private static void createUI(JFrame frame) {
        JPanel panel = new JPanel();
        Calculator calculator = new Calculator();
        GridBagLayout layout = new GridBagLayout();
        GridBagConstraints gbc = new GridBagConstraints();
        panel.setLayout(layout);

        Color buttonBackgroundColor = Color.WHITE;
        Color operationButtonColor = new Color(255, 204, 102);
        Color specialButtonColor = new Color(224, 224, 224);
        Color displayColor = new Color(245, 245, 245);

        inputBox = new JTextField("", 20);
        inputBox.setEditable(false);
        inputBox.setHorizontalAlignment(JTextField.RIGHT);
        inputBox.setFont(new Font("Arial", Font.PLAIN, 24));
        inputBox.setBackground(displayColor);
        inputBox.setBorder(BorderFactory.createLineBorder(Color.BLACK));

        String[] buttonLabels = {
                "mc", "mr", "m-", "m+",
                "AC", "√x", "%", "÷",
                "7", "8", "9", "×",
                "4", "5", "6", "-",
                "1", "2", "3", "+",
                "0", ".", "+/-", "=",
                "π", "xy", "R2", "R0"
        };

        for (int i = 0; i < buttonLabels.length; i++) {
            JButton button = new JButton(buttonLabels[i]);
            button.setFont(new Font("Arial", Font.PLAIN, 18));
            button.setFocusPainted(false);

            if (buttonLabels[i].matches("[0-9]") || buttonLabels[i].equals(".")) {
                button.setBackground(buttonBackgroundColor);
                button.setForeground(Color.BLACK);
            } else if (buttonLabels[i].matches("[+\\-×÷=]")) {
                button.setBackground(operationButtonColor);
                button.setForeground(Color.BLACK);
            } else {
                button.setBackground(specialButtonColor);
                button.setForeground(Color.BLACK);
            }

            button.addActionListener(calculator);
            gbc.gridx = i % 4;
            gbc.gridy = (i / 4) + 1;
            gbc.fill = GridBagConstraints.HORIZONTAL;
            gbc.ipady = 20;
            gbc.ipadx = 20;
            panel.add(button, gbc);
        }

        gbc.gridwidth = 4;
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel.add(inputBox, gbc);

        frame.getContentPane().add(panel, BorderLayout.CENTER);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String command = e.getActionCommand();

        switch (command) {
            case "C":
                inputBox.setText("");
                break;
            case "=":
                if (isExponentMode) {
                    inputBox.setText(evaluate(base + "^" + inputBox.getText()));
                    isExponentMode = false;
                } else {
                    inputBox.setText(evaluate(inputBox.getText()));
                }
                break;
            case "xy":
                base = inputBox.getText();
                inputBox.setText("");
                isExponentMode = true;
                break;
            case "mc":
                memoryValue = 0;
                break;
            case "mr":
                inputBox.setText(String.valueOf(memoryValue));
                break;
            case "m+":
                memoryValue += Double.parseDouble(inputBox.getText());
                break;
            case "m-":
                memoryValue -= Double.parseDouble(inputBox.getText());
                break;
            case "+/-":
                inputBox.setText(String.valueOf(-Double.parseDouble(inputBox.getText())));
                break;
            case "AC":
                inputBox.setText("");
                memoryValue = 0;
                break;
            case "√x":
                inputBox.setText(String.valueOf(Math.sqrt(Double.parseDouble(inputBox.getText()))));
                break;
            case "%":
                inputBox.setText(String.valueOf(Double.parseDouble(inputBox.getText()) / 100));
                break;
            case "π":
                inputBox.setText(String.valueOf(Math.PI));
                break;
            case "R2":
                inputBox.setText(String.format("%.2f", Double.parseDouble(inputBox.getText())));
                break;
            case "R0":
                inputBox.setText(String.format("%.0f", Double.parseDouble(inputBox.getText())));
                break;
            default:
                inputBox.setText(inputBox.getText() + command);
                break;
        }
    }

    private static String evaluate(String expression) {
        double result = 0;
        if (expression.contains("^")) {
            String[] parts = expression.split("\\^");
            double base = Double.parseDouble(parts[0]);
            double exponent = Double.parseDouble(parts[1]);
            result = Math.pow(base, exponent);
        } else {
            char[] arr = expression.toCharArray();
            String operand1 = "";
            String operand2 = "";
            String operator = "";
            for (int i = 0; i < arr.length; i++) {
                if (arr[i] >= '0' && arr[i] <= '9' || arr[i] == '.') {
                    if (operator.isEmpty()) {
                        operand1 += arr[i];
                    } else {
                        operand2 += arr[i];
                    }
                }
                if (arr[i] == '+' || arr[i] == '-' || arr[i] == '×' || arr[i] == '÷') {
                    operator += arr[i];
                }
            }
            switch (operator) {
                case "+":
                    result = Double.parseDouble(operand1) + Double.parseDouble(operand2);
                    break;
                case "-":
                    result = Double.parseDouble(operand1) - Double.parseDouble(operand2);
                    break;
                case "×":
                    result = Double.parseDouble(operand1) * Double.parseDouble(operand2);
                    break;
                case "÷":
                    result = Double.parseDouble(operand1) / Double.parseDouble(operand2);
                    break;
            }
        }
        return String.valueOf(result);
    }
}
