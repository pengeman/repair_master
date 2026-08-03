package org.peng.track.model;

public class RepairEquipment     extends Object
{
    private int id;
    private String model;
    private String sn;
    private String dispatchImg;
    private String faultDesc;
    private String repairDesc;
    private String faultReason;
    private String summary;
    private String orderTime;
    private String startTime;
    private String endTime;
    private String salename;
    private String status;
    private String faultType;

    public RepairEquipment() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public String getSn() { return sn; }
    public void setSn(String sn) { this.sn = sn; }

    public String getDispatchImg() { return dispatchImg; }
    public void setDispatchImg(String dispatchImg) { this.dispatchImg = dispatchImg; }

    public String getFaultDesc() { return faultDesc; }
    public void setFaultDesc(String faultDesc) { this.faultDesc = faultDesc; }

    public String getRepairDesc() { return repairDesc; }
    public void setRepairDesc(String repairDesc) { this.repairDesc = repairDesc; }

    public String getFaultReason() { return faultReason; }
    public void setFaultReason(String faultReason) { this.faultReason = faultReason; }

    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }

    public String getOrderTime() { return orderTime; }
    public void setOrderTime(String orderTime) { this.orderTime = orderTime; }

    public String getStartTime() { return startTime; }
    public void setStartTime(String startTime) { this.startTime = startTime; }

    public String getSalename() { return salename; }
    public void setSalename(String salename) { this.salename = salename; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getEndTime() { return endTime; }
    public void setEndTime(String endTime) { this.endTime = endTime; }

    public String getFaultType() { return faultType; }
    public void setFaultType(String faultType) { this.faultType = faultType; }
    
    @Override
    public String         toString(){
        StringBuffer toString = new StringBuffer();
        toString.append("id = " + this.getId());
        toString.append("Model = " + this.getModel());
        toString.append("Salename = " + this.getSalename());
        toString.append("FaultDesc = " + this.faultDesc);
        toString.append("OrderTime = " + this.getOrderTime());
        toString.append("StartTime = " + this.getStartTime());
        toString.append("Status = " + this.getStatus());
        return toString.toString();
        
    }
}
