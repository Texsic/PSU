public class RunnerProducts {
    public static void main(String[] args) {
        Products p1 = new Products();
        p1.getProduct();

        // Attempting to sell more than available quantity
        p1.Sale(15); // Should display an error message

        // Normal sale
        p1.Sale(5);
        p1.getProduct();

        // Display the inventory cost
        System.out.println("Inventory Cost: $" + p1.inventoryCost());

        // Purchase more items
        p1.Purchase(10, 3.9f);
        p1.getProduct();

        // Update product details
        p1.setProduct(345, "Juice", true, 20, "Packets", 2.40f);
        p1.getProduct();
    }
}
