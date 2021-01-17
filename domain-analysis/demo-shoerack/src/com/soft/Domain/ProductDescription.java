package com.soft.Domain;

public class ProductDescription {
   public String productCode;
    public int productPrice;
    
    public ProductDescription(int price, String productCode)
    {
        this.productCode = productCode;
        this.productPrice = price;
    }
}