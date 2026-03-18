class Product {
    private int productId;
    private String productName;
    private double originalPrice;
    private double discountPercentage;
    private int stockQuantity;

    public Product(int productId, String productName, double originalPrice, double discountPercentage, int stockQuantity) {
        this.productId = productId; // ID cannot be changed (no setter)
        setProductName(productName);
        setOriginalPrice(originalPrice);
        setDiscountPercentage(discountPercentage);
        setStockQuantity(stockQuantity);
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        if (productName == null || productName.isBlank()) {
            System.out.println("Error: Product name cannot be blank.");
        } else {
            this.productName = productName;
        }
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        if (originalPrice > 0) {
            this.originalPrice = originalPrice;
        } else {
            System.out.println("Error: Price must be greater than 0.");
        }
    }

    public double getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(double discountPercentage) {
        if (discountPercentage >= 0 && discountPercentage <= 60) {
            this.discountPercentage = discountPercentage;
        } else {
            System.out.println("Error: Discount must be between 0 and 60.");
        }
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        if (stockQuantity >= 0) {
            this.stockQuantity = stockQuantity;
        } else {
            System.out.println("Error: Stock cannot be negative.");
        }
    }

    public double calculateDiscountAmount() {
        return originalPrice * (discountPercentage / 100);
    }

    public double calculateFinalPrice() {
        return originalPrice - calculateDiscountAmount();
    }

    public void sellProduct(int qty) {
        if (qty > 0 && qty <= stockQuantity) {
            stockQuantity -= qty;
            System.out.println("Successfully sold " + qty + " units of " + productName);
        } else {
            System.out.println("Error: Insufficient stock or invalid quantity.");
        }
    }

    public void displayProductDetails() {
        System.out.println("------ Product Details ------");
        System.out.println("Product ID: " + productId);
        System.out.println("Product Name: " + productName);
        System.out.println("Original Price: " + originalPrice);
        System.out.println("Discount: " + discountPercentage + "%");
        System.out.println("Final Price: " + calculateFinalPrice());
        System.out.println("Stock Remaining: " + stockQuantity);
        System.out.println("-----------------------------\n");
    }
}

class ProductRunner {
    public static void main(String[] args) {
        Product myProduct = new Product(501, "Laptop", 50000, 10, 15);

        myProduct.displayProductDetails();

        // Testing business rules
        myProduct.sellProduct(3);
        myProduct.setDiscountPercentage(25);

        myProduct.displayProductDetails();
    }
}