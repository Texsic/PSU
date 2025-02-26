public class Products {
    private int productID;
    private String productDescription;
    private boolean productAvailability;
    private int quantity;
    private String units;
    private float unitPrice;

    // Default constructor
    public Products() {
        productID = 123;
        productDescription = "Milk";
        productAvailability = true;
        quantity = 10;
        units = "Gallon";
        unitPrice = 4f;
    }

    // Copy constructor
    public Products(int ID, String desc, boolean available, int qty, String unit, float price) {
        productID = ID;
        productDescription = desc;
        productAvailability = available;
        quantity = qty;
        units = unit;
        unitPrice = price;
    }

    // Method to display product information
    public void getProduct() {
        System.out.printf("\nProduct ID: %d\n", productID);
        System.out.printf("Product Description: %s\n", productDescription);
        System.out.printf("Product Is available: %b\n", productAvailability);
        System.out.printf("Quantity: %d\n", quantity);
        System.out.printf("Unit/Scale: %s\n", units);
        System.out.printf("Unit Price: %.2f\n", unitPrice);
    }


    // Method to update product information
    public void setProduct(int ID, String desc, boolean available, int qty, String unit, float price) {
        productID = ID;
        productDescription = desc;
        productAvailability = available;
        quantity = qty;
        units = unit;
        unitPrice = price;
    }

    // Method to handle purchase of product
    public void Purchase(int qty, float uprice) {
        productAvailability = true;
        unitPrice = (quantity * unitPrice + qty * uprice) / (quantity + qty);
        quantity = quantity + qty;
    }

    // Modified Sale method to handle error case
    public void Sale(int qty) {
        if (qty > quantity) {
            System.out.println("Error: Sale quantity exceeds available stock!");
        } else {
            quantity = quantity - qty;
            if (quantity <= 0) {
                productAvailability = false;
            }
        }
    }

    // Method to check availability of product
    public boolean checkAvailability() {
        return quantity > 0;
    }

    // New method to calculate and return inventory cost
    public float inventoryCost() {
        return quantity * unitPrice;
    }
}
