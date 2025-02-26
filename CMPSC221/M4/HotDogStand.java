public class HotDogStand {
    private String standId;
    private int hotDogsSold;

    // Constructor to initialize standId and hotDogsSold
    public HotDogStand(String standId, int hotDogsSold) {
        this.standId = standId;
        this.hotDogsSold = hotDogsSold;
    }

    // Method to increment the number of hot dogs sold
    public void justSold() {
        hotDogsSold++;
    }

    // Getter to retrieve the number of hot dogs sold
    public int getHotDogsSold() {
        return hotDogsSold;
    }

    // Getter to retrieve the stand ID
    public String getStandId() {
        return standId;
    }
}
