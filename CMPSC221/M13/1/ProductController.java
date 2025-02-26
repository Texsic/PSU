public class ProductController {
    private Product model;
    private ProductView view;

    public ProductController(Product model, ProductView view) {
        this.model = model;
        this.view = view;
    }

    public void setProductName(String name) {
        model.setProductName(name);
    }

    public String getProductName() {
        return model.getProductName();
    }

    public void updateView() {
        view.printProductDetails(model.getProductId(), model.getProductName(), model.getQuantity());
    }
}
