package com.peng.repair.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.peng.repair.domain.RepairEquipment;
import com.peng.repair.service.IRepairEquipmentService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 工单维护Controller
 * 
 * @author pengweitao
 * @date 2026-08-04
 */
@Controller
@RequestMapping("/system/equipment")
public class RepairEquipmentController extends BaseController
{
    private String prefix = "system/equipment";

    @Autowired
    private IRepairEquipmentService repairEquipmentService;

    @RequiresPermissions("system:equipment:view")
    @GetMapping()
    public String equipment()
    {
        return prefix + "/equipment";
    }

    /**
     * 查询工单维护列表
     */
    @RequiresPermissions("system:equipment:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(RepairEquipment repairEquipment)
    {
        startPage();
        List<RepairEquipment> list = repairEquipmentService.selectRepairEquipmentList(repairEquipment);
        for (RepairEquipment repairEquipment1 : list){
            repairEquipment1.setSalename(repairEquipment1.getSalename() + "/" + repairEquipment1.getClient());
        }
        return getDataTable(list);
    }

    /**
     * 导出工单维护列表
     */
    @RequiresPermissions("system:equipment:export")
    @Log(title = "工单维护", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(RepairEquipment repairEquipment)
    {
        List<RepairEquipment> list = repairEquipmentService.selectRepairEquipmentList(repairEquipment);
        ExcelUtil<RepairEquipment> util = new ExcelUtil<RepairEquipment>(RepairEquipment.class);
        return util.exportExcel(list, "工单维护数据");
    }

    /**
     * 导入工单维护数据
     * 文本为 JSON 数组，元素字段（英文字段名）：
     * salename、model、sn、faultDesc、repairDesc、orderTime(yyyy-MM-dd)、startTime(yyyy-MM-dd)、quality(1保内/2保外)、client、clientAdd、connection
     */
    @RequiresPermissions("system:equipment:add")
    @Log(title = "工单维护", businessType = BusinessType.IMPORT)
    @PostMapping("/import")
    @ResponseBody
    public AjaxResult importData(String data)
    {
        if (StringUtils.isEmpty(data))
        {
            return error("导入数据为空");
        }
        List<RepairEquipment> list = new ArrayList<RepairEquipment>();
        int failCount = 0;
        try
        {
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> rows = objectMapper.readValue(data, new TypeReference<List<Map<String, Object>>>() {});
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for (Map<String, Object> row : rows)
            {
                String sn = toStringValue(row.get("sn"));
                // 编号必填
                if (StringUtils.isEmpty(sn))
                {
                    failCount++;
                    continue;
                }
                RepairEquipment equipment = new RepairEquipment();
                equipment.setSalename(toStringValue(row.get("salename")));
                equipment.setModel(toStringValue(row.get("model")));
                equipment.setSn(sn);
                equipment.setFaultDesc(toStringValue(row.get("faultDesc")));
                equipment.setRepairDesc(toStringValue(row.get("repairDesc")));
                equipment.setClient(toStringValue(row.get("client")));
                equipment.setClientAdd(toStringValue(row.get("clientAdd")));
                equipment.setConnection(toStringValue(row.get("connection")));
                equipment.setOrderTime(parseDate(sdf, toStringValue(row.get("orderTime"))));
                equipment.setStartTime(parseDate(sdf, toStringValue(row.get("startTime"))));
                // 质保期：支持数字或 保内/保外 文本
                String quality = toStringValue(row.get("quality"));
                if (StringUtils.isNotEmpty(quality))
                {
                    if ("保内".equals(quality))
                    {
                        equipment.setQuality(1L);
                    }
                    else if ("保外".equals(quality))
                    {
                        equipment.setQuality(2L);
                    }
                    else
                    {
                        try
                        {
                            equipment.setQuality(Long.valueOf(quality));
                        }
                        catch (NumberFormatException e)
                        {
                            failCount++;
                            continue;
                        }
                    }
                }
                list.add(equipment);
            }
        }
        catch (Exception e)
        {
            return error("导入数据格式不正确，请使用 JSON 数组格式，如 [{\"sn\":\"SN001\",\"salename\":\"张三\",...}]");
        }
        if (list.isEmpty())
        {
            return error("没有可导入的有效数据");
        }
        int count = 0;
        for (RepairEquipment equipment : list)
        {
            count += repairEquipmentService.insertRepairEquipment(equipment);
        }
        String msg = "成功导入 " + count + " 条工单数据";
        if (failCount > 0)
        {
            msg += "，跳过 " + failCount + " 条无效数据";
        }
        return success(msg);
    }

    private String toStringValue(Object value)
    {
        return value == null ? null : value.toString().trim();
    }

    private Date parseDate(SimpleDateFormat sdf, String value)
    {
        if (StringUtils.isEmpty(value))
        {
            return null;
        }
        try
        {
            return sdf.parse(value.trim());
        }
        catch (ParseException e)
        {
            return null;
        }
    }

    /**
     * 新增工单维护
     */
    @RequiresPermissions("system:equipment:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存工单维护
     */
    @RequiresPermissions("system:equipment:add")
    @Log(title = "工单维护", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(RepairEquipment repairEquipment)
    {
        return toAjax(repairEquipmentService.insertRepairEquipment(repairEquipment));
    }

    /**
     * 修改工单维护
     */
    @RequiresPermissions("system:equipment:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        RepairEquipment repairEquipment = repairEquipmentService.selectRepairEquipmentById(id);
        mmap.put("repairEquipment", repairEquipment);
        return prefix + "/edit";
    }

    /**
     * 浏览工单维护
     */
    @RequiresPermissions("system:equipment:list")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap)
    {
        RepairEquipment repairEquipment = repairEquipmentService.selectRepairEquipmentById(id);
        mmap.put("repairEquipment", repairEquipment);
        return prefix + "/detail";
    }

    /**
     * 修改保存工单维护
     */
    @RequiresPermissions("system:equipment:edit")
    @Log(title = "工单维护", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(RepairEquipment repairEquipment)
    {
        return toAjax(repairEquipmentService.updateRepairEquipment(repairEquipment));
    }

    /**
     * 删除工单维护
     */
    @RequiresPermissions("system:equipment:remove")
    @Log(title = "工单维护", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(repairEquipmentService.deleteRepairEquipmentByIds(ids));
    }
}
