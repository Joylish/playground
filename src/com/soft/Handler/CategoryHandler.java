package com.soft.Handler;

import com.soft.Domain.CategorySet;
import com.soft.Printer;
import com.soft.Service.ManageCategory;

import java.io.IOException;
import java.util.*;

public class CategoryHandler {

    private ManageCategory manageCategory = null;

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
                        requestSearchCategory();
                        break;
                    case 2:
                        requestCreateCategory();
                        break;
                    case 3:
                        requestDeleteCategory();
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

    private void requestDeleteCategory() {
        manageCategory = new ManageCategory();
        Printer.printDivider();
        Printer.println("카테고리 삭제를 진행합니다.");
        Printer.printDivider();
        ArrayList <String>smallCategoryList = manageCategory.getSmallCategoryList();
        for(String smallCategory: smallCategoryList){
            p(smallCategory);
        }
        String smallCategory = Printer.stringQuestion("삭제할 소분류 입력");
        int result = 1111;
        try {
            result = manageCategory.deleteCategory(smallCategory);

        } catch (IOException e) {
            e.printStackTrace();
        }
        if(result == 0){
            p("카테고리 삭제가 완료되었습니다.");
        }
        else if(result == -1){
            p("삭제 불가능한 카테고리입니다.");
            requestDeleteCategory();
        }
        else{
            p("없는 카테고리입니다.");
            requestDeleteCategory();
        }
    }

    private void requestCreateCategory(){
        manageCategory = new ManageCategory();
        Printer.printDivider();
        Printer.println("카테고리(소분류) 등록을 진행합니다.");
        CategorySet userCategorySet = requestSearchCategorySet();
        String smallCategory = Printer.stringQuestion("추가할 소분류 입력");
        boolean result = false;
        try {
            result = manageCategory.createCategory(userCategorySet.large, userCategorySet.medium, smallCategory);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(result){
            p("카테고리 등록이 완료되었습니다.");
        }
        else{
            p("이미 등록된 카테고리입니다.");
            requestCreateCategory();
        }
    }

    private void requestSearchCategory() {
        int userInput = -1;
        Printer.printDivider();
        Printer.println("카테고리 조회를 진행합니다.");
        CategorySet userCategorySet = requestSearchCategorySet();
        Printer.printDivider();
        System.out.printf("다른 카테고리 목록을 보시겠습니까?");
        Printer.printReturn();
        p("1. 다른 카테고리 보기");
        p("2. 카테고리 홈화면으로 가기");
        userInput = Printer.intQuestion("입력");
        switch (userInput) {
            case 1:
                requestSearchCategory();
            case 2:
                start();
            default:
                System.out.println("잘못 입력하셨습니다.");
        }
    }

    private CategorySet requestSearchCategorySet() {
        CategorySet userCategorySet = new CategorySet();
        Printer.printDivider();
        int userInput = -1;

        Printer.println("대분류를 골라 주세요.");
        manageCategory = new ManageCategory();
        ArrayList<String> largeCategory = manageCategory.getLargeCategoryList();
        int index = 0;
        for (String data : largeCategory) {
            if(index == 0){
                index++;
                continue;
            }
            data = ". " + data;
            p(index++ + data);
        }
        userInput = Printer.intQuestion("입력");
        userCategorySet.large = largeCategory.get(userInput);


        Printer.printDivider();
        Printer.println("중분류를 골라 주세요.");
        ArrayList<String> mediumCategory = manageCategory.getMediumCategoryList( userCategorySet.large);
        index = 0;
        for (String data : mediumCategory) {
            data = ". " + data;
            p(++index + data);
        }

        userInput = Printer.intQuestion("입력");
        userCategorySet.medium = mediumCategory.get(userInput - 1);

        Printer.printDivider();
        Printer.println("소분류 현황입니다.");
        Printer.printDivider();
        ArrayList<String> smallCategory = manageCategory.getSmallCategoryList(userCategorySet.large, userCategorySet.medium);
        for (String data : smallCategory) {
            p(data);
        }
        return userCategorySet;
    }

    static void p(String x) {
        Printer.println(x);
    }


}
