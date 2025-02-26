import java.util.Queue;
import java.util.Scanner;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter file path: ");
        String filePath = scanner.nextLine();

        Queue<String> sharedQueue = new LinkedBlockingQueue<>();
        AtomicBoolean writingComplete = new AtomicBoolean(false);

        Thread writerThread = new Thread(new BufferWriter(sharedQueue, filePath, writingComplete));
        Thread readerThread = new Thread(new BufferReader(sharedQueue, writingComplete));

        writerThread.start();
        readerThread.start();
    }
}
