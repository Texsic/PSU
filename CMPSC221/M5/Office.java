public class Office {
    private String officeNumber;

    public Office(String officeNumber) {
        this.officeNumber = officeNumber;
    }

    public String getOfficeNumber() {
        return officeNumber;
    }

    @Override
    public String toString() {
        return "Office [OfficeNumber=" + officeNumber + "]";
    }
}
