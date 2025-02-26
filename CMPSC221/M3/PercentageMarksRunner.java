import java.util.Scanner;

public class PercentageMarksRunner {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        // Input for student 1
        System.out.println("Enter marks for Student 1:");
        PercentageMarks student1 = createStudent(input);

        // Input for student 2
        System.out.println("Enter marks for Student 2:");
        PercentageMarks student2 = createStudent(input);

        // Compute percentages
        student1.computePercentage();
        student2.computePercentage();

        // Display percentages
        System.out.println("Student 1 Percentage: " + student1.getPercentageMarks());
        System.out.println("Student 2 Percentage: " + student2.getPercentageMarks());

        // Compare percentages
        float highestPercentage = comparePercentages(student1, student2);
        System.out.println("Highest Percentage: " + highestPercentage);

        // Display obtained marks sum
        System.out.println("Student 1 Obtained Marks Sum: " + student1.getObtainedMarksSum());
        System.out.println("Student 2 Obtained Marks Sum: " + student2.getObtainedMarksSum());
    }

    private static PercentageMarks createStudent(Scanner input) {
        float totalSwen311, obtainedSwen311, totalSwen411, obtainedSwen411, totalSwen431, obtainedSwen431, totalCmpsc221, obtainedCmpsc221;
        System.out.println("Enter Total marks of Sweng 311: ");
        totalSwen311 = input.nextFloat();
        System.out.println("Enter Obtained marks of Sweng 311: ");
        obtainedSwen311 = input.nextFloat();
        System.out.println("Enter Total marks of Sweng 411: ");
        totalSwen411 = input.nextFloat();
        System.out.println("Enter Obtained marks of Sweng 411: ");
        obtainedSwen411 = input.nextFloat();
        System.out.println("Enter Total marks of Sweng 431: ");
        totalSwen431 = input.nextFloat();
        System.out.println("Enter Obtained marks of Sweng 431: ");
        obtainedSwen431 = input.nextFloat();
        System.out.println("Enter Total marks of CMPSC 221: ");
        totalCmpsc221 = input.nextFloat();
        System.out.println("Enter Obtained marks of CMPSC 221: ");
        obtainedCmpsc221 = input.nextFloat();

        return new PercentageMarks(totalSwen311, obtainedSwen311, totalSwen411, obtainedSwen411, totalSwen431, obtainedSwen431, totalCmpsc221, obtainedCmpsc221);
    }

    private static float comparePercentages(PercentageMarks p1, PercentageMarks p2) {
        return Math.max(p1.getPercentageMarks(), p2.getPercentageMarks());
    }
}
