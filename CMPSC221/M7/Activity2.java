import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Activity2 extends JFrame {
    private DefaultListModel<String> listModel1;
    private DefaultListModel<String> listModel2;
    private JList<String> listBox1;
    private JList<String> listBox2;

    public Activity2() {
        setTitle("List Box Manipulation");
        setSize(500, 300);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new GridLayout(1, 2));

        // List Box 1
        listModel1 = new DefaultListModel<>();
        listModel1.addElement("SWENG-311");
        listModel1.addElement("SWENG-411");
        listModel1.addElement("SWENG-431");
        listModel1.addElement("CMPSC-221");
        listBox1 = new JList<>(listModel1);
        JScrollPane scrollPane1 = new JScrollPane(listBox1);

        // List Box 2
        listModel2 = new DefaultListModel<>();
        listBox2 = new JList<>(listModel2);
        JScrollPane scrollPane2 = new JScrollPane(listBox2);

        // Panel for buttons
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new GridLayout(5, 1));

        // Add Selected Button
        JButton addButton = new JButton("Add Selected");
        addButton.addActionListener(e -> {
            String selectedItem = listBox1.getSelectedValue();
            if (selectedItem != null && !listModel2.contains(selectedItem)) {
                listModel2.addElement(selectedItem);
            } else {
                JOptionPane.showMessageDialog(null, "Please select an item or item already exists.", "Error", JOptionPane.WARNING_MESSAGE);
            }
        });

        // Add All Button
        JButton addAllButton = new JButton("Add All");
        addAllButton.addActionListener(e -> {
            for (int i = 0; i < listModel1.getSize(); i++) {
                String item = listModel1.getElementAt(i);
                if (!listModel2.contains(item)) {
                    listModel2.addElement(item);
                }
            }
        });

        // Remove Selected Button
        JButton removeButton = new JButton("Remove Selected");
        removeButton.addActionListener(e -> {
            String selectedItem = listBox2.getSelectedValue();
            if (selectedItem != null) {
                listModel2.removeElement(selectedItem);
            } else {
                JOptionPane.showMessageDialog(null, "Please select an item to remove.", "Error", JOptionPane.WARNING_MESSAGE);
            }
        });

        // Remove All Button
        JButton removeAllButton = new JButton("Remove All");
        removeAllButton.addActionListener(e -> listModel2.clear());

        // Adding buttons to panel
        buttonPanel.add(addButton);
        buttonPanel.add(addAllButton);
        buttonPanel.add(removeButton);
        buttonPanel.add(removeAllButton);

        add(scrollPane1);
        add(buttonPanel);
        add(scrollPane2);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            Activity2 activity2 = new Activity2();
            activity2.setVisible(true);
        });
    }
}
