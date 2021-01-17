package com.soft.Handler;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

import com.soft.Printer;
import com.soft.Service.ManageProduct;

public class ProductHandler {
	private ManageProduct mp = new ManageProduct();

	public void start(CategoryHandler C) {
		int userInput = -1;
		try {
			while (true) {
				Printer.printDivider();
				Printer.println("원하시는 메뉴를 골라 주세요.");
				p("1. 상품 조회");
				p("2. 상품 등록");
				p("3. 상품 삭제");
				p("4. 돌아가기");
				userInput = Printer.intQuestion("입력");

				switch (userInput) {
				case 1:
					searchProduct();
					break;
				case 2:
					createProduct(C);
					break;
				case 3:
					removeProduct();
					break;
				case 4:
				case 'q':
				case 'Q':
					HomeHandler homeHandler = new HomeHandler();
					homeHandler.start();
					break;
				default:
					System.out.println("잘못 입력하셨습니다.");
				}
			}
		} catch (Exception e) {

		}
	}

	public void searchProduct() {
		Scanner sc = new Scanner(System.in);
		String searchName = "";
		System.out.println("찾으실 상품명을 입력해주세요");
		searchName = sc.next();

		// 검색
		ArrayList<String> a = mp.show(searchName);

		// 검색값출력
		if (a.get(0) != null) {
			a.removeAll(Collections.singleton(null));
			System.out.println("1. 코드: " + a.get(0));
			System.out.println("2. 이름: " + a.get(1));
			System.out.println("3. 사이즈: " + a.get(2));
			System.out.println("4. 가격: " + a.get(3));
		} else {
			System.out.println("해당상품이 없습니다!");
		}
	}

	public void createProduct(CategoryHandler C) {
		Scanner sc = new Scanner(System.in);
		System.out.println("등록할 상품이름을 입력하세요: ");
		String name = sc.next();
		System.out.println("사이즈를 입력하세요: ");
		int size = sc.nextInt();
		System.out.println("가격을 입력하세요: ");
		int price = sc.nextInt();
		System.out.println("재고를 입력하세요: ");
		int quantity = sc.nextInt();
		mp.insert(C.SelectCategorySet(),name, size, price,quantity);
	}

	public void removeProduct() {
		Scanner sc = new Scanner(System.in);
		System.out.println("삭제할 상품이름을 입력하세요: ");
		String name = sc.next();
		mp.delete(name);
	}
	
	public void searchQuantity() {
		Scanner sc = new Scanner(System.in);
		System.out.println("조회할 상품이름을 입력하세요: ");
		String name = sc.next();
		int result = mp.showQuantity(name);
		System.out.println(name+"의 현재재고는 "+result+"입니다");
	}
	
	public void changeQuantity() {
		Scanner sc = new Scanner(System.in);
		System.out.println("재고를 수정할 상품이름을 입력하세요: ");
		String name = sc.next();
		int result = mp.showQuantity(name);
		System.out.println(name+"의 현재재고는 "+result+"입니다");
		System.out.println("수정할 재고량을 입력하세요: ");
		int change = sc.nextInt();
		mp.modifyQuantity(name, change);
	}

	static void p(String x) {
		Printer.println(x);
	}
}
