import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class UniversityManagementSystem extends JFrame implements ActionListener {

    // Declare panels
    JPanel booksPanel, facultyPanel, studentPanel;
    CardLayout cardLayout;

    public UniversityManagementSystem() {
        // Set up the frame
        setTitle("University Management System");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        // Create a menu bar
        JMenuBar menuBar = new JMenuBar();

        // Create main menu items
        JMenu booksMenu = new JMenu("Books");
        JMenu facultyMenu = new JMenu("Faculty");
        JMenu studentsMenu = new JMenu("Students");

        // Add sub-menu items for Books
        JMenuItem newBook = new JMenuItem("New");
        JMenuItem deleteBook = new JMenuItem("Delete");
        JMenuItem viewBook = new JMenuItem("View");

        booksMenu.add(newBook);
        booksMenu.add(deleteBook);
        booksMenu.add(viewBook);

        // Add sub-menu items for Faculty
        JMenuItem newFaculty = new JMenuItem("New");
        JMenuItem deleteFaculty = new JMenuItem("Delete");
        JMenuItem viewFaculty = new JMenuItem("View");

        facultyMenu.add(newFaculty);
        facultyMenu.add(deleteFaculty);
        facultyMenu.add(viewFaculty);

        // Add sub-menu items for Students
        JMenuItem newStudent = new JMenuItem("New");
        JMenuItem deleteStudent = new JMenuItem("Delete");
        JMenuItem viewStudent = new JMenuItem("View");

        studentsMenu.add(newStudent);
        studentsMenu.add(deleteStudent);
        studentsMenu.add(viewStudent);

        // Add main menus to the menu bar
        menuBar.add(booksMenu);
        menuBar.add(facultyMenu);
        menuBar.add(studentsMenu);

        setJMenuBar(menuBar);

        // Set up the CardLayout to switch between panels
        cardLayout = new CardLayout();
        JPanel mainPanel = new JPanel(cardLayout);

        // Create the panels
        booksPanel = createBooksPanel();
        facultyPanel = createFacultyPanel();
        studentPanel = createStudentPanel();

        // Add panels to the CardLayout container
        mainPanel.add(booksPanel, "BooksPanel");
        mainPanel.add(facultyPanel, "FacultyPanel");
        mainPanel.add(studentPanel, "StudentPanel");

        add(mainPanel);

        // Add action listeners to the menu items to switch panels
        newBook.addActionListener(e -> cardLayout.show(mainPanel, "BooksPanel"));
        deleteBook.addActionListener(e -> cardLayout.show(mainPanel, "BooksPanel"));
        viewBook.addActionListener(e -> cardLayout.show(mainPanel, "BooksPanel"));

        newFaculty.addActionListener(e -> cardLayout.show(mainPanel, "FacultyPanel"));
        deleteFaculty.addActionListener(e -> cardLayout.show(mainPanel, "FacultyPanel"));
        viewFaculty.addActionListener(e -> cardLayout.show(mainPanel, "FacultyPanel"));

        newStudent.addActionListener(e -> cardLayout.show(mainPanel, "StudentPanel"));
        deleteStudent.addActionListener(e -> cardLayout.show(mainPanel, "StudentPanel"));
        viewStudent.addActionListener(e -> cardLayout.show(mainPanel, "StudentPanel"));
    }

    // Method to create BooksPanel
    private JPanel createBooksPanel() {
        JPanel panel = new JPanel(new BorderLayout(10, 10));

        // Create labels and text fields in a grid layout
        JPanel formPanel = new JPanel(new GridLayout(3, 2, 10, 10));
        formPanel.add(new JLabel("Book Name:"));
        JTextField bookNameField = new JTextField(20);
        formPanel.add(bookNameField);

        formPanel.add(new JLabel("Author Name:"));
        JTextField authorNameField = new JTextField(20);
        formPanel.add(authorNameField);

        formPanel.add(new JLabel("Edition Number:"));
        JTextField editionField = new JTextField(20);
        formPanel.add(editionField);

        // Create buttons
        JPanel buttonPanel = new JPanel(new FlowLayout());
        JButton newButton = new JButton("New");
        JButton deleteButton = new JButton("Delete");
        JButton viewButton = new JButton("View");

        buttonPanel.add(newButton);
        buttonPanel.add(deleteButton);
        buttonPanel.add(viewButton);

        // Add button actions
        newButton.addActionListener(this);
        deleteButton.addActionListener(this);
        viewButton.addActionListener(this);

        // Add the form panel and button panel to the main panel
        panel.add(formPanel, BorderLayout.CENTER);
        panel.add(buttonPanel, BorderLayout.SOUTH);

        return panel;
    }

    // Method to create FacultyPanel
    private JPanel createFacultyPanel() {
        JPanel panel = new JPanel(new BorderLayout(10, 10));

        JPanel formPanel = new JPanel(new GridLayout(3, 2, 10, 10));
        formPanel.add(new JLabel("Faculty Name:"));
        JTextField facultyNameField = new JTextField(20);
        formPanel.add(facultyNameField);

        formPanel.add(new JLabel("Department:"));
        JTextField departmentField = new JTextField(20);
        formPanel.add(departmentField);

        formPanel.add(new JLabel("Experience (Years):"));
        JTextField experienceField = new JTextField(20);
        formPanel.add(experienceField);

        JPanel buttonPanel = new JPanel(new FlowLayout());
        JButton newButton = new JButton("New");
        JButton deleteButton = new JButton("Delete");
        JButton viewButton = new JButton("View");

        buttonPanel.add(newButton);
        buttonPanel.add(deleteButton);
        buttonPanel.add(viewButton);

        // Add button actions
        newButton.addActionListener(this);
        deleteButton.addActionListener(this);
        viewButton.addActionListener(this);

        panel.add(formPanel, BorderLayout.CENTER);
        panel.add(buttonPanel, BorderLayout.SOUTH);

        return panel;
    }

    // Method to create StudentPanel
    private JPanel createStudentPanel() {
        JPanel panel = new JPanel(new BorderLayout(10, 10));

        JPanel formPanel = new JPanel(new GridLayout(3, 2, 10, 10));
        formPanel.add(new JLabel("Student Name:"));
        JTextField studentNameField = new JTextField(20);
        formPanel.add(studentNameField);

        formPanel.add(new JLabel("Roll Number:"));
        JTextField rollNumberField = new JTextField(20);
        formPanel.add(rollNumberField);

        formPanel.add(new JLabel("Grade:"));
        JTextField gradeField = new JTextField(20);
        formPanel.add(gradeField);

        JPanel buttonPanel = new JPanel(new FlowLayout());
        JButton newButton = new JButton("New");
        JButton deleteButton = new JButton("Delete");
        JButton viewButton = new JButton("View");

        buttonPanel.add(newButton);
        buttonPanel.add(deleteButton);
        buttonPanel.add(viewButton);

        // Add button actions
        newButton.addActionListener(this);
        deleteButton.addActionListener(this);
        viewButton.addActionListener(this);

        panel.add(formPanel, BorderLayout.CENTER);
        panel.add(buttonPanel, BorderLayout.SOUTH);

        return panel;
    }

    // Action listener for button clicks
    @Override
    public void actionPerformed(ActionEvent e) {
        JButton source = (JButton) e.getSource();
        JOptionPane.showMessageDialog(this, source.getText() + " button clicked!");
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new UniversityManagementSystem().setVisible(true);
        });
    }
}
