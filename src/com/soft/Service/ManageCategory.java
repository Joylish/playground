package com.soft.Service;

import com.soft.Domain.CategorySet;
import com.soft.Printer;

import java.util.ArrayList;

public class ManageCategory {
    private CategorySet[] categoryList = new CategorySet[999];
    int listSize = 35;

    public ManageCategory() {
        this.categoryList[0] = new CategorySet("남자", "운동화", "캔버스화");
        this.categoryList[1] = new CategorySet("남자", "운동화", "뮬");
        this.categoryList[2] = new CategorySet("남자", "운동화", "슬립온");
        this.categoryList[3] = new CategorySet("남자", "운동화", "어글리슈즈");
        this.categoryList[4] = new CategorySet("남자", "운동화", "스니커즈");
        this.categoryList[5] = new CategorySet("남자", "운동화", "러닝화");
        this.categoryList[6] = new CategorySet("남자", "운동화", "우븐슈즈");

        this.categoryList[7] = new CategorySet("남자", "구두", "더비");
        this.categoryList[8] = new CategorySet("남자", "구두", "로퍼");
        this.categoryList[9] = new CategorySet("남자", "구두", "몽크스트랩");
        this.categoryList[10] = new CategorySet("남자", "구두", "워커/첼시");
        this.categoryList[11] = new CategorySet("남자", "구두", "블로퍼");

        this.categoryList[12] = new CategorySet("남자", "샌들/슬리퍼", "가죽샌들");
        this.categoryList[13] = new CategorySet("남자", "샌들/슬리퍼", "실내화");
        this.categoryList[14] = new CategorySet("남자", "샌들/슬리퍼", "스포츠샌들");
        this.categoryList[15] = new CategorySet("남자", "샌들/슬리퍼", "슬라이드");

        this.categoryList[16] = new CategorySet("여자", "운동화", "캔버스화");
        this.categoryList[17] = new CategorySet("여자", "운동화", "뮬");
        this.categoryList[18] = new CategorySet("여자", "운동화", "슬립온");
        this.categoryList[19] = new CategorySet("여자", "운동화", "어글리슈즈");
        this.categoryList[20] = new CategorySet("여자", "운동화", "스니커즈");
        this.categoryList[21] = new CategorySet("여자", "운동화", "러닝화");
        this.categoryList[22] = new CategorySet("여자", "운동화", "우븐슈즈");

        this.categoryList[23] = new CategorySet("여자", "구두", "플랫");
        this.categoryList[24] = new CategorySet("여자", "구두", "로퍼");
        this.categoryList[25] = new CategorySet("여자", "구두", "펌프스");
        this.categoryList[26] = new CategorySet("여자", "구두", "워커");
        this.categoryList[27] = new CategorySet("여자", "구두", "블로퍼");
        this.categoryList[28] = new CategorySet("여자", "구두", "블링백");
        this.categoryList[29] = new CategorySet("여자", "구두", "부츠");
        this.categoryList[30] = new CategorySet("여자", "구두", "메리제인");

        this.categoryList[31] = new CategorySet("여자", "샌들/슬리퍼", "가죽샌들");
        this.categoryList[32] = new CategorySet("여자", "샌들/슬리퍼", "실내화");
        this.categoryList[33] = new CategorySet("여자", "샌들/슬리퍼", "스포츠샌들");
        this.categoryList[34] = new CategorySet("여자", "샌들/슬리퍼", "슬라이드");
    }

    // 전체 대분류 목록을 리턴하는 함수
    public ArrayList<String> show() {

        String[] result = new String[999];
        int resultSize = 0;

        for (int i = 0; i < listSize; i++) {
            result[resultSize] = categoryList[i].large;
            resultSize++;
        }

        // 중복되는값을 제거하고 ArrayList로 리턴한다!
        ArrayList<String> arrayList = new ArrayList<>();
        for (String data : result) {
            if ((!arrayList.contains(data)) && (data != null))
               arrayList.add(data);
        }
        return arrayList;
    }

    // 인자로 들어온 대분류 대해서 하위 중분류 목록을 리턴하는 함수
    public ArrayList<String> show(String category1) {

        String[] result = new String[999];
        int resultSize = 0;

        for (int i = 0; i < listSize; i++) {
            if (category1 == categoryList[i].large)
                result[resultSize] = categoryList[i].medium;
            resultSize++;
        }

        // 중복되는값을 제거하고 ArrayList로 리턴한다!
        ArrayList<String> arrayList = new ArrayList<>();
        for (String data : result) {
            if ((!arrayList.contains(data)) && (data != null))
                arrayList.add(data);
        }

        return arrayList;
    }

    // 인자로 들어온 대분류, 중분류에 대해서 하위 소분류 목록을 리턴하는 함수
    public ArrayList<String> show(String category1, String category2) {

        String[] result = new String[999];
        int resultSize = 0;

        for (int i = 0; i < listSize; i++) {
            if ((category1 == categoryList[i].large && category2 == categoryList[i].medium))
                result[++resultSize] = categoryList[i].small;
        }

        // 중복되는값을 제거하고 ArrayList로 리턴한다!
        ArrayList<String> arrayList = new ArrayList<>();
        for (String data : result) {
            if ((!arrayList.contains(data))&& (data != null))
                arrayList.add(data);
        }

        return arrayList;
    }

    public int create(String l, String m, String s) {

        CategorySet cs = new CategorySet(l,m,s);
        this.categoryList[this.listSize] = cs;
        this.listSize++;

        return 0;
    }
}
