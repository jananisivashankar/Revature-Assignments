// Parent Class
class Customer {
    int customerId;
    String customerName;
    String email;

    void registerCustomer(int id, String name, String mail) {
        this.customerId = id;
        this.customerName = name;
        this.email = mail;
    }

    void displayCustomer() {
        System.out.println("Customer ID: " + customerId);
        System.out.println("Name: " + customerName);
        System.out.println("Email: " + email);
    }
}

// Child Class extending Customer
class PremiumCustomer extends Customer {
    String membershipLevel;
    int rewardPoints;

    void applyPremiumBenefits(String level, int points) {
        this.membershipLevel = level;
        this.rewardPoints = points;
    }

    void displayPremiumCustomer() {
        // Accessing inherited method from Parent
        displayCustomer();
        // Accessing own fields
        System.out.println("Membership Level: " + membershipLevel);
        System.out.println("Reward Points: " + rewardPoints);
        System.out.println("Benefits: Free Delivery & Early Access Enabled");
    }
}

// Main class name matches the filename ECommerceSystem.java
public class ECommerceSystem {
    public static void main(String[] args) {
        // Create one PremiumCustomer object
        PremiumCustomer premiumUser = new PremiumCustomer();

        // Assign inherited values (Parent class members)
        premiumUser.registerCustomer(101, "Janani Sivashankar", "janani@example.com");

        // Assign own values (Child class members)
        premiumUser.applyPremiumBenefits("Gold", 500);

        // Display full details
        System.out.println("--- Full Premium Customer Profile ---");
        premiumUser.displayPremiumCustomer();
    }
}