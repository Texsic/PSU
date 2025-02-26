public class Event {
    private String eventId;
    private String eventName;
    private String location;

    public Event(String eventId, String eventName, String location) {
        this.eventId = eventId;
        this.eventName = eventName;
        this.location = location;
    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
