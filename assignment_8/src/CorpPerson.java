// Base Class
class CorpPerson {
    int personId;
    String name;

    void displayPersonInfo() {
        System.out.println("ID: " + personId + " | Name: " + name);
    }
}

// Intermediate Class (Multilevel)
class CorpEmployee extends CorpPerson {
    String department;
    String employeeCode;

    void accessEmployeePortal() {
        System.out.println(name + " is accessing the " + department + " portal.");
    }
}

// Interfaces
interface Authenticatable {
    void login();
}

interface ReportAccessible {
    void accessReports();
}

// Child Class (Hybrid: Extends Employee AND Implements Interfaces)
class CorpManager extends CorpEmployee implements Authenticatable, ReportAccessible {
    int teamSize;

    @Override
    public void login() {
        System.out.println("Manager " + name + " authenticated via Corporate SSO.");
    }

    @Override
    public void accessReports() {
        System.out.println("Accessing confidential quarterly reports for department: " + department);
    }

    void approveLeave() {
        System.out.println("Manager " + name + " is reviewing leave requests for a team of " + teamSize);
    }

    void conductTeamMeeting() {
        System.out.println("Conducting weekly sync for " + department + " department.");
    }
}

class HybridInheritanceApp {
    public static void main(String[] args) {
        // Create one Manager object
        CorpManager mgr = new CorpManager();

        // Assigning values across the hierarchy
        mgr.personId = 7001;               // From Person
        mgr.name = "Janani S";             // From Person
        mgr.department = "Engineering";    // From Employee
        mgr.employeeCode = "EMP-99";       // From Employee
        mgr.teamSize = 12;                 // From Manager

        System.out.println("--- Corporate Access Management ---");

        // Calling methods from all levels
        mgr.displayPersonInfo();           // Parent
        mgr.login();                       // Interface 1
        mgr.accessEmployeePortal();        // Intermediate
        mgr.accessReports();               // Interface 2
        mgr.approveLeave();                // Current Class
        mgr.conductTeamMeeting();          // Current Class
    }
}