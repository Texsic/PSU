public class LineIntersection {
    private double m1, b1, m2, b2;

    public LineIntersection(double m1, double b1, double m2, double b2) {
        this.m1 = m1;
        this.b1 = b1;
        this.m2 = m2;
        this.b2 = b2;
    }

    public double[] findIntersection() throws Exception {
        // Check if the lines are parallel
        if (m1 == m2) {
            throw new Exception("Lines are parallel and do not intersect.");
        }

        // Calculate the intersection point
        double x = (b2 - b1) / (m1 - m2);
        double y = m1 * x + b1;
        return new double[] { x, y };
    }
}
