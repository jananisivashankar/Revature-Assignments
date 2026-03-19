class Employee {
    private int employeeId;
    private String employeeName;
    private double basicSalary;
    private double allowance;
    private double taxPercentage;

    public Employee(int employeeId, String employeeName, double basicSalary, double taxPercentage) {
        this.employeeId = employeeId;
        setEmployeeName(employeeName);
        setBasicSalary(basicSalary);
        setTaxPercentage(taxPercentage);
        this.allowance = 5000;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        if (employeeName == null || employeeName.isBlank()) {
            System.out.println("Error: Employee name cannot be blank.");
        } else {
            this.employeeName = employeeName;
        }
    }

    public void setBasicSalary(double basicSalary) {
        if (basicSalary < 0) {
            System.out.println("Error: Basic salary cannot be negative.");
        } else {
            this.basicSalary = basicSalary;
        }
    }

    public void setTaxPercentage(double taxPercentage) {
        if (taxPercentage < 0 || taxPercentage > 30) {
            System.out.println("Error: Tax percentage must be between 0 and 30.");
        } else {
            this.taxPercentage = taxPercentage;
        }
    }

    public double calculateGrossSalary() {
        return basicSalary + allowance;
    }

    public double calculateTaxAmount() {
        return calculateGrossSalary() * taxPercentage / 100;
    }

    public double calculateNetSalary() {
        return calculateGrossSalary() - calculateTaxAmount();
    }

    public void displaySalarySlip() {
        System.out.println("Employee ID: " + employeeId);
        System.out.println("Employee Name: " + employeeName);
        System.out.println("Net Salary: " + calculateNetSalary());

    }
}

class Main {
    public static void main(String[] args) {
        Employee emp = new Employee(101, "Janani", 40000, 10);
        emp.displaySalarySlip();

        emp.setBasicSalary(45000);
        emp.setTaxPercentage(12);
        emp.displaySalarySlip();
    }
}