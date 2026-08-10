package com.peng.repair.mapper;

import java.util.List;
import com.peng.repair.domain.FaultCategory;

/**
 * 故障分类Mapper接口
 * 
 * @author pengweitao
 * @date 2026-08-09
 */
public interface FaultCategoryMapper
{
    /**
     * 查询故障分类列表
     * 
     * @return 故障分类集合
     */
    public List<FaultCategory> selectFaultCategoryList();
}
