// Level 1: Base Class
class User {
    int userId;
    String name;

    void login() {
        System.out.println("User " + name + " logged in successfully.");
    }

    void displayUser() {
        System.out.println("User ID: " + userId);
        System.out.println("Name: " + name);
    }
}

// Level 2: Intermediate Class (Inherits from User)
class Instructor extends User {
    String subject;
    int yearsOfExperience;

    void uploadCourse() {
        System.out.println(name + " is uploading a new course on " + subject + ".");
    }

    void conductSession() {
        System.out.println(name + " is starting a live session for " + subject + ".");
    }
}

// Level 3: Child Class (Inherits from Instructor)
class SeniorInstructor extends Instructor {
    int mentorBatchCount;
    String specialization;

    void reviewContent() {
        System.out.println("Senior Instructor " + name + " is reviewing course content for " + specialization + ".");
    }

    void assignInstructorTasks() {
        System.out.println("Assigning tasks to junior instructors for " + mentorBatchCount + " batches.");
    }

    void displaySeniorInstructorProfile() {
        System.out.println("--- Complete Instructor Profile ---");
        // Accessing Method from Level 1 (User)
        displayUser();
        // Accessing Fields from Level 2 (Instructor)
        System.out.println("Subject: " + subject);
        System.out.println("Experience: " + yearsOfExperience + " years");
        // Accessing Fields from Level 3 (SeniorInstructor)
        System.out.println("Specialization: " + specialization);
        System.out.println("Mentoring Batches: " + mentorBatchCount);
    }
}

public class EdTechPlatform {
    public static void main(String[] args) {
        // Step 1: Create one SeniorInstructor object
        SeniorInstructor si = new SeniorInstructor();

        // Step 2: Access properties from all three levels
        si.userId = 5001;               // From User
        si.name = "Dr. Arshitha";       // From User
        si.subject = "Java Full Stack"; // From Instructor
        si.yearsOfExperience = 12;      // From Instructor
        si.mentorBatchCount = 5;        // From SeniorInstructor
        si.specialization = "Cloud Architecture"; // From SeniorInstructor

        // Step 3: Show multilevel inheritance by calling methods from all levels
        si.login();                     // Level 1 Method
        si.conductSession();            // Level 2 Method
        si.reviewContent();             // Level 3 Method

        // Step 4: Display complete profile
        si.displaySeniorInstructorProfile();
    }
}