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