import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class StudentBioGUI extends JFrame implements ActionListener {
    private JTextField psuIdTextField, nameTextField, totalStudentsTextField;
    private JComboBox<String> genderComboBox;
    private JComboBox<Integer> psuIdComboBox;
    private JButton createTableButton, saveButton, deleteButton, exitButton, loadPsuIdsButton, totalStudentsButton;

    private final String DB_URL = "jdbc:mysql://localhost:3306/Students";
    private final String DB_USER = "Mo";
    private final String DB_PASS = "";

    public StudentBioGUI() {
        setTitle("Student Bio GUI");
        setSize(500, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new FlowLayout());

        initComponents();
    }

    private void initComponents() {
        JLabel psuIdLabel = new JLabel("PSU-ID");
        JLabel nameLabel = new JLabel("Name");
        JLabel genderLabel = new JLabel("Gender");

        psuIdTextField = new JTextField(10);
        nameTextField = new JTextField(10);
        totalStudentsTextField = new JTextField(10);
        totalStudentsTextField.setEditable(false);

        genderComboBox = new JComboBox<>(new String[]{"Male", "Female"});
        psuIdComboBox = new JComboBox<>();

        createTableButton = new JButton("Create Table");
        saveButton = new JButton("Save");
        deleteButton = new JButton("Delete");
        exitButton = new JButton("Exit");
        loadPsuIdsButton = new JButton("Load PSU-IDs");
        totalStudentsButton = new JButton("Total Students");

        add(psuIdLabel);
        add(psuIdTextField);
        add(nameLabel);
        add(nameTextField);
        add(genderLabel);
        add(genderComboBox);
        add(createTableButton);
        add(saveButton);
        add(deleteButton);
        add(exitButton);
        add(loadPsuIdsButton);
        add(totalStudentsButton);
        add(totalStudentsTextField);

        createTableButton.addActionListener(this);
        saveButton.addActionListener(this);
        deleteButton.addActionListener(this);
        exitButton.addActionListener(this);
        loadPsuIdsButton.addActionListener(this);
        totalStudentsButton.addActionListener(this);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        Object source = e.getSource();

        if (source == createTableButton) {
            createTable();
        } else if (source == saveButton) {
            saveRecord();
        } else if (source == deleteButton) {
            deleteRecord();
        } else if (source == exitButton) {
            System.exit(0);
        } else if (source == loadPsuIdsButton) {
            loadPsuIds();
        } else if (source == totalStudentsButton) {
            countTotalStudents();
        }
    }

    private void createTable() {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             Statement stmt = conn.createStatement()) {
            String createTableSQL = "CREATE TABLE IF NOT EXISTS StudentBio (" +
                    "PSU_ID INT PRIMARY KEY, " +
                    "Name VARCHAR(30), " +
                    "Gender VARCHAR(10))";
            stmt.executeUpdate(createTableSQL);
            JOptionPane.showMessageDialog(this, "Table StudentBio created successfully.");
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error creating table: " + ex.getMessage());
        }
    }

    private void saveRecord() {
        int psuId = Integer.parseInt(psuIdTextField.getText());
        String name = nameTextField.getText();
        String gender = (String) genderComboBox.getSelectedItem();

        String insertSQL = "INSERT INTO StudentBio (PSU_ID, Name, Gender) VALUES (?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement pstmt = conn.prepareStatement(insertSQL)) {
            pstmt.setInt(1, psuId);
            pstmt.setString(2, name);
            pstmt.setString(3, gender);
            pstmt.executeUpdate();
            JOptionPane.showMessageDialog(this, "Record saved successfully.");
        } catch (SQLException ex) {
            if (ex.getErrorCode() == 1062) {
                JOptionPane.showMessageDialog(this, "Duplicate PSU-ID. Record not saved.");
            } else {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(this, "Error saving record: " + ex.getMessage());
            }
        }
    }

    private void deleteRecord() {
        int psuId = Integer.parseInt(psuIdTextField.getText());

        String deleteSQL = "DELETE FROM StudentBio WHERE PSU_ID = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement pstmt = conn.prepareStatement(deleteSQL)) {
            pstmt.setInt(1, psuId);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                JOptionPane.showMessageDialog(this, "Record deleted successfully.");
            } else {
                JOptionPane.showMessageDialog(this, "Record not found.");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error deleting record: " + ex.getMessage());
        }
    }

    private void loadPsuIds() {
        String selectSQL = "SELECT PSU_ID FROM StudentBio";
        psuIdComboBox.removeAllItems();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(selectSQL)) {
            while (rs.next()) {
                psuIdComboBox.addItem(rs.getInt("PSU_ID"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error loading PSU-IDs: " + ex.getMessage());
        }
    }

    private void countTotalStudents() {
        String countSQL = "SELECT COUNT(*) AS total FROM StudentBio";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(countSQL)) {
            if (rs.next()) {
                int total = rs.getInt("total");
                totalStudentsTextField.setText(String.valueOf(total));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error counting students: " + ex.getMessage());
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new StudentBioGUI().setVisible(true);
        });
    }
}
