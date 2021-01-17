package com.soft.Domain;

import java.util.UUID;

public class MediumCategory {
    private String ID;
    private String Name;

    public MediumCategory(String Name){
        this.ID = UUID.randomUUID().toString();
        this.Name = Name;
    }

}
