package assignment09;

import java.util.*;

class Product {
    int productId;
    String productName;
    String category;
    String brand;
    double price;
    int stock;
    double rating;
    double discountPercentage;
    boolean inStock;

    public Product(int productId, String productName, String category, String brand,
                   double price, int stock, double rating, double discountPercentage) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
        this.brand = brand;
        this.price = price;
        this.stock = stock;
        this.rating = rating;
        this.discountPercentage = discountPercentage;
        this.inStock = stock > 0;
    }

    public String toString() {
        return "Product{" +
                "id=" + productId +
                ", name='" + productName + '\'' +
                ", category='" + category + '\'' +
                ", brand='" + brand + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", rating=" + rating +
                ", discount=" + discountPercentage +
                "%, inStock=" + inStock +
                '}';
    }
}

public class ProductApp {
    public static void main(String[] args) {

        List<Product> products = new ArrayList<>(Arrays.asList(
                new Product(1, "Laptop", "Electronics", "Dell", 65000, 10, 4.6, 10),
                new Product(2, "Smartphone", "Electronics", "Samsung", 75000, 5, 4.8, 5),
                new Product(3, "T-Shirt", "Fashion", "Nike", 1500, 20, 4.2, 15),
                new Product(4, "Jeans", "Fashion", "Levis", 2500, 0, 3.9, 20),
                new Product(5, "Soap", "Grocery", "Dove", 50, 100, 4.4, 0),
                new Product(6, "Headphones", "Electronics", "Sony", 12000, 8, 4.7, 10)
        ));

        products.forEach(p -> System.out.println(p.productName));

        products.stream().filter(p -> p.price > 5000).forEach(System.out::println);

        products.stream().filter(p -> p.category.equalsIgnoreCase("Electronics")).forEach(System.out::println);

        products.stream().filter(p -> p.inStock).forEach(System.out::println);

        products.stream().sorted(Comparator.comparingDouble(p -> p.price)).forEach(System.out::println);

        products.stream().sorted(Comparator.comparingDouble((Product p) -> p.price).reversed()).forEach(System.out::println);

        products.stream().sorted(Comparator.comparingDouble((Product p) -> p.rating).reversed()).forEach(System.out::println);

        products.stream().sorted(Comparator.comparing(p -> p.productName)).forEach(System.out::println);

        boolean anyAbove70k = products.stream().anyMatch(p -> p.price > 70000);
        boolean allAbove3_5 = products.stream().allMatch(p -> p.rating > 3.5);
        boolean noMedical = products.stream().noneMatch(p -> p.category.equalsIgnoreCase("Medical"));

        System.out.println("Any > 70000: " + anyAbove70k);
        System.out.println("All rating > 3.5: " + allAbove3_5);
        System.out.println("No Medical: " + noMedical);

        products.stream().max(Comparator.comparingDouble(p -> p.price)).ifPresent(System.out::println);

        products.stream().min(Comparator.comparingDouble(p -> p.price)).ifPresent(System.out::println);

        products.stream()
                .filter(p -> p.category.equalsIgnoreCase("Electronics"))
                .forEach(p -> p.price *= 1.05);

        products.stream()
                .filter(p -> p.category.equalsIgnoreCase("Fashion"))
                .forEach(p -> p.discountPercentage += 10);

        products.forEach(p -> {
            if (p.stock == 0) p.inStock = false;
        });

        long fashionCount = products.stream()
                .filter(p -> p.category.equalsIgnoreCase("Fashion"))
                .count();

        long highRatedCount = products.stream()
                .filter(p -> p.rating > 4.5)
                .count();

        long outOfStockCount = products.stream()
                .filter(p -> !p.inStock)
                .count();

        System.out.println("Fashion count: " + fashionCount);
        System.out.println("High rated: " + highRatedCount);
        System.out.println("Out of stock: " + outOfStockCount);
    }
}