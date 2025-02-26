import java.util.Scanner;

public class TemperatureClassifier {
    public static void main(String[] args) {
        // Create a Scanner object to read input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter temperature
        System.out.print("Enter the temperature in Celsius: ");
        int temperature = scanner.nextInt();
        String message;

        // Determine the temperature message
        if (temperature < 0) {
            message = "FREEZING";
        } else if (temperature >= 0 && temperature <= 15) {
            message = "COLD";
        } else if (temperature >= 16 && temperature <= 30) {
            message = "WARM";
        } else if (temperature >= 31 && temperature <= 40) {
            message = "HOT";
        } else {
            message = "VERY HOT";
        }

        // Display the temperature message
        System.out.println("Temperature status: " + message);
    }
}
