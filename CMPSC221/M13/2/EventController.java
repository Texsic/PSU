public class EventController {
    private Event model;
    private EventView view;

    public EventController(Event model, EventView view) {
        this.model = model;
        this.view = view;
    }

    public void setEventName(String name) {
        model.setEventName(name);
    }

    public String getEventName() {
        return model.getEventName();
    }

    public void updateView() {
        view.printEventDetails(model.getEventId(), model.getEventName(), model.getLocation());
    }
}
