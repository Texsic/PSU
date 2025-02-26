import java.util.HashMap;
import java.util.Map;
import java.util.Queue;
import java.util.Collections;
import java.util.concurrent.atomic.AtomicBoolean;

public class BufferReader implements Runnable {
    private final Queue<String> buffer;
    private final AtomicBoolean writingComplete;

    public BufferReader(Queue<String> buffer, AtomicBoolean writingComplete) {
        this.buffer = buffer;
        this.writingComplete = writingComplete;
    }

    @Override
    public void run() {
        Map<String, Integer> frequencyMap = new HashMap<>();

        while (!writingComplete.get() || !buffer.isEmpty()) {
            String word = buffer.poll();
            if (word != null) {
                frequencyMap.put(word, frequencyMap.getOrDefault(word, 0) + 1);
            }
        }

        if (!frequencyMap.isEmpty()) {
            String mostFrequentWord = Collections.max(frequencyMap.entrySet(), Map.Entry.comparingByValue()).getKey();
            System.out.println("Most frequent word: " + mostFrequentWord + " - " + frequencyMap.get(mostFrequentWord) + " times");
        } else {
            System.out.println("No words found.");
        }
    }
}
