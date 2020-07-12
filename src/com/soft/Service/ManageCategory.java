package com.soft.Service;
import com.soft.Domain.CategorySet;
import com.soft.Printer;
import com.sun.deploy.util.StringUtils;
import sun.dc.pr.PRError;

import java.io.*;
import java.nio.charset.Charset;
import java.util.*;

public class ManageCategory {
    private int userID = 1;

    private String path = "productManagement-master/data/CategoryList.csv";
    private FileWriter fw = null;
    private static BufferedReader br = null;

    private ArrayList<CategorySet> categoryList = new ArrayList<>(999);
    private int defaultSize = 34;

    public ManageCategory(){
        saveCategoryList();
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

        try {
            File csv = new File(path);
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
            String[] token = line.split("\\s|,|\t", -1);
            List <String> lineList= new ArrayList<>(Arrays.asList(token));
            list.add(lineList);
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

    public ArrayList<String> getSmallCategoryList() {
        ArrayList <String> smallCategoryList = new ArrayList<>();
        for(CategorySet categorySet: categoryList){
            if (smallCategoryList.contains(categorySet.small)||categoryList.indexOf(categorySet) == 0){
                continue;
            }
            smallCategoryList.add(categorySet.small);
        }
        return smallCategoryList;
    }

    public ArrayList<String> getDefaultCategoryList() {
        ArrayList <String> smallCategoryList = new ArrayList<>();
        ArrayList <String> defaultSmallCategoryList = new ArrayList<>();

        for(int i = 1; i<defaultSize-1; i++){
            smallCategoryList.add(categoryList.get(i).small);
        }

        for(String small: smallCategoryList){
            if (defaultSmallCategoryList.contains(small)){
                continue;
            }
            defaultSmallCategoryList.add(small);
        }

        return defaultSmallCategoryList;
    }

    private boolean checkDelete(String targetSmallCategory) {
        ArrayList<String> smallCategoryList = getDefaultCategoryList();

        for(String smallCategory: smallCategoryList){
            if(smallCategory.equals(targetSmallCategory)){
                return false;
            }
        }
        return true;
    }

    public boolean createCategory(String large, String medium, String small) throws IOException {
        try {
            fw = new FileWriter(path, true);
        } catch (IOException e) {
            e.printStackTrace();
        }
        CategorySet categorySet = new CategorySet(large, medium, small);
        if ((categoryList.contains(categorySet))) {
            return false;
        }
        fw.append(String.valueOf(categoryList.size()+1));
        fw.append(',');
        fw.append(String.valueOf(userID));
        fw.append(',');
        fw.append(large);
        fw.append(',');
        fw.append(medium);
        fw.append(',');
        fw.append(small);
        fw.append('\n');
        fw.flush();
        fw.close();
        saveCategoryList();
        return true;
    }

    public int deleteCategory(String small) throws IOException {
        PrintWriter pw = null;
        File csv = new File(path);
        try {
            br = new BufferedReader(new FileReader(csv));
        } catch (IOException e) {
            e.printStackTrace();
        }

        ArrayList <String> savedSmallCategoryList = getSmallCategoryList();

        if(!checkDelete(small)){
            return -1;
        }
        if(!savedSmallCategoryList.contains(small)){
            return -2;
        }
        String line = "";
        ArrayList <String> smallCategoryList = new ArrayList<>();
        while (true) {
            try {
                if (!((line = br.readLine()) != null)) break;
            } catch (IOException e) {
                e.printStackTrace();
            }
            if(line.contains(small)) {
                continue;
            }
           smallCategoryList.add(line);
        }
        br.close();
        pw = new PrintWriter(new BufferedWriter(new FileWriter(csv)));
        for (String smallCategory : smallCategoryList){
            pw.println(smallCategory);
        }
        Objects.requireNonNull(pw).close();
        return 0;
    }
}
