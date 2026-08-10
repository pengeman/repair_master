package com.peng.repair.mapper;

import java.util.List;
import com.peng.repair.domain.FaultCause;

/**
 * 故障原因Mapper接口
 * 
 * @author pengweitao
 * @date 2026-08-09
 */
public interface FaultCauseMapper
{
    /**
     * 查询故障原因列表
     * 
     * @return 故障原因集合
     */
    public List<FaultCause> selectFaultCauseList();
}
