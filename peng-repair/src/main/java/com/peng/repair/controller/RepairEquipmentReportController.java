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
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.peng.repair.domain.RepairEquipmentReport;
import com.peng.repair.service.IRepairEquipmentReportService;
import com.peng.repair.service.IRepairEquipmentService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 维护统计Controller
 * 
 * @author pengweitao
 * @date 2026-09-20
 */
@Controller
@RequestMapping("/system/equipmentReport")
public class RepairEquipmentReportController extends BaseController
{
    private String prefix = "system/equipmentReport";

    @Autowired
    private IRepairEquipmentReportService repairEquipmentReportService;

    @Autowired
    private IRepairEquipmentService repairEquipmentService;

    @RequiresPermissions("system:equipmentReport:view")
    @GetMapping()
    public String equipmentReport()
    {
        return prefix + "/equipmentReport";
    }

    /**
     * 查询维修量统计图表数据（全年每月，保内/保外）
     */
    @RequiresPermissions("system:equipmentReport:view")
    @GetMapping("/chartData")
    @ResponseBody
    public AjaxResult chartData()
    {
        return AjaxResult.success(repairEquipmentService.selectRepairMonthStats());
    }

    /**
     * 查询维护统计列表
     */
    @RequiresPermissions("system:equipmentReport:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(RepairEquipmentReport repairEquipmentReport)
    {
        startPage();
        List<RepairEquipmentReport> list = repairEquipmentReportService.selectRepairEquipmentReportList(repairEquipmentReport);
        return getDataTable(list);
    }

    /**
     * 导出维护统计列表
     */
    @RequiresPermissions("system:equipmentReport:export")
    @Log(title = "维护统计", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(RepairEquipmentReport repairEquipmentReport)
    {
        List<RepairEquipmentReport> list = repairEquipmentReportService.selectRepairEquipmentReportList(repairEquipmentReport);
        ExcelUtil<RepairEquipmentReport> util = new ExcelUtil<RepairEquipmentReport>(RepairEquipmentReport.class);
        return util.exportExcel(list, "维护统计数据");
    }

    /**
     * 查看维护统计详情
     */
    @RequiresPermissions("system:equipmentReport:view")
    @GetMapping("/view/{id}")
    public String view(@PathVariable("id") Long id, ModelMap mmap)
    {
        RepairEquipmentReport repairEquipmentReport = repairEquipmentReportService.selectRepairEquipmentReportById(id);
        mmap.put("repairEquipmentReport", repairEquipmentReport);
        return prefix + "/view";
    }

    /**
     * 新增维护统计
     */
    @RequiresPermissions("system:equipmentReport:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存维护统计
     */
    @RequiresPermissions("system:equipmentReport:add")
    @Log(title = "维护统计", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(RepairEquipmentReport repairEquipmentReport)
    {
        return toAjax(repairEquipmentReportService.insertRepairEquipmentReport(repairEquipmentReport));
    }

    /**
     * 修改维护统计
     */
    @RequiresPermissions("system:equipmentReport:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        RepairEquipmentReport repairEquipmentReport = repairEquipmentReportService.selectRepairEquipmentReportById(id);
        mmap.put("repairEquipmentReport", repairEquipmentReport);
        return prefix + "/edit";
    }

    /**
     * 修改保存维护统计
     */
    @RequiresPermissions("system:equipmentReport:edit")
    @Log(title = "维护统计", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(RepairEquipmentReport repairEquipmentReport)
    {
        return toAjax(repairEquipmentReportService.updateRepairEquipmentReport(repairEquipmentReport));
    }

    /**
     * 删除维护统计
     */
    @RequiresPermissions("system:equipmentReport:remove")
    @Log(title = "维护统计", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(repairEquipmentReportService.deleteRepairEquipmentReportByIds(ids));
    }
}
