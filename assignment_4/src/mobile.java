import java.util.Scanner;

class mobile {
    private String planId;
    private String planName;
    private int validityDays;
    private double price;

    public mobile(String planId, String planName, int validityDays, double price) {
        this.planId = planId;
        this.planName = planName;
        this.validityDays = validityDays;
        this.price = price;
    }

    public mobile(mobile other) {
        this.planId = other.planId;
        this.planName = other.planName;
        this.validityDays = other.validityDays;
        this.price = other.price;
    }

    public void setValidityDays(int validityDays) {
        this.validityDays = validityDays;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void displayPlanDetails() {
        System.out.println("Plan ID: " + planId);
        System.out.println("Plan Name: " + planName);
        System.out.println("Validity: " + validityDays + " days");
        System.out.println("Price: $" + price);
        System.out.println("---------------------------");
    }

    public static void main(String[] args) {
        mobile originalPlan = new mobile("PRE-599", "Unlimited Pro", 84, 599.0);

        System.out.println("Original Plan Details:");
        originalPlan.displayPlanDetails();

        mobile newPlan = new mobile(originalPlan);

        System.out.println("Copied Plan (Initial):");
        newPlan.displayPlanDetails();

        newPlan.setPrice(649.0);
        newPlan.setValidityDays(90);

        System.out.println("Copied Plan (After Changes):");
        newPlan.displayPlanDetails();

        System.out.println("Original Plan (Verifying it remains unchanged):");
        originalPlan.displayPlanDetails();
    }
}