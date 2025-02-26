import java.util.Scanner;

public class GradeCalculatorSwitch {
    public static void main(String[] args) {
        // Create a Scanner object to read input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter marks
        System.out.print("Enter the marks (0-100): ");
        int marks = scanner.nextInt();
        char grade;

        // Determine the grade category based on the marks
        int category = (marks < 50) ? 0 :
                (marks <= 60) ? 1 :
                        (marks <= 70) ? 2 :
                                (marks <= 80) ? 3 :
                                        (marks <= 90) ? 4 : 5;

        // Determine the grade based on the category using switch
        switch (category) {
            case 0:
                grade = 'F';
                break;
            case 1:
                grade = 'E';
                break;
            case 2:
                grade = 'D';
                break;
            case 3:
                grade = 'C';
                break;
            case 4:
                grade = 'B';
                break;
            case 5:
                grade = 'A';
                break;
            default:
                grade = 'F'; // Default case should never be hit
                break;
        }

        // Display the grade
        System.out.println("Grade: " + grade);
    }
}
