public class EvenChecker implements Runnable {
    private Checker checker;
    private int[] values;

    public EvenChecker(Checker checker, int[] values) {
        this.checker = checker;
        this.values = values;
    }

    public void run() {
        for (int value : values) {
            checker.check(value);
        }
    }
}
