package com.peng.repair.service;

import java.util.List;
import com.peng.repair.domain.RepairProcess;

/**
 * 维修过程Service接口
 * 
 * @author pengweitao
 * @date 2026-08-06
 */
public interface IRepairProcessService 
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
     * 批量删除维修过程
     * 
     * @param ids 需要删除的维修过程主键集合
     * @return 结果
     */
    public int deleteRepairProcessByIds(String ids);

    /**
     * 删除维修过程信息
     * 
     * @param id 维修过程主键
     * @return 结果
     */
    public int deleteRepairProcessById(Long id);
}
