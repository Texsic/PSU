public class CeramicCup extends Cup {
    private boolean microwaveSafe;

    public CeramicCup(int capacity) {
        super("Ceramic", capacity);
        this.microwaveSafe = true;
    }

    @Override
    public void displayInfo() {
        super.displayInfo();
        System.out.println("Microwave Safe: " + microwaveSafe);
    }
}
