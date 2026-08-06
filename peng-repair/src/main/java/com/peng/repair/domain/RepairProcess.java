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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("mainId", getMainId())
            .append("mediaFile", getMediaFile())
            .append("mediaDesc", getMediaDesc())
            .append("recordTime", getRecordTime())
            .append("fileType", getFileType())
            .toString();
    }
}
