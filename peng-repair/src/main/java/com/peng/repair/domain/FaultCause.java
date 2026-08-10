package com.peng.repair.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 故障原因对象 fault_cause
 * 
 * @author pengweitao
 * @date 2026-08-09
 */
public class FaultCause extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 原因id */
    private Long id;

    /** 原因名称 */
    private String cause;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setCause(String cause)
    {
        this.cause = cause;
    }

    public String getCause()
    {
        return cause;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("cause", getCause())
            .toString();
    }
}
