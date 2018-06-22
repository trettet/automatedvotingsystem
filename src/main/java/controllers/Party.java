package controllers;

import java.awt.*;

public class Party {
    private final String name;
    private final String color;

    public Party(String name, String color)
    {
        this.name = name;
        this.color = color.toLowerCase();
    }

    public String getName()
    {
        return this.name;
    }

    public String getColor()
    {
        return this.color;
    }
}
