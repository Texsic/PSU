public class Cup {
    protected String material;
    protected int capacity;

    public Cup(String material, int capacity) {
        this.material = material;
        this.capacity = capacity;
    }

    public void displayInfo() {
        System.out.println("Material: " + material + ", Capacity: " + capacity + "ml");
    }
}
