package com.soft.Controller;

import com.soft.Printer;
import com.soft.Service.ManageCategory;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class CategoryHandler {

    ManageCategory mc = new ManageCategory();

    public void run() {
        int userInput = -1;
        try{
            while(true) {
                Printer.printDivider();
                Printer.println("원하시는 메뉴를 골라 주세요.");
                p("1. 카테고리 조회");
                p("2. 카테고리 생성");
                p("3. 카테고리 삭제");
                p("4. 돌아가기");
                userInput = Printer.intQuestion("입력");

                switch(userInput){
                    case 1:
                        searchCategory();
                        break;
                    case 2:
                        createCategory();
                        break;
                    case 3:
                        removeCategory();
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

    private void removeCategory() {
    }

    private void createCategory() {
    }

    public void searchCategory() {
       
    }

    static void p(String x) {
        Printer.println(x);
    }
}
