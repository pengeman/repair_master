package com.peng.repair.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.peng.repair.mapper.RepairProcessMapper;
import com.peng.repair.domain.RepairProcess;
import com.peng.repair.service.IRepairProcessService;
import com.ruoyi.common.core.text.Convert;

/**
 * 维修过程Service业务层处理
 * 
 * @author pengweitao
 * @date 2026-08-06
 */
@Service
public class RepairProcessServiceImpl implements IRepairProcessService 
{
    @Autowired
    private RepairProcessMapper repairProcessMapper;

    /**
     * 查询维修过程
     * 
     * @param id 维修过程主键
     * @return 维修过程
     */
    @Override
    public RepairProcess selectRepairProcessById(Long id)
    {
        return repairProcessMapper.selectRepairProcessById(id);
    }

    /**
     * 查询维修过程列表
     * 
     * @param repairProcess 维修过程
     * @return 维修过程
     */
    @Override
    public List<RepairProcess> selectRepairProcessList(RepairProcess repairProcess)
    {
        return repairProcessMapper.selectRepairProcessList(repairProcess);
    }

    /**
     * 新增维修过程
     * 
     * @param repairProcess 维修过程
     * @return 结果
     */
    @Override
    public int insertRepairProcess(RepairProcess repairProcess)
    {
        return repairProcessMapper.insertRepairProcess(repairProcess);
    }

    /**
     * 修改维修过程
     * 
     * @param repairProcess 维修过程
     * @return 结果
     */
    @Override
    public int updateRepairProcess(RepairProcess repairProcess)
    {
        return repairProcessMapper.updateRepairProcess(repairProcess);
    }

    /**
     * 批量删除维修过程
     * 
     * @param ids 需要删除的维修过程主键
     * @return 结果
     */
    @Override
    public int deleteRepairProcessByIds(String ids)
    {
        return repairProcessMapper.deleteRepairProcessByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除维修过程信息
     * 
     * @param id 维修过程主键
     * @return 结果
     */
    @Override
    public int deleteRepairProcessById(Long id)
    {
        return repairProcessMapper.deleteRepairProcessById(id);
    }
}
