public class Checker {
    synchronized void check(int value) {
        if (value % 2 == 0) {
            System.out.println(value + " is Even");
        } else {
            System.out.println(value + " is Odd");
        }
    }
}
