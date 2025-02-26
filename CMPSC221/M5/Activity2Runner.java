import java.util.Arrays;

public class Activity2Runner {
    public static void main(String[] args) {
        // Create students without courses first
        Student student1 = new Student("Alice", null);
        Student student2 = new Student("Bob", null);

        // Create courses and enroll students in them
        Course course1 = new Course("Math", Arrays.asList(student1, student2));
        Course course2 = new Course("Science", Arrays.asList(student1));

        // Now associate courses with the students
        student1 = new Student("Alice", Arrays.asList(course1, course2));
        student2 = new Student("Bob", Arrays.asList(course1));

        // Print the course and student info
        System.out.println(course1.toString());
        System.out.println(course2.toString());
        System.out.println(student1.toString());
        System.out.println(student2.toString());
    }
}
