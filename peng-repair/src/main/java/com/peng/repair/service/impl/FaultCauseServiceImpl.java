package com.peng.repair.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.peng.repair.mapper.FaultCauseMapper;
import com.peng.repair.domain.FaultCause;
import com.peng.repair.service.IFaultCauseService;

/**
 * 故障原因Service业务层处理
 * 
 * @author pengweitao
 * @date 2026-08-09
 */
@Service
public class FaultCauseServiceImpl implements IFaultCauseService
{
    @Autowired
    private FaultCauseMapper faultCauseMapper;

    /**
     * 查询故障原因列表
     * 
     * @return 故障原因集合
     */
    @Override
    public List<FaultCause> selectFaultCauseList()
    {
        return faultCauseMapper.selectFaultCauseList();
    }
}
