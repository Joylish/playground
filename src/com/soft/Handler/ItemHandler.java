package com.soft.Controller;

import com.soft.Printer;

public class ItemHandler {
    public void run() {
        int userInput = -1;
        try{
            while(true) {
                Printer.printDivider();
                Printer.println("원하시는 메뉴를 골라 주세요.");
                p("1. 모든 재고 조회");
                p("2. 특정 재고 조회");
                p("3. 재고 수정");
                p("4. 돌아가기");
                userInput = Printer.intQuestion("입력");

                switch(userInput){
                    case 1:
                        searchItemList();
                        break;
                    case 2:
                        searchOneItem();
                        break;
                    case 3:
                        updateOneItem();
                        break;
                    case 4:
                    case 'q':
                    case 'Q':
                        HomeHandler homeHandler = new HomeHandler();
                        homeHandler.run();
                        break;
                    default:
                        System.out.println("잘못 입력하셨습니다.");
                }
            }
        }catch (Exception e) {

        }
    }

    private void searchItemList() {
    }
    private void searchOneItem() {
    }
    private void updateOneItem() {
    }

    static void p(String x) {
        Printer.println(x);
    }
}
