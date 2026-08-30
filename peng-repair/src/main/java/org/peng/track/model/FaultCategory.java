package org.peng.track.model;

public class FaultCategory {
    private int id;
    private String name;

    public FaultCategory() {}

    public FaultCategory(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
