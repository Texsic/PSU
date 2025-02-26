public class MVCEventDemo {
    public static void main(String[] args) {
        Event event = new Event("E101", "Music Concert", "NYC");
        EventView view = new EventView();
        EventController controller = new EventController(event, view);

        controller.updateView();

        controller.setEventName("Art Exhibition");
        controller.updateView();
    }
}
