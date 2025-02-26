import java.util.List;

public class Course {
    private String title;
    private List<Student> students;

    public Course(String title, List<Student> students) {
        this.title = title;
        this.students = students;
    }

    public String getTitle() {
        return title;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Course [Title=").append(title).append(", Students=[");

        for (Student student : students) {
            sb.append(student.getName()).append(", ");
        }

        if (!students.isEmpty()) {
            sb.setLength(sb.length() - 2);  // Remove the last comma and space
        }

        sb.append("]]");
        return sb.toString();
    }
}
