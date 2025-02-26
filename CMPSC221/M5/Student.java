import java.util.List;

public class Student {
    private String name;
    private List<Course> courses;

    public Student(String name, List<Course> courses) {
        this.name = name;
        this.courses = courses;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Student [Name=").append(name).append(", Courses=[");

        for (Course course : courses) {
            sb.append(course.getTitle()).append(", ");
        }

        if (!courses.isEmpty()) {
            sb.setLength(sb.length() - 2);  // Remove the last comma and space
        }

        sb.append("]]");
        return sb.toString();
    }
}
