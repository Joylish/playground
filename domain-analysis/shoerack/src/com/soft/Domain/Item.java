package com.soft.Domain;

public class Item {
   public String itemName;
   public int itemSize;
   public int itemQuantity;
   public ProductDescription desc;
   
   public Item(String itemName, int itemSize, int itemQuantity, int productPrice, String code) {
      this.itemName = itemName;
      this.itemSize = itemSize;
      this.itemQuantity = itemQuantity;
      this.desc = new ProductDescription(productPrice, code);
   }
   
}