import java.util.Scanner;

public class GradeCalculator {
    public static void main(String[] args) {
        // Create a Scanner object to read input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter marks
        System.out.print("Enter the marks (0-100): ");
        int marks = scanner.nextInt();
        String grade;

        // Determine the grade based on the marks
        if (marks < 50) {
            grade = "F";
        } else if (marks >= 50 && marks <= 60) {
            grade = "E";
        } else if (marks >= 61 && marks <= 70) {
            grade = "D";
        } else if (marks >= 71 && marks <= 80) {
            grade = "C";
        } else if (marks >= 81 && marks <= 90) {
            grade = "B";
        } else {
            grade = "A";
        }

        // Display the grade
        System.out.println("Grade: " + grade);
    }
}
