package model;

public class Review {
    private String productId;
    private String comment;
    private int rating;

    public Review(String productId, String comment, int rating) {
        this.productId = productId;
        this.comment = comment;
        this.rating = rating;
    }
}

