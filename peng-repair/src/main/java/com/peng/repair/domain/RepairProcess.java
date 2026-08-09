package com.peng.repair.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 维修过程对象 repair_process
 * 
 * @author pengweitao
 * @date 2026-08-06
 */
public class RepairProcess extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /**  */
    private Long mainId;

    /** 过程图片 */
    @Excel(name = "过程图片")
    private String mediaFile;

    /** 过程描述 */
    @Excel(name = "过程描述")
    private String mediaDesc;

    /** 记录时间 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "记录时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date recordTime;

    /**  */
    private String fileType;

    /** 板型 */
    @Excel(name = "板型")
    private String model;

    /** 编号 */
    @Excel(name = "编号")
    private String sn;

    /** 问题描述 */
    @Excel(name = "问题描述")
    private String faultDesc;

    /** 维修描述 */
    @Excel(name = "维修描述")
    private String repairDesc;

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

    public void setMainId(Long mainId) 
    {
        this.mainId = mainId;
    }

    public Long getMainId() 
    {
        return mainId;
    }

    public void setMediaFile(String mediaFile) 
    {
        this.mediaFile = mediaFile;
    }

    public String getMediaFile() 
    {
        return mediaFile;
    }

    public void setMediaDesc(String mediaDesc) 
    {
        this.mediaDesc = mediaDesc;
    }

    public String getMediaDesc() 
    {
        return mediaDesc;
    }

    public void setRecordTime(Date recordTime) 
    {
        this.recordTime = recordTime;
    }

    public Date getRecordTime() 
    {
        return recordTime;
    }

    public void setFileType(String fileType) 
    {
        this.fileType = fileType;
    }

    public String getFileType() 
    {
        return fileType;
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
            .append("mainId", getMainId())
            .append("mediaFile", getMediaFile())
            .append("mediaDesc", getMediaDesc())
            .append("recordTime", getRecordTime())
            .append("fileType", getFileType())
            .append("model", getModel())
            .append("sn", getSn())
            .append("faultDesc", getFaultDesc())
            .append("repairDesc", getRepairDesc())
            .append("orderTime", getOrderTime())
            .append("startTime", getStartTime())
            .append("salename", getSalename())
            .append("status", getStatus())
            .append("quality", getQuality())
            .toString();
    }
}
