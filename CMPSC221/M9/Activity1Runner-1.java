public class Activity1Runner {
    public static void main(String[] args) {
        // Create instances of different DVD types
        ActionDVD actionDVD = new ActionDVD(1, "Action Movie", "Excellent");
        ComedyDVD comedyDVD = new ComedyDVD(2, "Comedy Movie", "Good");
        HorrorDVD horrorDVD = new HorrorDVD(3, "Horror Movie", "Fair");

        // Compute fine for each type
        double actionFine = actionDVD.computeFine(1, 10); // Action DVD, 10 days late
        double comedyFine = comedyDVD.computeFine(1, 10); // Comedy DVD, 10 days late
        double horrorFine = horrorDVD.computeFine(1, 10); // Horror DVD, 10 days late

        System.out.println("Fine for Action DVD (1 movie, 10 days late): $" + actionFine);
        System.out.println("Fine for Comedy DVD (1 movie, 10 days late): $" + comedyFine);
        System.out.println("Fine for Horror DVD (1 movie, 10 days late): $" + horrorFine);

        // Calculate fine with a discount for multiple DVDs
        double totalFine = actionFine + comedyFine;
        totalFine = actionDVD.computeDiscount(totalFine, 2); // 25% discount for two DVDs
        System.out.println("Fine for Action & Comedy DVDs (10 days late, with 25% discount): $" + totalFine);

        // Case for 5 days late with all DVD types and a discount
        actionFine = actionDVD.computeFine(1, 5);
        comedyFine = comedyDVD.computeFine(1, 5);
        horrorFine = horrorDVD.computeFine(1, 5);
        totalFine = actionFine + comedyFine + horrorFine;
        totalFine = actionDVD.computeDiscount(totalFine, 3);
        System.out.println("Fine for Action, Comedy & Horror DVDs (5 days late, with 25% discount): $" + totalFine);
    }
}