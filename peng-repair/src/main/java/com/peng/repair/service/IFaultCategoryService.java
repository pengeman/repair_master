package com.peng.repair.service;

import java.util.List;
import com.peng.repair.domain.FaultCategory;

/**
 * 故障分类Service接口
 * 
 * @author pengweitao
 * @date 2026-08-09
 */
public interface IFaultCategoryService
{
    /**
     * 查询故障分类列表
     * 
     * @return 故障分类集合
     */
    public List<FaultCategory> selectFaultCategoryList();
}
