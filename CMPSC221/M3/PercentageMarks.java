public class PercentageMarks {
    private float totalMarksSwen311, totalMarksSwen411, totalMarksSwen431, totalMarksCmpsc221;
    private float obtainedMarksSwen311, obtainedMarksSwen411, obtainedMarksSwen431, obtainedMarksCmpsc221;
    private float totalMarks, obtainedMarks, percentageMarks;

    public PercentageMarks(float totalSwen311, float obtainedSwen311, float totalSwen411, float obtainedSwen411,
                           float totalSwen431, float obtainedSwen431, float totalCmpsc221, float obtainedCmpsc221) {
        this.totalMarksSwen311 = totalSwen311;
        this.totalMarksSwen411 = totalSwen411;
        this.totalMarksSwen431 = totalSwen431;
        this.totalMarksCmpsc221 = totalCmpsc221;
        this.obtainedMarksSwen311 = obtainedSwen311;
        this.obtainedMarksSwen411 = obtainedSwen411;
        this.obtainedMarksSwen431 = obtainedSwen431;
        this.obtainedMarksCmpsc221 = obtainedCmpsc221;
        validateMarks();
    }

    private void validateMarks() {
        if (!isValidMark(totalMarksSwen311) || !isValidMark(totalMarksSwen411) || !isValidMark(totalMarksSwen431) || !isValidMark(totalMarksCmpsc221)) {
            throw new IllegalArgumentException("Total marks must be between 1 and 100.");
        }
        if (!isValidMark(obtainedMarksSwen311) || !isValidMark(obtainedMarksSwen411) || !isValidMark(obtainedMarksSwen431) || !isValidMark(obtainedMarksCmpsc221)) {
            throw new IllegalArgumentException("Obtained marks must be between 1 and 100.");
        }
        if (obtainedMarksSwen311 > totalMarksSwen311 || obtainedMarksSwen411 > totalMarksSwen411 || obtainedMarksSwen431 > totalMarksSwen431 || obtainedMarksCmpsc221 > totalMarksCmpsc221) {
            throw new IllegalArgumentException("Obtained marks must be less than or equal to total marks.");
        }
    }

    private boolean isValidMark(float mark) {
        return mark >= 1 && mark <= 100;
    }

    public void setValues(float totalSwen311, float obtainedSwen311, float totalSwen411, float obtainedSwen411,
                          float totalSwen431, float obtainedSwen431, float totalCmpsc221, float obtainedCmpsc221) {
        this.totalMarksSwen311 = totalSwen311;
        this.totalMarksSwen411 = totalSwen411;
        this.totalMarksSwen431 = totalSwen431;
        this.totalMarksCmpsc221 = totalCmpsc221;
        this.obtainedMarksSwen311 = obtainedSwen311;
        this.obtainedMarksSwen411 = obtainedSwen411;
        this.obtainedMarksSwen431 = obtainedSwen431;
        this.obtainedMarksCmpsc221 = obtainedCmpsc221;
        validateMarks();
    }

    public void getValues() {
        System.out.println("Total marks of Sweng 311: " + this.totalMarksSwen311);
        System.out.println("Obtained marks of Sweng 311: " + this.obtainedMarksSwen311);
        System.out.println("Total marks of Sweng 411: " + this.totalMarksSwen411);
        System.out.println("Obtained marks of Sweng 411: " + this.obtainedMarksSwen411);
        System.out.println("Total marks of Sweng 431: " + this.totalMarksSwen431);
        System.out.println("Obtained marks of Sweng 431: " + this.obtainedMarksSwen431);
        System.out.println("Total marks of CMPSC 221: " + this.totalMarksCmpsc221);
        System.out.println("Obtained marks of CMPSC 221: " + this.obtainedMarksCmpsc221);
    }

    public void computePercentage() {
        this.totalMarks = this.totalMarksSwen311 + this.totalMarksSwen411 + this.totalMarksSwen431 + this.totalMarksCmpsc221;
        this.obtainedMarks = this.obtainedMarksSwen311 + this.obtainedMarksSwen411 + this.obtainedMarksSwen431 + this.obtainedMarksCmpsc221;
        this.percentageMarks = (this.obtainedMarks / this.totalMarks) * 100;
    }

    public float getPercentageMarks() {
        return this.percentageMarks;
    }

    public float getObtainedMarksSum() {
        return this.obtainedMarks;
    }
}
