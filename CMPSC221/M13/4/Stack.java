public class Stack {
    private int size;
    private int top;
    private Object[] elements;

    public Stack(int size) {
        this.size = size;
        this.top = -1;
        this.elements = new Object[size];
    }

    public void push(Object element) {
        if (top == size - 1) {
            System.out.println("Stack Overflow");
        } else {
            elements[++top] = element;
        }
    }

    public Object pop() {
        if (top == -1) {
            System.out.println("Stack Underflow");
            return null;
        } else {
            return elements[top--];
        }
    }

    public void display() {
        for (int i = 0; i <= top; i++) {
            System.out.print(elements[i] + " ");
        }
        System.out.println();
    }
}