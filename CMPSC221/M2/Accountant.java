public class Accountant {
    private String name;
    private int age;
    private String companyName;

    // Constructor
    public Accountant(String n, int a, String c) {
        name = n;
        age = a;
        companyName = c;
    }

    // Method to compute and display salary
    public void printSalary() {
        double salary = 40000 * Math.sqrt(Math.exp(0.04295 * age + 0.141));
        System.out.printf("Salary: $%.2f\n", salary);
    }

    // Method to display accountant details
    public void displayDetails() {
        System.out.println("Name: " + name + ", Age: " + age + ", Company Name: " + companyName);
    }
}
