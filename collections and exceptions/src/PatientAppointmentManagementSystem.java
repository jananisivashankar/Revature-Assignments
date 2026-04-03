import java.util.*;

public class PatientAppointmentManagementSystem {
    public static void main(String[] args) {

        List<String> appointments = new ArrayList<>();

        appointments.add("Arun");
        appointments.add("Meena");
        appointments.add("Karthik");
        appointments.add("Divya");
        appointments.add("Meena");
        appointments.add("Rahul");

        System.out.println("Initial Appointments: " + appointments);

        appointments.add(2, "Emergency - Suresh");
        System.out.println("After adding emergency patient: " + appointments);

        appointments.set(3, "Karthik Kumar");
        System.out.println("After updating appointment: " + appointments);

        appointments.remove("Divya");
        System.out.println("After removing cancelled appointment: " + appointments);

        System.out.println("Does Meena exist? " + appointments.contains("Meena"));

        System.out.println("Total appointments: " + appointments.size());

        System.out.println("First occurrence of Meena: " + appointments.indexOf("Meena"));
        System.out.println("Last occurrence of Meena: " + appointments.lastIndexOf("Meena"));

        System.out.println("\nTraversing appointments:");
        for (int i = 0; i < appointments.size(); i++) {
            System.out.println((i + 1) + ". " + appointments.get(i));
        }

        appointments.clear();
        System.out.println("\nAfter clearing appointments: " + appointments);
    }
}