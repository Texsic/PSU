public class Main {
    public static void main(String[] args) {
        Checker checker = new Checker();
        int[] evenValues = {2, 4, 6, 8};
        int[] oddValues = {1, 3, 5, 7};

        Thread t1 = new Thread(new EvenChecker(checker, evenValues));
        Thread t2 = new Thread(new EvenChecker(checker, oddValues));

        t1.start();
        t2.start();
    }
}
