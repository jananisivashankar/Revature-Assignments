import java.util.Scanner;

class InvalidCustomerNameException extends Exception {
    public InvalidCustomerNameException(String message) {
        super(message);
    }
}

class InvalidMovieException extends Exception {
    public InvalidMovieException(String message) {
        super(message);
    }
}

class InvalidTicketCountException extends Exception {
    public InvalidTicketCountException(String message) {
        super(message);
    }
}

class InsufficientSeatsException extends Exception {
    public InsufficientSeatsException(String message) {
        super(message);
    }
}

class PaymentFailedException extends Exception {
    public PaymentFailedException(String message) {
        super(message);
    }
}

class CancellationNotAllowedException extends Exception {
    public CancellationNotAllowedException(String message) {
        super(message);
    }
}

class Booking {
    String customerName;
    String movieName;
    int ticketCount;
    double totalAmount;
    boolean isCancelled = false;

    static int availableSeats = 5;
    static final double TICKET_PRICE = 200.0;

    public Booking(String customerName, String movieName, int ticketCount)
            throws InvalidCustomerNameException, InvalidMovieException,
            InvalidTicketCountException, InsufficientSeatsException {

        if (customerName == null || customerName.trim().isEmpty()) {
            throw new InvalidCustomerNameException("Customer name cannot be empty.");
        }

        if (!(movieName.equalsIgnoreCase("Leo") ||
                movieName.equalsIgnoreCase("Jailer") ||
                movieName.equalsIgnoreCase("Vikram"))) {
            throw new InvalidMovieException("Invalid movie selected.");
        }

        if (ticketCount <= 0) {
            throw new InvalidTicketCountException("Ticket count must be greater than 0.");
        }

        if (ticketCount > availableSeats) {
            throw new InsufficientSeatsException("Not enough seats available.");
        }

        this.customerName = customerName;
        this.movieName = movieName;
        this.ticketCount = ticketCount;
        this.totalAmount = ticketCount * TICKET_PRICE;

        availableSeats -= ticketCount;
    }

    public void makePayment(double amount) throws PaymentFailedException {
        if (amount < totalAmount) {
            throw new PaymentFailedException("Payment is insufficient.");
        }
        System.out.println("Payment successful.");
    }

    public void cancelBooking() throws CancellationNotAllowedException {
        if (isCancelled) {
            throw new CancellationNotAllowedException("Booking is already cancelled.");
        }
        isCancelled = true;
        availableSeats += ticketCount;
        System.out.println("Booking cancelled successfully.");
    }

    public void displayBooking() {
        System.out.println("Customer Name: " + customerName);
        System.out.println("Movie Name   : " + movieName);
        System.out.println("Tickets      : " + ticketCount);
        System.out.println("Total Amount : " + totalAmount);
        System.out.println("Available Seats Left: " + availableSeats);
    }
}

public class OnlineMovieTicketBookingSystem {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Booking booking = null;

        try {
            System.out.print("Enter customer name: ");
            String name = sc.nextLine();

            System.out.print("Enter movie name (Leo / Jailer / Vikram): ");
            String movie = sc.nextLine();

            System.out.print("Enter number of tickets: ");
            int tickets = sc.nextInt();

            booking = new Booking(name, movie, tickets);
            booking.displayBooking();

            System.out.print("Enter payment amount: ");
            double payment = sc.nextDouble();
            booking.makePayment(payment);

            sc.nextLine();
            System.out.print("Do you want to cancel booking? (yes/no): ");
            String cancelChoice = sc.nextLine();

            if (cancelChoice.equalsIgnoreCase("yes")) {
                booking.cancelBooking();
                booking.cancelBooking();
            }

        } catch (InvalidCustomerNameException |
                 InvalidMovieException |
                 InvalidTicketCountException |
                 InsufficientSeatsException |
                 PaymentFailedException |
                 CancellationNotAllowedException e) {
            System.out.println("Exception: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Unexpected Error: " + e.getMessage());
        } finally {
            System.out.println("Thank you for using the Movie Ticket Booking System.");
            sc.close();
        }
    }
}