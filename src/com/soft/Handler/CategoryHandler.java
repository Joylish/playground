package com.soft.Handler;

import com.soft.Domain.CategorySet;
import com.soft.Domain.LargeCategory;
import com.soft.Printer;
import com.soft.Service.ManageCategory;

import java.util.*;

public class CategoryHandler {

    ManageCategory mc = new ManageCategory();

    public void start() {
        int userInput = -1;
        try {
            while (true) {
                Printer.printDivider();
                Printer.println("원하시는 메뉴를 골라 주세요.");
                p("1. 카테고리 조회");
                p("2. 카테고리 생성");
                p("3. 카테고리 삭제");
                p("4. 돌아가기");
                userInput = Printer.intQuestion("입력");

                switch (userInput) {
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
                        homeHandler.start();
                        break;
                    default:
                        System.out.println("잘못 입력하셨습니다.");
                }
            }
        } catch (Exception e) {

        }
    }

    private void removeCategory() {
    }

    private void createCategory() {
    }

    public void searchCategory() {

        Printer.printDivider();
        Printer.println("카테고리 조회를 진행합니다.");
        int userInput = -1;
        String userLargeCategory = "";
        String userMediumCategory = "";
        String userSmallCategory = "";
        ManageCategory manageCategory = new ManageCategory();

        Printer.println("대분류를 골라 주세요.");
        ArrayList<String> largeCategory = manageCategory.show();
        int index = 0;
        for (String data : largeCategory) {
            data = ". " + data;
            p(++index + data);
        }
        userInput = Printer.intQuestion("입력");
        userLargeCategory = largeCategory.get(userInput - 1);
//        System.out.printf("입력하신 %s 입니다. 다시 선택하시겠습니까?", userLargeCategory);
//        Printer.printReturn();
//        p("1. 중분류 고르기");
//        p("2. 다시 선택하기");
//        p("3. 카테고리 홈화면으로 가기");
//        userInput = Printer.intQuestion("입력");
//        switch (userInput) {
//            case 1:
//                System.out.println("00000000000000000000");
//                break;
//            case 2:
//            case 3:
//                start();
//                break;
//            default:
//                System.out.println("잘못 입력하셨습니다.");
//        }


        Printer.printDivider();
        Printer.println("중분류를 골라 주세요.");
        ArrayList<String> mediumCategory = manageCategory.show(userLargeCategory);
        index = 0;
        for (String data : mediumCategory) {
            data = ". " + data;
            p(++index + data);
        }

        userInput = Printer.intQuestion("입력");
        userMediumCategory = mediumCategory.get(userInput - 1);

//        System.out.printf("입력하신 %s 입니다. 다시 선택하시겠습니까?", userMediumCategory);
//        Printer.printReturn();
//        p("1. 소분류 보기");
//        p("2. 다시 선택하기");
//        p("3. 카테고리 홈화면으로 가기");

//        userInput = Printer.intQuestion("입력");
//        switch (userInput) {
//            case 1:
//                break;
//            case 2:
//            case 3:
//                start();
//                break;
//            default:
//                System.out.println("잘못 입력하셨습니다.");
//        }
//    }

        Printer.printDivider();
        Printer.println("소분류 현황입니다.");

        ArrayList<String> smallCategory = manageCategory.show(userLargeCategory, userMediumCategory);
        for (String data : smallCategory) {
            p(data);
        }
        Printer.printDivider();
        System.out.printf("다른 카테고리 목록을 보시겠습니까?", userMediumCategory);
        Printer.printReturn();
        p("1. 다른 카테고리 보기");
        p("2. 카테고리 홈화면으로 가기");
        userInput = Printer.intQuestion("입력");
        switch (userInput) {
            case 1:
                searchCategory();
            case 2:
                start();
            default:
                System.out.println("잘못 입력하셨습니다.");
        }
    }


    static void p(String x) {
        Printer.println(x);
    }


}
