public class Main {
    public static void main(String[] args) {
        Stack integerStack = new Stack(5);
        integerStack.push(10);
        integerStack.push(20);
        integerStack.push(30);
        integerStack.display();
        System.out.println("Popped: " + integerStack.pop());

        Stack stringStack = new Stack(5);
        stringStack.push("Hello");
        stringStack.push("World");
        stringStack.display();
        System.out.println("Popped: " + stringStack.pop());

        Stack floatStack = new Stack(5);
        floatStack.push(1.1);
        floatStack.push(2.2);
        floatStack.display();
        System.out.println("Popped: " + floatStack.pop());
    }
}
