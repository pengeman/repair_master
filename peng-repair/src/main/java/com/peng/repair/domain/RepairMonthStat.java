package com.peng.repair.domain;

/**
 * 维修月度统计VO（按工单时间月份、质保期分组）
 * 
 * @author pengweitao
 * @date 2026-09-20
 */
public class RepairMonthStat
{
    /** 工单月份 yyyy-MM */
    private String orderTime;

    /** 保内维修量 */
    private Long withinWarranty;

    /** 保外维修量 */
    private Long outsideWarranty;

    public String getOrderTime()
    {
        return orderTime;
    }

    public void setOrderTime(String orderTime)
    {
        this.orderTime = orderTime;
    }

    public Long getWithinWarranty()
    {
        return withinWarranty;
    }

    public void setWithinWarranty(Long withinWarranty)
    {
        this.withinWarranty = withinWarranty;
    }

    public Long getOutsideWarranty()
    {
        return outsideWarranty;
    }

    public void setOutsideWarranty(Long outsideWarranty)
    {
        this.outsideWarranty = outsideWarranty;
    }
}
