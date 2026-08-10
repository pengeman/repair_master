package com.peng.repair.service;

import java.util.List;
import com.peng.repair.domain.FaultCause;

/**
 * 故障原因Service接口
 * 
 * @author pengweitao
 * @date 2026-08-09
 */
public interface IFaultCauseService
{
    /**
     * 查询故障原因列表
     * 
     * @return 故障原因集合
     */
    public List<FaultCause> selectFaultCauseList();
}
