import java.util.Scanner;

public class TemperatureClassifierSwitch {
    public static void main(String[] args) {
        // Create a Scanner object to read input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter temperature
        System.out.print("Enter the temperature in Celsius: ");
        int temperature = scanner.nextInt();
        String message;

        // Determine the temperature message based on range
        switch ((temperature < 0) ? -1 : (temperature <= 15) ? 0 : (temperature <= 30) ? 1 : (temperature <= 40) ? 2 : 3) {
            case -1:
                message = "FREEZING";
                break;
            case 0:
                message = "COLD";
                break;
            case 1:
                message = "WARM";
                break;
            case 2:
                message = "HOT";
                break;
            default:
                message = "VERY HOT";
                break;
        }

        // Display the temperature message
        System.out.println("Temperature status: " + message);
    }
}
