import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class KFCApp {
    private static HashMap<Integer, Product> products = new HashMap<>();
    private static HashMap<Integer, List<Ingredient>> ingredients = new HashMap<>();
    private static boolean tablesCreated = false;
    private static boolean productsInserted = false;
    private static boolean ingredientsInserted = false;

    public static void main(String[] args) {
        JFrame frame = new JFrame("KFC Lab Test");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);
        frame.setLayout(new BorderLayout());

        JComboBox<String> productComboBox = new JComboBox<>();
        DefaultListModel<String> ingredientListModel = new DefaultListModel<>();
        JList<String> ingredientList = new JList<>(ingredientListModel);

        JPanel topPanel = new JPanel(new BorderLayout());
        topPanel.add(new JLabel("Product Names"), BorderLayout.NORTH);
        topPanel.add(productComboBox, BorderLayout.CENTER);

        JPanel centerPanel = new JPanel(new BorderLayout());
        centerPanel.add(new JLabel("List of Ingredients"), BorderLayout.NORTH);
        centerPanel.add(new JScrollPane(ingredientList), BorderLayout.CENTER);

        JPanel buttonPanel = new JPanel(new GridLayout(2, 2));
        JButton createTablesButton = new JButton("Create Tables");
        JButton insertProductsButton = new JButton("Insert Products");
        JButton insertIngredientsButton = new JButton("Insert Ingredients");
        JButton loadProductsButton = new JButton("Load Product's Name");

        buttonPanel.add(createTablesButton);
        buttonPanel.add(insertProductsButton);
        buttonPanel.add(insertIngredientsButton);
        buttonPanel.add(loadProductsButton);

        frame.add(topPanel, BorderLayout.NORTH);
        frame.add(centerPanel, BorderLayout.CENTER);
        frame.add(buttonPanel, BorderLayout.SOUTH);

        createTablesButton.addActionListener(e -> {
            if (!tablesCreated) {
                createTables();
                tablesCreated = true;
                JOptionPane.showMessageDialog(frame, "Tables created successfully!");
            } else {
                JOptionPane.showMessageDialog(frame, "Tables already exist!");
            }
        });

        insertProductsButton.addActionListener(e -> {
            if (!productsInserted) {
                insertProducts();
                productsInserted = true;
                JOptionPane.showMessageDialog(frame, "Products inserted successfully!");
            } else {
                JOptionPane.showMessageDialog(frame, "Products already exist!");
            }
        });

        insertIngredientsButton.addActionListener(e -> {
            if (!ingredientsInserted) {
                insertIngredients();
                ingredientsInserted = true;
                JOptionPane.showMessageDialog(frame, "Ingredients inserted successfully!");
            } else {
                JOptionPane.showMessageDialog(frame, "Ingredients already exist!");
            }
        });

        loadProductsButton.addActionListener(e -> {
            productComboBox.removeAllItems();
            List<String> productNames = loadProductNames();
            for (String name : productNames) {
                productComboBox.addItem(name);
            }
            JOptionPane.showMessageDialog(frame, "Products loaded successfully!");
        });

        productComboBox.addActionListener(e -> {
            ingredientListModel.clear();
            String selectedProduct = (String) productComboBox.getSelectedItem();
            if (selectedProduct != null) {
                int productID = getProductIDByName(selectedProduct);
                List<Ingredient> ingredientsForProduct = getIngredients(productID);
                for (Ingredient ingredient : ingredientsForProduct) {
                    ingredientListModel.addElement(ingredient.name);
                }
            }
        });

        frame.setVisible(true);
    }

    private static void createTables() {
        products = new HashMap<>();
        ingredients = new HashMap<>();
    }

    private static void insertProducts() {
        products.put(10, new Product("Pizza", 20));
        products.put(20, new Product("Burger", 15));
        products.put(30, new Product("Coffee", 5));
    }

    private static void insertIngredients() {
        ingredients.put(10, List.of(
                new Ingredient(1, "Chicken"),
                new Ingredient(3, "Pizza Dough"),
                new Ingredient(4, "Mayo")
        ));
        ingredients.put(20, List.of(
                new Ingredient(2, "Kabab"),
                new Ingredient(5, "Syed")
        ));
        ingredients.put(30, List.of(
                new Ingredient(6, "Milk")
        ));
    }

    private static List<String> loadProductNames() {
        List<String> productNames = new ArrayList<>();
        for (Product product : products.values()) {
            productNames.add(product.name);
        }
        return productNames;
    }

    private static List<Ingredient> getIngredients(int productID) {
        return ingredients.getOrDefault(productID, new ArrayList<>());
    }

    private static int getProductIDByName(String productName) {
        for (var entry : products.entrySet()) {
            if (entry.getValue().name.equals(productName)) {
                return entry.getKey();
            }
        }
        return -1;
    }

    static class Product {
        String name;
        int price;

        Product(String name, int price) {
            this.name = name;
            this.price = price;
        }
    }

    static class Ingredient {
        int ingredientNo;
        String name;

        Ingredient(int ingredientNo, String name) {
            this.ingredientNo = ingredientNo;
            this.name = name;
        }
    }
}
