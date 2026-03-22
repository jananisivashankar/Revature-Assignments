// Interface 1
interface Connectable {
    void connectToWifi();
}

// Interface 2
interface Controllable {
    void turnOn();
    void turnOff();
}

// Class implementing Multiple Interfaces
class SmartProjector implements Connectable, Controllable {
    int deviceId;
    String brand;

    SmartProjector(int id, String brand) {
        this.deviceId = id;
        this.brand = brand;
    }

    @Override
    public void connectToWifi() {
        System.out.println(brand + " Projector is connecting to Wi-Fi...");
    }

    @Override
    public void turnOn() {
        System.out.println(brand + " Projector (ID: " + deviceId + ") is now ON.");
    }

    @Override
    public void turnOff() {
        System.out.println(brand + " Projector is shutting down.");
    }

    void displayDeviceInfo() {
        System.out.println("Device ID: " + deviceId);
        System.out.println("Brand: " + brand);
    }
}

// Removed 'public' so it doesn't matter what your filename is
class SmartDeviceApp {
    public static void main(String[] args) {
        SmartProjector myProjector = new SmartProjector(8801, "Samsung");

        System.out.println("--- Smart Device Flow ---");
        myProjector.displayDeviceInfo();
        myProjector.connectToWifi();
        myProjector.turnOn();
        myProjector.turnOff();
    }
}