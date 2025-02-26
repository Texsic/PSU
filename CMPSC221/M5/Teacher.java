import java.util.List;

public class Teacher {
    private String name;
    private List<PC> pcs;
    private Office office;

    public Teacher(String name, List<PC> pcs, Office office) {
        this.name = name;
        this.pcs = pcs;
        this.office = office;
    }

    public String getName() {
        return name;
    }

    public Office getOffice() {
        return office;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Teacher [Name=").append(name).append(", PCs=[");

        for (PC pc : pcs) {
            sb.append(pc.getModel()).append(", ");
        }

        if (!pcs.isEmpty()) {
            sb.setLength(sb.length() - 2);  // Remove the last comma and space
        }

        sb.append("], Office=").append(office.toString()).append("]");
        return sb.toString();
    }
}
