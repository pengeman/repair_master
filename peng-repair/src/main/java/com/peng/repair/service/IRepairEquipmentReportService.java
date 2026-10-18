package com.peng.repair.service;

import java.util.List;
import com.peng.repair.domain.RepairEquipmentReport;

/**
 * 维护统计Service接口
 * 
 * @author pengweitao
 * @date 2026-09-20
 */
public interface IRepairEquipmentReportService 
{
    /**
     * 查询维护统计
     * 
     * @param id 维护统计主键
     * @return 维护统计
     */
    public RepairEquipmentReport selectRepairEquipmentReportById(Long id);

    /**
     * 查询维护统计列表
     * 
     * @param repairEquipmentReport 维护统计
     * @return 维护统计集合
     */
    public List<RepairEquipmentReport> selectRepairEquipmentReportList(RepairEquipmentReport repairEquipmentReport);

    /**
     * 新增维护统计
     * 
     * @param repairEquipmentReport 维护统计
     * @return 结果
     */
    public int insertRepairEquipmentReport(RepairEquipmentReport repairEquipmentReport);

    /**
     * 修改维护统计
     * 
     * @param repairEquipmentReport 维护统计
     * @return 结果
     */
    public int updateRepairEquipmentReport(RepairEquipmentReport repairEquipmentReport);

    /**
     * 批量删除维护统计
     * 
     * @param ids 需要删除的维护统计主键集合
     * @return 结果
     */
    public int deleteRepairEquipmentReportByIds(String ids);

    /**
     * 删除维护统计信息
     * 
     * @param id 维护统计主键
     * @return 结果
     */
    public int deleteRepairEquipmentReportById(Long id);
}
