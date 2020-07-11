package com.soft.Handler;

import com.soft.Printer;

public class ProductHandler {
    public void start() {
        int userInput = -1;
        try{
            while(true) {
                Printer.printDivider();
                Printer.println("원하시는 메뉴를 골라 주세요.");
                p("1. 상품 조회");
                p("2. 상품 등록");
                p("3. 상품 삭제");
                p("4. 돌아가기");
                userInput = Printer.intQuestion("입력");

                switch(userInput){
                    case 1:
                        searchProduct();
                        break;
                    case 2:
                        createProduct();
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
        }catch (Exception e) {

        }
    }

    private void searchProduct() {
    }
    private void  createProduct() {
    }
    private void removeProduct() {
    }


    static void p(String x) {
        Printer.println(x);
    }
}
