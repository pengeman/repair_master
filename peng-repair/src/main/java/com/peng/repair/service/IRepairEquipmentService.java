package com.peng.repair.service;

import java.util.List;
import com.peng.repair.domain.RepairEquipment;

/**
 * 工单维护Service接口
 * 
 * @author pengweitao
 * @date 2026-06-26
 */
public interface IRepairEquipmentService 
{
    /**
     * 查询工单维护
     * 
     * @param id 工单维护主键
     * @return 工单维护
     */
    public RepairEquipment selectRepairEquipmentById(Long id);

    /**
     * 查询工单维护列表
     * 
     * @param repairEquipment 工单维护
     * @return 工单维护集合
     */
    public List<RepairEquipment> selectRepairEquipmentList(RepairEquipment repairEquipment);

    /**
     * 新增工单维护
     * 
     * @param repairEquipment 工单维护
     * @return 结果
     */
    public int insertRepairEquipment(RepairEquipment repairEquipment);

    /**
     * 修改工单维护
     * 
     * @param repairEquipment 工单维护
     * @return 结果
     */
    public int updateRepairEquipment(RepairEquipment repairEquipment);

    /**
     * 批量删除工单维护
     * 
     * @param ids 需要删除的工单维护主键集合
     * @return 结果
     */
    public int deleteRepairEquipmentByIds(String ids);

    /**
     * 删除工单维护信息
     * 
     * @param id 工单维护主键
     * @return 结果
     */
    public int deleteRepairEquipmentById(Long id);
}
