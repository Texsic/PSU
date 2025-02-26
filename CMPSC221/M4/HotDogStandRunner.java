public class HotDogStandRunner {
    public static void main(String[] args) {
        // Create 3 hot dog stands
        HotDogStand stand1 = new HotDogStand("Stand 1", 0);
        HotDogStand stand2 = new HotDogStand("Stand 2", 0);
        HotDogStand stand3 = new HotDogStand("Stand 3", 0);

        // Simulate hot dog sales
        stand1.justSold();
        stand1.justSold();
        stand2.justSold();
        stand3.justSold();
        stand3.justSold();
        stand3.justSold();

        // Display hot dogs sold for each stand
        System.out.println(stand1.getStandId() + " sold " + stand1.getHotDogsSold() + " hot dogs.");
        System.out.println(stand2.getStandId() + " sold " + stand2.getHotDogsSold() + " hot dogs.");
        System.out.println(stand3.getStandId() + " sold " + stand3.getHotDogsSold() + " hot dogs.");
    }
}
