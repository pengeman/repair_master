package com.peng.repair.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 工单维护对象 repair_equipment
 * 
 * @author pengweitao
 * @date 2026-08-04
 */
public class RepairEquipment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 板型 */
    @Excel(name = "板型")
    private String model;

    /** 编号 */
    @Excel(name = "编号")
    private String sn;

    /** 工单 */
    private String dispatchImg;

    /** 问题描述 */
    @Excel(name = "问题描述")
    private String faultDesc;

    /** 维修描述 */
    @Excel(name = "维修描述")
    private String repairDesc;

    /** 问题原因 */
    private String faultReason;

    /** 总结 */
    private String summary;

    /** 工单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "工单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderTime;

    /** 开工时间 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "开工时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 业务员 */
    @Excel(name = "业务员")
    private String salename;

    /** 1待开始，2维修中，3已完工 */
    private Long status;

    /** 结束时间 */
    private Date endTime;

    /** 外键 fault_categories.id */
    private Long faultType;

    /** 质保期 */
    @Excel(name = "质保期")
    private Long quality;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setModel(String model) 
    {
        this.model = model;
    }

    public String getModel() 
    {
        return model;
    }

    public void setSn(String sn) 
    {
        this.sn = sn;
    }

    public String getSn() 
    {
        return sn;
    }

    public void setDispatchImg(String dispatchImg) 
    {
        this.dispatchImg = dispatchImg;
    }

    public String getDispatchImg() 
    {
        return dispatchImg;
    }

    public void setFaultDesc(String faultDesc) 
    {
        this.faultDesc = faultDesc;
    }

    public String getFaultDesc() 
    {
        return faultDesc;
    }

    public void setRepairDesc(String repairDesc) 
    {
        this.repairDesc = repairDesc;
    }

    public String getRepairDesc() 
    {
        return repairDesc;
    }

    public void setFaultReason(String faultReason) 
    {
        this.faultReason = faultReason;
    }

    public String getFaultReason() 
    {
        return faultReason;
    }

    public void setSummary(String summary) 
    {
        this.summary = summary;
    }

    public String getSummary() 
    {
        return summary;
    }

    public void setOrderTime(Date orderTime) 
    {
        this.orderTime = orderTime;
    }

    public Date getOrderTime() 
    {
        return orderTime;
    }

    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }

    public void setSalename(String salename) 
    {
        this.salename = salename;
    }

    public String getSalename() 
    {
        return salename;
    }

    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }

    public void setFaultType(Long faultType) 
    {
        this.faultType = faultType;
    }

    public Long getFaultType() 
    {
        return faultType;
    }

    public void setQuality(Long quality) 
    {
        this.quality = quality;
    }

    public Long getQuality() 
    {
        return quality;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("model", getModel())
            .append("sn", getSn())
            .append("dispatchImg", getDispatchImg())
            .append("faultDesc", getFaultDesc())
            .append("repairDesc", getRepairDesc())
            .append("faultReason", getFaultReason())
            .append("summary", getSummary())
            .append("orderTime", getOrderTime())
            .append("startTime", getStartTime())
            .append("salename", getSalename())
            .append("status", getStatus())
            .append("endTime", getEndTime())
            .append("faultType", getFaultType())
            .append("quality", getQuality())
            .toString();
    }
}
