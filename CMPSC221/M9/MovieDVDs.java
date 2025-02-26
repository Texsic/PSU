// Base class MovieDVDs
class MovieDVDs {
    protected int id;
    protected String title;
    protected String movieRating;

    // Default constructor
    public MovieDVDs() {
        this.id = 0;
        this.title = "Unknown";
        this.movieRating = "Unknown";
    }

    // Parameterized constructor
    public MovieDVDs(int id, String title, String movieRating) {
        this.id = id;
        this.title = title;
        this.movieRating = movieRating;
    }

    // Method to compute fine (overridden in derived classes)
    public double computeFine(int totalMovies, int daysLate) {
        return 0;
    }

    // Method to apply a discount on the fine
    public double computeDiscount(double totalFine, int noOfDVDs) {
        if (noOfDVDs > 1) {
            return totalFine * 0.75; // 25% discount
        }
        return totalFine;
    }
}

// Derived class ActionDVD
class ActionDVD extends MovieDVDs {
    public ActionDVD() {
        super();
    }

    public ActionDVD(int id, String title, String movieRating) {
        super(id, title, movieRating);
    }

    @Override
    public double computeFine(int totalMovies, int daysLate) {
        return totalMovies * daysLate * 4; // $4 per day for Action DVDs
    }
}

// Derived class ComedyDVD
class ComedyDVD extends MovieDVDs {
    public ComedyDVD() {
        super();
    }

    public ComedyDVD(int id, String title, String movieRating) {
        super(id, title, movieRating);
    }

    @Override
    public double computeFine(int totalMovies, int daysLate) {
        return totalMovies * daysLate * 6; // $6 per day for Comedy DVDs
    }
}

// Derived class HorrorDVD
class HorrorDVD extends MovieDVDs {
    public HorrorDVD() {
        super();
    }

    public HorrorDVD(int id, String title, String movieRating) {
        super(id, title, movieRating);
    }

    @Override
    public double computeFine(int totalMovies, int daysLate) {
        return totalMovies * daysLate * 7; // $7 per day for Horror DVDs
    }
}
