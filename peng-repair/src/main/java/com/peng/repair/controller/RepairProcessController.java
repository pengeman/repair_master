package com.peng.repair.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.peng.repair.domain.RepairProcess;
import com.peng.repair.domain.RepairEquipment;
import com.peng.repair.service.IRepairProcessService;
import com.peng.repair.service.IRepairEquipmentService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.StringUtils;

/**
 * 维修过程Controller
 * 
 * @author pengweitao
 * @date 2026-08-06
 */
@Controller
@RequestMapping("/repair/process")
public class RepairProcessController extends BaseController
{
    private String prefix = "repair/process";

    @Autowired
    private IRepairProcessService repairProcessService;

    @Autowired
    private IRepairEquipmentService repairEquipmentService;

    @RequiresPermissions("repair:process:view")
    @GetMapping()
    public String process()
    {
        return prefix + "/process";
    }

    /**
     * 查询维修过程列表
     */
    @RequiresPermissions("repair:process:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(RepairProcess repairProcess)
    {
        startPage();
        List<RepairProcess> list = repairProcessService.selectRepairProcessList(repairProcess);
        return getDataTable(list);
    }

    /**
     * 导出维修过程列表
     */
    @RequiresPermissions("repair:process:export")
    @Log(title = "维修过程", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(RepairProcess repairProcess)
    {
        List<RepairProcess> list = repairProcessService.selectRepairProcessList(repairProcess);
        ExcelUtil<RepairProcess> util = new ExcelUtil<RepairProcess>(RepairProcess.class);
        return util.exportExcel(list, "维修过程数据");
    }

    /**
     * 查看维修过程详情
     */
    @RequiresPermissions("repair:process:view")
    @GetMapping("/view/{id}")
    public String view(@PathVariable("id") Long id, ModelMap mmap)
    {
        RepairProcess repairProcess = repairProcessService.selectRepairProcessById(id);
        mmap.put("repairProcess", repairProcess);
        return prefix + "/view";
    }

    /**
     * 新增维修过程
     */
    @RequiresPermissions("repair:process:add")
    @GetMapping("/add")
    public String add(@RequestParam(value = "mainId", required = false) Long mainId, ModelMap mmap)
    {
        // 主表工单数据（根据 URL 传入的 mainId 查询 repair_equipment）
        if (StringUtils.isNotNull(mainId))
        {
            RepairEquipment repairEquipment = repairEquipmentService.selectRepairEquipmentById(mainId);
            mmap.put("repairEquipment", repairEquipment);
            mmap.put("mainId", mainId);
        }
        return prefix + "/add";
    }

    /**
     * 新增保存维修过程
     */
    @RequiresPermissions("repair:process:add")
    @Log(title = "维修过程", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(RepairProcess repairProcess)
    {
        return toAjax(repairProcessService.insertRepairProcess(repairProcess));
    }

    /**
     * 修改维修过程
     */
    @RequiresPermissions("repair:process:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        RepairProcess repairProcess = repairProcessService.selectRepairProcessById(id);
        mmap.put("repairProcess", repairProcess);
        return prefix + "/edit";
    }

    /**
     * 修改保存维修过程
     */
    @RequiresPermissions("repair:process:edit")
    @Log(title = "维修过程", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(RepairProcess repairProcess)
    {
        return toAjax(repairProcessService.updateRepairProcess(repairProcess));
    }

    /**
     * 删除维修过程
     */
    @RequiresPermissions("repair:process:remove")
    @Log(title = "维修过程", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(repairProcessService.deleteRepairProcessByIds(ids));
    }
}
