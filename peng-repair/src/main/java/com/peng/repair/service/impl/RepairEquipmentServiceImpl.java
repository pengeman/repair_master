package com.peng.repair.service.impl;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.peng.repair.mapper.RepairEquipmentMapper;
import com.peng.repair.domain.RepairEquipment;
import com.peng.repair.service.IRepairEquipmentService;
import com.ruoyi.common.core.text.Convert;

/**
 * 工单维护Service业务层处理
 * 
 * @author pengweitao
 * @date 2026-08-04
 */
@Service
public class RepairEquipmentServiceImpl implements IRepairEquipmentService 
{
    private static final Logger log = LoggerFactory.getLogger(RepairEquipmentServiceImpl.class);

    @Autowired
    private RepairEquipmentMapper repairEquipmentMapper;

    /**
     * 查询工单维护
     * 
     * @param id 工单维护主键
     * @return 工单维护
     */
    @Override
    public RepairEquipment selectRepairEquipmentById(Long id)
    {
        return repairEquipmentMapper.selectRepairEquipmentById(id);
    }

    /**
     * 查询工单维护列表
     * 
     * @param repairEquipment 工单维护
     * @return 工单维护
     */
    @Override
    public List<RepairEquipment> selectRepairEquipmentList(RepairEquipment repairEquipment)
    {
        return repairEquipmentMapper.selectRepairEquipmentList(repairEquipment);
    }

    /**
     * 新增工单维护
     * 
     * @param repairEquipment 工单维护
     * @return 结果
     */
    @Override
    public int insertRepairEquipment(RepairEquipment repairEquipment)
    {
        return repairEquipmentMapper.insertRepairEquipment(repairEquipment);
    }

    /**
     * 修改工单维护
     * 
     * @param repairEquipment 工单维护
     * @return 结果
     */
    @Override
    public int updateRepairEquipment(RepairEquipment repairEquipment)
    {
        log.info("维修完结/修改工单 id={} 参数={}", repairEquipment.getId(), repairEquipment);
        return repairEquipmentMapper.updateRepairEquipment(repairEquipment);
    }

    /**
     * 批量删除工单维护
     * 
     * @param ids 需要删除的工单维护主键
     * @return 结果
     */
    @Override
    public int deleteRepairEquipmentByIds(String ids)
    {
        return repairEquipmentMapper.deleteRepairEquipmentByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除工单维护信息
     * 
     * @param id 工单维护主键
     * @return 结果
     */
    @Override
    public int deleteRepairEquipmentById(Long id)
    {
        return repairEquipmentMapper.deleteRepairEquipmentById(id);
    }
}
