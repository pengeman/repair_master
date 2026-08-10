package com.peng.repair.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 故障分类对象 fault_categories
 * 
 * @author pengweitao
 * @date 2026-08-09
 */
public class FaultCategory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 分类id */
    private Long id;

    /** 分类名称 */
    private String name;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .toString();
    }
}
