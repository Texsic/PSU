import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

public class CourseEnrollmentGUI implements ActionListener {
    private static JTextField name;
    private static JLabel label1, label2, label3;
    private static JButton button1, button2, button3, button4; // Added button4 for "Selected Major"
    private static JList<String> listBox;
    private static JComboBox<String> combobox;
    private static int indexList;
    private static String[] majors = {"Computer Science", "Software Engineering", "Computer Engineering"};
    private static DefaultListModel<String> model = new DefaultListModel<>();

    public static void main(String[] args) {
        createWindow();
    }

    private static void createWindow() {
        JFrame frame = new JFrame("Course Enrollment GUI");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        createUI(frame);
        frame.setSize(560, 400);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }

    private static void createUI(final JFrame frame) {
        JPanel panel = new JPanel();
        CourseEnrollmentGUI mylist = new CourseEnrollmentGUI();
        GridBagLayout layout = new GridBagLayout();
        GridBagConstraints gbc = new GridBagConstraints();
        panel.setLayout(layout);

        // Create components
        name = new JTextField(10);
        label1 = new JLabel("Add Course:");
        label2 = new JLabel("List of Enrolled Courses:");
        label3 = new JLabel("Select your Major:");

        button1 = new JButton("Add Course");
        button2 = new JButton("Total Enrolled Courses");
        button3 = new JButton("Drop Course");
        button4 = new JButton("Selected Major"); // New button for selected major

        button1.addActionListener(mylist);
        button2.addActionListener(mylist);
        button3.addActionListener(mylist);
        button4.addActionListener(mylist); // Add action listener for the new button

        // Initialize JList
        model.addElement("Sweng-311");
        model.addElement("Sweng-411");
        model.addElement("CMPSC-221");
        listBox = new JList<>(model);
        listBox.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        listBox.setVisibleRowCount(5); // Display up to 5 items at a time
        JScrollPane listScrollPane = new JScrollPane(listBox); // Add scroll pane for the JList

        // JComboBox for selecting a major
        combobox = new JComboBox<>(majors);

        // List selection listener
        listBox.addListSelectionListener(new ListSelectionListener() {
            @Override
            public void valueChanged(ListSelectionEvent e) {
                if (!e.getValueIsAdjusting()) {
                    indexList = listBox.getSelectedIndex();
                }
            }
        });

        // Set up GridBag layout
        gbc.fill = GridBagConstraints.HORIZONTAL;

        gbc.gridx = 0; gbc.gridy = 0; panel.add(label1, gbc);
        gbc.gridx = 1; gbc.gridy = 0; panel.add(name, gbc);

        gbc.gridx = 0; gbc.gridy = 1; panel.add(button1, gbc);

        gbc.gridx = 0; gbc.gridy = 2; panel.add(label2, gbc);
        gbc.gridx = 0; gbc.gridy = 3; gbc.gridwidth = 2; // Span across two columns
        panel.add(listScrollPane, gbc); // Add scroll pane instead of listBox directly

        gbc.gridwidth = 1; // Reset gridwidth to 1
        gbc.gridx = 0; gbc.gridy = 4; panel.add(label3, gbc);
        gbc.gridx = 1; gbc.gridy = 4; panel.add(combobox, gbc);

        gbc.gridx = 0; gbc.gridy = 5; panel.add(button2, gbc);
        gbc.gridx = 1; gbc.gridy = 5; panel.add(button3, gbc);

        gbc.gridx = 0; gbc.gridy = 6; panel.add(button4, gbc); // Add new button to panel

        // Add panel to frame
        frame.getContentPane().add(panel, BorderLayout.CENTER);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String command = e.getActionCommand();

        if (command.equals("Add Course")) {
            String courseName = name.getText();
            if (!courseName.isEmpty()) {
                model.addElement(courseName);  // Add new course to the list
                JOptionPane.showMessageDialog(null, "Course Added: " + courseName);
                name.setText("");  // Clear the input field after adding
            } else {
                JOptionPane.showMessageDialog(null, "Course Name cannot be empty.");
            }
        } else if (command.equals("Total Enrolled Courses")) {
            int totalCourses = model.getSize();  // Get the total number of courses
            JOptionPane.showMessageDialog(null, "Total Courses: " + totalCourses);
        } else if (command.equals("Drop Course")) {
            if (indexList >= 0) {  // Ensure that an item is selected
                String removedCourse = model.getElementAt(indexList);
                model.removeElementAt(indexList);  // Remove the selected course
                JOptionPane.showMessageDialog(null, "Course Dropped: " + removedCourse);
            } else {
                JOptionPane.showMessageDialog(null, "Please select a course to drop.");
            }
        } else if (command.equals("Selected Major")) { // Handle the new button action
            String selectedMajor = (String) combobox.getSelectedItem();
            JOptionPane.showMessageDialog(null, "Your Major is " + selectedMajor);
        }
    }
}
