package com.soft.Domain;

import java.util.UUID;

public class SmallCategory {
    private String ID;
    private String Name;
    private Boolean isChangeable;

    public SmallCategory(String Name){
        this.ID = UUID.randomUUID().toString();
        this.Name = Name;
        this.isChangeable = true;
    }
}
