package com.soft.Service;

import java.util.ArrayList;
import com.soft.Domain.Product;

public class ManageProduct {
	public static ArrayList<Product> ProductList = new ArrayList<Product>();
	int listSize = 1;

	public ManageProduct() {
		this.ProductList.add(new Product(1,"나이키프리런",245,39000,30));
	}

	// 모든 상품목록 리턴하는 함수
//	public ArrayList<String> show() {
//
//		String[] result = new String[4*listSize];
//		for (int i = 0; i < listSize; i++) {
//			if (ProductList[i].ProductName.equals(name)) {
//				result[0] = Integer.toString((ProductList[i].ProductCode));
//				result[1] = ProductList[i].ProductName;
//				result[2] = Integer.toString(ProductList[i].ProductSize);
//				result[3] = Integer.toString(ProductList[i].ProductPrice);
//			}
//		}
//
//		// 중복되는값을 제거하고 ArrayList로 리턴한다!
//		ArrayList<String> arrayList = new ArrayList<>();
//		for (String data : result) {
//			arrayList.add(data);
//		}
//		return arrayList;
//	}

	// 인자로 들어온 이름에 대한 Item상세정보 출력하는 함수
	public ArrayList<String> show(String name) {

		String[] result = new String[4];
		for (int i = 0; i < listSize; i++) {
			if (ProductList.get(i).productName.equals(name)) {
				result[0] = Integer.toString((ProductList.get(i).productCode));
				result[1] = ProductList.get(i).productName;
				result[2] = Integer.toString(ProductList.get(i).productSize);
				result[3] = Integer.toString(ProductList.get(i).productPrice);
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
	public boolean insert(String name, int size, int price, int quantity) {
		this.ProductList.add(new Product(listSize, name, size, price, quantity));
		listSize++;
		System.out.println("완료");
		return true;
	}

	// 이름으로 상품삭제하는 함수
	public boolean delete(String name) {
		for (int i = 0; i < listSize; i++) {
			if (ProductList.get(i).productName.equals(name)) {
				ProductList.remove(i);
			}
		}
		listSize--;
		System.out.println("완료");
		return true;
	}

	// 이름으로 재고조회하는 함수
	public int showQuantity(String name) {

		int result = 0;
		for (int i = 0; i < listSize; i++) {
			if (ProductList.get(i).productName.equals(name)) {
				result = ProductList.get(i).prouductQuantity;
			}
		}

		return result;
	}

	// 이름으로 재고수정하는 함수
	public boolean modifyQuantity(String name, int quantity) {
		for (int i = 0; i < listSize; i++) {
			if (ProductList.get(i).productName.equals(name)) {
				Product change = new Product(ProductList.get(i).productCode, ProductList.get(i).productName,
						ProductList.get(i).productSize, ProductList.get(i).productPrice, quantity);
				ProductList.set(i, change);
			}
		}
		System.out.println("완료");
		return true;
	}

}
