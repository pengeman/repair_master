package com.peng.repair.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.peng.repair.mapper.RepairEquipmentReportMapper;
import com.peng.repair.domain.RepairEquipmentReport;
import com.peng.repair.service.IRepairEquipmentReportService;
import com.ruoyi.common.core.text.Convert;

/**
 * 维护统计Service业务层处理
 * 
 * @author pengweitao
 * @date 2026-09-20
 */
@Service
public class RepairEquipmentReportServiceImpl implements IRepairEquipmentReportService 
{
    @Autowired
    private RepairEquipmentReportMapper repairEquipmentReportMapper;

    /**
     * 查询维护统计
     * 
     * @param id 维护统计主键
     * @return 维护统计
     */
    @Override
    public RepairEquipmentReport selectRepairEquipmentReportById(Long id)
    {
        return repairEquipmentReportMapper.selectRepairEquipmentReportById(id);
    }

    /**
     * 查询维护统计列表
     * 
     * @param repairEquipmentReport 维护统计
     * @return 维护统计
     */
    @Override
    public List<RepairEquipmentReport> selectRepairEquipmentReportList(RepairEquipmentReport repairEquipmentReport)
    {
        return repairEquipmentReportMapper.selectRepairEquipmentReportList(repairEquipmentReport);
    }

    /**
     * 新增维护统计
     * 
     * @param repairEquipmentReport 维护统计
     * @return 结果
     */
    @Override
    public int insertRepairEquipmentReport(RepairEquipmentReport repairEquipmentReport)
    {
        return repairEquipmentReportMapper.insertRepairEquipmentReport(repairEquipmentReport);
    }

    /**
     * 修改维护统计
     * 
     * @param repairEquipmentReport 维护统计
     * @return 结果
     */
    @Override
    public int updateRepairEquipmentReport(RepairEquipmentReport repairEquipmentReport)
    {
        return repairEquipmentReportMapper.updateRepairEquipmentReport(repairEquipmentReport);
    }

    /**
     * 批量删除维护统计
     * 
     * @param ids 需要删除的维护统计主键
     * @return 结果
     */
    @Override
    public int deleteRepairEquipmentReportByIds(String ids)
    {
        return repairEquipmentReportMapper.deleteRepairEquipmentReportByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除维护统计信息
     * 
     * @param id 维护统计主键
     * @return 结果
     */
    @Override
    public int deleteRepairEquipmentReportById(Long id)
    {
        return repairEquipmentReportMapper.deleteRepairEquipmentReportById(id);
    }
}
