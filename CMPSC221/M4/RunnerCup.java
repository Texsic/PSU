public class RunnerCup {
    public static void main(String[] args) {
        PaperCup paperCup = new PaperCup(250);
        GlassCup glassCup = new GlassCup(300);
        CeramicCup ceramicCup = new CeramicCup(350);

        paperCup.displayInfo();
        glassCup.displayInfo();
        ceramicCup.displayInfo();
    }
}
