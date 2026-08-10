package com.peng.repair.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.peng.repair.mapper.FaultCategoryMapper;
import com.peng.repair.domain.FaultCategory;
import com.peng.repair.service.IFaultCategoryService;

/**
 * 故障分类Service业务层处理
 * 
 * @author pengweitao
 * @date 2026-08-09
 */
@Service
public class FaultCategoryServiceImpl implements IFaultCategoryService
{
    @Autowired
    private FaultCategoryMapper faultCategoryMapper;

    /**
     * 查询故障分类列表
     * 
     * @return 故障分类集合
     */
    @Override
    public List<FaultCategory> selectFaultCategoryList()
    {
        return faultCategoryMapper.selectFaultCategoryList();
    }
}
