package com.peng.repair.mapper;

import java.util.List;
import com.peng.repair.domain.RepairProcess;

/**
 * 维修过程Mapper接口
 * 
 * @author pengweitao
 * @date 2026-08-06
 */
public interface RepairProcessMapper 
{
    /**
     * 查询维修过程
     * 
     * @param id 维修过程主键
     * @return 维修过程
     */
    public RepairProcess selectRepairProcessById(Long id);

    /**
     * 查询维修过程列表
     * 
     * @param repairProcess 维修过程
     * @return 维修过程集合
     */
    public List<RepairProcess> selectRepairProcessList(RepairProcess repairProcess);

    /**
     * 按工单id查询维修记录列表
     * 
     * @param mainId 工单主键
     * @return 维修记录集合
     */
    public List<RepairProcess> selectRepairProcessListByMainId(Long mainId);

    /**
     * 新增维修过程
     * 
     * @param repairProcess 维修过程
     * @return 结果
     */
    public int insertRepairProcess(RepairProcess repairProcess);

    /**
     * 修改维修过程
     * 
     * @param repairProcess 维修过程
     * @return 结果
     */
    public int updateRepairProcess(RepairProcess repairProcess);

    /**
     * 删除维修过程
     * 
     * @param id 维修过程主键
     * @return 结果
     */
    public int deleteRepairProcessById(Long id);

    /**
     * 批量删除维修过程
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRepairProcessByIds(String[] ids);
}
