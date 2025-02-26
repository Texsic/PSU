import java.util.List;

public class PC {
    private String model;

    public PC(String model) {
        this.model = model;
    }

    public String getModel() {
        return model;
    }

    @Override
    public String toString() {
        return "PC [Model=" + model + "]";
    }
}
