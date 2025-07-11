package com.gadgetstore.model;

public class Gadget {
    private String name;
    private double price;

    public Gadget(String name, double price) {
        this.name = name;
        this.price = price;
    }

    public String getName() { return name; }
    public double getPrice() { return price; }
}
