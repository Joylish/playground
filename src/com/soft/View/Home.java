package com.soft.View;

import com.soft.Controller.CategoryHandler;
import com.soft.Controller.ProductHandler;
import com.soft.Printer;

public class Home {
    public void run(){
        int userInput = -1;
        Printer.printDivider();
        Printer.println("반갑습니다 :)");
        Printer.println("상품관리시스템 ShoeRack 입니다.");
        try{
            while(true) {
                Printer.printDivider();
                Printer.println("원하시는 메뉴를 골라 주세요.");
                p("1. 카테고리 관리");
                p("2. 상품 관리");
                p("3. 재고 관리");
                p("4. 프로그램 종료");
                userInput = Printer.intQuestion("입력");

                switch(userInput){
                    case 1:
                        CategoryHandler categoryHandler = new CategoryHandler();
                        categoryHandler.start();
                        break;
                    case 2:
                        ProductHandler productHandler = new ProductHandler();
                        productHandler.start();
                        break;
                    case 3:
                        
                        break;
                    case 4:
                    case 'q':
                    case 'Q':
                        Printer.printDivider();
                        p("시스템이 종료되었습니다. 감사합니다");
                        break;
                    default:
                        System.out.println("잘못 입력하셨습니다.");
                }
            }
        }catch (Exception e) {

        }
    }

    static void p(String x) {
        Printer.println(x);
    }
}
