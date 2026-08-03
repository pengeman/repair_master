package com.peng.repair.mapper;

import java.util.List;
import com.peng.repair.domain.RepairEquipment;
import org.apache.ibatis.annotations.Mapper;

/**
 * 工单维护Mapper接口
 *
 * @author pengweitao
 * @date 2026-06-26
 */
@Mapper
public interface RepairEquipmentMapper
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
     * 删除工单维护
     * 
     * @param id 工单维护主键
     * @return 结果
     */
    public int deleteRepairEquipmentById(Long id);

    /**
     * 批量删除工单维护
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRepairEquipmentByIds(String[] ids);
}
