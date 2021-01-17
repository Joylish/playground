package com.soft.Domain;

public class Product {
    public int productCode;
    public String productName;
    public int productSize;
    public int productPrice;
    public int prouductQuantity;

    public Product(int productCode, String productName, int productSize, int productPrice,int productQuantity)
    {
        this.productCode = productCode;
        this.productName = productName;
        this.productSize = productSize;
        this.productPrice = productPrice;
        this.prouductQuantity = productQuantity;
    }
}
