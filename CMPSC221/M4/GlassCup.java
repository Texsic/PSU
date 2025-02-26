public class GlassCup extends Cup {
    private boolean fragile;

    public GlassCup(int capacity) {
        super("Glass", capacity);
        this.fragile = true;
    }

    @Override
    public void displayInfo() {
        super.displayInfo();
        System.out.println("Fragile: " + fragile);
    }
}
