package com.soft.Domain;

import java.util.UUID;

public class LargeCategory {
    private String ID;
    private String Name;
    public LargeCategory(String Name){
        this.ID = UUID.randomUUID().toString();
        this.Name = Name;
    }
}
