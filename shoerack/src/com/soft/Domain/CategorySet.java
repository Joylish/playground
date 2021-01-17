package com.soft.Domain;

public class CategorySet {
    public String small;
    public String medium;
    public String large;

    public CategorySet(){
        this.large = "";
        this.medium = "";
        this.small = "";
    }

    public CategorySet(String large, String medium, String small){
        this.large = large;
        this.medium = medium;
        this.small = small;
    }

    public CategorySet(String large, String medium){
        this.large = large;
        this.medium = medium;
    }
}
