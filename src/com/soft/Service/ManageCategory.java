package com.soft.Service;

import com.soft.Domain.CategorySet;
import com.soft.Printer;

import java.io.*;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.TreeSet;

public class ManageCategory {
    private int userID = 1;

    private String path = "./data/CategoryList.csv";
    private FileWriter fw = null;
    private static BufferedReader br = null;

    private ArrayList<CategorySet> categoryList = new ArrayList<>(999);
    private int defaultSize = 35;

    public ManageCategory(){
        saveCategoryList();
        for (CategorySet categorySet: categoryList){
            Printer.println(categorySet.large+ categorySet.medium);
        }
    }

    private void saveCategoryList(){
        List<List<String>> list = readCSV(path);
        for(List<String> line : list) {
            CategorySet categorySet = new CategorySet(line.get(2), line.get(3), line.get(4));
            categoryList.add(categorySet);
        }

    }
    private static List<List<String>> readCSV(String path) {
        List<List<String>> list = new ArrayList<>();
        File csv = new File(path);

        try {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        Charset.forName("UTF-8");
        String line = "";

        while (true) {
            try {
                if (!((line = br.readLine()) != null)) break;
            } catch (IOException e) {
                e.printStackTrace();
            }
            String[] token = line.split(",");
            List<String> tempList = new ArrayList<String>(Arrays.asList(token));
            list.add(tempList);
        }
        return list;
    }

    // 전체 대분류 목록을 리턴하는 함수
    public ArrayList<String> getLargeCategoryList() {
        ArrayList <String>largeCategoryList = new ArrayList<>();
        for(CategorySet categorySet: categoryList){
            largeCategoryList.add(categorySet.large);
        }
        TreeSet <String> largeCategorySet =new TreeSet<>(largeCategoryList);
        largeCategoryList = new ArrayList<>(largeCategorySet);
        return largeCategoryList;
    }

    // 인자로 들어온 대분류 대해서 하위 중분류 목록을 리턴하는 함수
    public ArrayList<String> getMediumCategoryList(String large) {
        ArrayList <String>mediumCategoryList = new ArrayList<>();
        for(CategorySet categorySet: categoryList){
            if(categorySet.large.equals(large)) {
                Printer.println(categorySet.medium);
                mediumCategoryList.add(categorySet.medium);
            }
        }
        TreeSet <String> mediumCategorySet =new TreeSet<>(mediumCategoryList);
        mediumCategoryList = new ArrayList<>(mediumCategorySet);
        return mediumCategoryList;
    }

    // 인자로 들어온 대분류, 중분류에 대해서 하위 소분류 목록을 리턴하는 함수
    public ArrayList<String> getSmallCategoryList(String large, String medium) {

        ArrayList <String> smallCategoryList = new ArrayList<>();
        for(CategorySet categorySet: categoryList){
            if(categorySet.large.equals(large) && categorySet.medium.equals(medium)) {
                smallCategoryList.add(categorySet.small);
            }
        }
        TreeSet <String> smallCategorySet =new TreeSet<>(smallCategoryList);
        smallCategoryList = new ArrayList<>(smallCategorySet);
        return smallCategoryList;
    }

    public boolean createCategory(String large, String medium, String small) throws IOException {
        try {
            fw = new FileWriter(path);
//            StringBuilder builder =new StringBuilder();
        } catch (IOException e) {
            e.printStackTrace();
        }
        CategorySet categorySet = new CategorySet(large, medium, small);
        if ((categoryList.contains(categorySet))) {
            return false;
        }
//        System.out.println(categorySet.small);
        fw.append(String.valueOf(categoryList.size()));
        fw.append(',');
        fw.append(String.valueOf(userID));
        fw.append(',');
        fw.append(large);
        fw.append(',');
        fw.append(medium);
        fw.append(',');
        fw.append(small);
        fw.append('\n');
        saveCategoryList();
        return true;
    }

    public void deleteCategory(String small) {
        ArrayList<String> smallCategoryList = new ArrayList<>();
        for (CategorySet categorySet : categoryList) {
            if (categorySet.small.equals(small)) {
                categoryList.remove(categorySet);
            }
        }
    }
}
