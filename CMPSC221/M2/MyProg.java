import java.util.Scanner;

public class MyProg {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        // Accept user inputs
        System.out.println("Enter name:");
        String name = input.nextLine();
        System.out.println("Enter age:");
        int age = input.nextInt();
        input.nextLine(); // Consume newline
        System.out.println("Enter company name:");
        String companyName = input.nextLine();

        // Create Accountant object and display details
        Accountant accountant = new Accountant(name, age, companyName);
        accountant.displayDetails();
        accountant.printSalary();

        input.close();
    }
}
