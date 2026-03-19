import java.util.Scanner;

class BankAccount {
    private String accountNumber;
    private String customerName;
    private String accountType;
    private double balance;

    public BankAccount(String accountNumber, String customerName, String accountType, double balance) {
        this.accountNumber= accountNumber;
        this.customerName= customerName;
        this.accountType= accountType;
        this.balance =balance;
    }
    public void displayAccountInfo() {
        System.out.println("----- Account Details -----");
        System.out.println("Account Number: " + accountNumber);
        System.out.println("Customer Name: " + customerName);
        System.out.println("Account Type: " + accountType);
        System.out.println("Balance: " + balance);
        System.out.println("---------------------------");
    }

    // Deposit method
    public void deposit(double amount) {
        if (amount > 0) {
            balance+= amount;
            System.out.println("Successfully deposited: " + amount);
            System.out.println("Updated Balance: " + balance);
        } else {
            System.out.println("Deposit amount must be greater than 0.");
        }
    }
    public void withdraw(double amount) {
        if (amount<= 0) {
            System.out.println("Withdrawal amount must be greater than 0.");
        } else if (amount> balance) {
            System.out.println("Insufficient balance! Current balance: " + balance);
        } else {
            balance-= amount;
            System.out.println("Successfully withdrawn: " + amount);
            System.out.println("Updated Balance: " + balance);
        }
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Account Number: ");
        String accNum= sc.nextLine();
        System.out.print("Enter Customer Name: ");
        String custName = sc.nextLine();
        System.out.print("Enter Account Type: ");
        String accType= sc.nextLine();
        System.out.print("Enter Initial Balance: ");
        double bal= sc.nextDouble();


        BankAccount account= new BankAccount(accNum,custName,accType, bal);
        account.displayAccountInfo();


        System.out.print("Enter amount to deposit: ");
        double depositAmount= sc.nextDouble();
        account.deposit(depositAmount);


        System.out.print("Enter amount to withdraw: ");
        double withdrawAmount= sc.nextDouble();
        account.withdraw(withdrawAmount);


        account.displayAccountInfo();

        sc.close();
    }
}