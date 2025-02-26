import java.util.Scanner;

public class LineIntersectionRunner {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        // Get the slope and intercept for the first line
        System.out.println("Enter the slope (m1) of the first line: ");
        double m1 = input.nextDouble();
        System.out.println("Enter the y-intercept (b1) of the first line: ");
        double b1 = input.nextDouble();

        // Get the slope and intercept for the second line
        System.out.println("Enter the slope (m2) of the second line: ");
        double m2 = input.nextDouble();
        System.out.println("Enter the y-intercept (b2) of the second line: ");
        double b2 = input.nextDouble();

        try {
            // Create an instance of LineIntersection
            LineIntersection lineIntersection = new LineIntersection(m1, b1, m2, b2);
            double[] intersection = lineIntersection.findIntersection();

            // Display the intersection point
            System.out.printf("Intersection point: (%.2f, %.2f)\n", intersection[0], intersection[1]);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
