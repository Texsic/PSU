public class PaperCup extends Cup {
    private boolean canHoldHotLiquids;

    public PaperCup(int capacity) {
        super("Paper", capacity);
        this.canHoldHotLiquids = false;
    }

    @Override
    public void displayInfo() {
        super.displayInfo();
        System.out.println("Can hold hot liquids: " + canHoldHotLiquids);
    }
}
