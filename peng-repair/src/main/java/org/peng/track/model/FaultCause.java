package org.peng.track.model;

public class FaultCause {
    private int id;
    private String cause;

    public FaultCause() {}

    public FaultCause(int id, String cause) {
        this.id = id;
        this.cause = cause;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCause() { return cause; }
    public void setCause(String cause) { this.cause = cause; }
}
