import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Queue;
import java.util.concurrent.atomic.AtomicBoolean;

public class BufferWriter implements Runnable {
    private final Queue<String> buffer;
    private final String filePath;
    private final AtomicBoolean writingComplete;

    public BufferWriter(Queue<String> buffer, String filePath, AtomicBoolean writingComplete) {
        this.buffer = buffer;
        this.filePath = filePath;
        this.writingComplete = writingComplete;
    }

    @Override
    public void run() {
        try (BufferedReader reader = Files.newBufferedReader(Paths.get(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                for (String word : line.split("\\s+")) {
                    buffer.offer(word);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            writingComplete.set(true);
        }
    }
}
