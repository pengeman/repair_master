package com.peng.repair.controller;

import java.util.List;
import java.util.Date;
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
import com.peng.repair.service.IFaultCategoryService;
import com.peng.repair.service.IFaultCauseService;
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

    @Autowired
    private IFaultCategoryService faultCategoryService;

    @Autowired
    private IFaultCauseService faultCauseService;

    @RequiresPermissions("repair:process:view")
    @Log(title = "维修过程", businessType = BusinessType.OTHER)
    @GetMapping()
    public String process()
    {
        return prefix + "/process";
    }

    /**
     * 查询维修过程列表
     */
    @RequiresPermissions("repair:process:list")
    @Log(title = "维修过程", businessType = BusinessType.OTHER)
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
     * 查看维修过程详情（该工单的所有维修记录）
     */
    @RequiresPermissions("repair:process:view")
    @Log(title = "维修过程", businessType = BusinessType.OTHER)
    @GetMapping("/view/{id}")
    public String view(@PathVariable("id") Long id, ModelMap mmap)
    {
        // id 为工单主键（列表展示的是 repair_equipment 数据），查询该工单所有维修记录
        List<RepairProcess> processList = repairProcessService.selectRepairProcessListByMainId(id);
        mmap.put("processList", processList);
        return prefix + "/view";
    }

    /**
     * 维修完结弹窗页面
     */
    @RequiresPermissions("repair:process:view")
    @Log(title = "维修过程", businessType = BusinessType.OTHER)
    @GetMapping("/finish")
    public String finish(@RequestParam(value = "mainId", required = false) Long mainId, ModelMap mmap)
    {
        // 关联的工单数据（根据 mainId 查询 repair_equipment，用于回显问题描述）
        if (StringUtils.isNotNull(mainId))
        {
            RepairEquipment repairEquipment = repairEquipmentService.selectRepairEquipmentById(mainId);
            mmap.put("repairEquipment", repairEquipment);
            mmap.put("mainId", mainId);
        }
        // 故障原因（fault_cause 表）、故障分类（fault_categories 表）选项数据
        mmap.put("causeList", faultCauseService.selectFaultCauseList());
        mmap.put("categoryList", faultCategoryService.selectFaultCategoryList());
        return prefix + "/finish";
    }

    /**
     * 维修完结确认完工保存
     */
    @RequiresPermissions("repair:process:edit")
    @Log(title = "维修完结", businessType = BusinessType.UPDATE)
    @PostMapping("/finishSave")
    @ResponseBody
    public AjaxResult finishSave(RepairEquipment repairEquipment)
    {
        // 维修状态(0待开始，1维修中，2完成)：完工置 2；记录结束时间
        repairEquipment.setRepairStatus(2L);
        repairEquipment.setEndTime(new Date());
        // 兼容旧状态字段（列表展示：1待开始/2维修中/3已完工）
        repairEquipment.setStatus(3L);
        return toAjax(repairEquipmentService.updateRepairEquipment(repairEquipment));
    }

    /**
     * 生成维修分析总结：串联该工单的所有维修过程记录
     */
    @RequiresPermissions("repair:process:view")
    @GetMapping("/genSummary")
    @ResponseBody
    public AjaxResult genSummary(@RequestParam(value = "mainId", required = false) Long mainId)
    {
        if (StringUtils.isNull(mainId))
        {
            return AjaxResult.error("缺少工单参数");
        }
        // 工单信息
        RepairEquipment repairEquipment = repairEquipmentService.selectRepairEquipmentById(mainId);
        // 该工单的所有维修过程记录
        List<RepairProcess> processList = repairProcessService.selectRepairProcessListByMainId(mainId);

        StringBuilder sb = new StringBuilder();
        if (repairEquipment != null)
        {
            sb.append("【工单信息】").append("板型：").append(repairEquipment.getModel())
              .append("，编号：").append(repairEquipment.getSn())
              .append("，问题描述：").append(repairEquipment.getFaultDesc()).append("\n");
        }
        if (processList != null && !processList.isEmpty())
        {
            sb.append("【维修过程记录】\n");
            for (int i = 0; i < processList.size(); i++)
            {
                RepairProcess rp = processList.get(i);
                sb.append(i + 1).append(". ");
                if (rp.getRecordTime() != null)
                {
                    sb.append(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(rp.getRecordTime())).append(" ");
                }
                sb.append(rp.getMediaDesc() == null ? "" : rp.getMediaDesc()).append("\n");
            }
        }
        else
        {
            sb.append("该工单暂无维修过程记录。");
        }
        return AjaxResult.success("生成成功", sb.toString());
    }

    /**
     * 新增维修过程
     */
    @RequiresPermissions("repair:process:add")
    @Log(title = "维修过程", businessType = BusinessType.OTHER)
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
    @Log(title = "维修过程", businessType = BusinessType.OTHER)
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
