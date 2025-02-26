public class MVCProductDemo {
    public static void main(String[] args) {
        Product product = new Product("P123", "Laptop", 50);
        ProductView view = new ProductView();
        ProductController controller = new ProductController(product, view);

        controller.updateView();

        controller.setProductName("Gaming Laptop");
        controller.updateView();
    }
}
