package com.soft.Service;

import java.util.ArrayList;
import com.soft.Domain.Item;

public class ManageItem {
   public static ArrayList<Item> ItemList = new ArrayList<Item>();
   int listSize = 1;

   public ManageItem() {
      this.ItemList.add(new Item("나이키프리런", 245, 30, 39000, "asdasd"));
   }

   public ArrayList<String> show(String name) {

      String[] result = new String[4];
      for (int i = 0; i < listSize; i++) {
         if (ItemList.get(i).itemName.equals(name)) {
            result[0] = (ItemList.get(i).desc.productCode);
            result[1] = ItemList.get(i).itemName;
            result[2] = Integer.toString(ItemList.get(i).itemSize);
            result[3] = Integer.toString(ItemList.get(i).desc.productPrice);
         }
      }

      // 중복되는값을 제거하고 ArrayList로 리턴한다!
      ArrayList<String> arrayList = new ArrayList<>();
      for (String data : result) {
         arrayList.add(data);
      }
      return arrayList;
   }

   // 상품추가하는 함수
   public boolean insert(String name, int size, int price, int quantity,String code) {
      this.ItemList.add(new Item(name, size, quantity, price, code));
      listSize += 1;
      System.out.println("완료");
      return true;
   }

   // 이름으로 상품삭제하는 함수
   public boolean delete(String name) {
      for (int i = 0; i < listSize; i++) {
         if (ItemList.get(i).itemName.equals(name)) {
            ItemList.remove(i);
         }
      }
      listSize -= 1;
      System.out.println("완료");
      return true;
   }

   // 이름으로 재고조회하는 함수
   public int showQuantity(String name) {

      int result = 0;
      for (int i = 0; i < listSize; i++) {
         if (ItemList.get(i).itemName.equals(name)) {
            result = ItemList.get(i).itemQuantity;
         }
      }

      return result;
   }

   // 이름으로 재고수정하는 함수
   public boolean modifyQuantity(String name, int quantity) {
      for (int i = 0; i < listSize; i++) {
         if (ItemList.get(i).itemName.equals(name)) {
            ItemList.get(i).itemQuantity = quantity;

         }
      }
      System.out.println("완료");
      return true;
   }

}