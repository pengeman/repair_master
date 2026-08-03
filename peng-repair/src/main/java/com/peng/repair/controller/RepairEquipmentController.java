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
import org.springframework.web.multipart.MultipartFile;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.peng.repair.domain.RepairEquipment;
import com.peng.repair.service.IRepairEquipmentService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import java.io.File;

/**
 * 工单维护Controller
 * 
 * @author pengweitao
 * @date 2026-06-26
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
    public AjaxResult addSave(RepairEquipment repairEquipment,
            @RequestParam(value = "dispatchImgFile", required = false) MultipartFile file)
    {
        // 处理文件上传
        if (file != null && !file.isEmpty()) {
            try {
                String fileName = "dispatch_" + System.currentTimeMillis();
                String uploadDir = com.ruoyi.common.config.RuoYiConfig.getProfile() + "/repair/pics/";
                File destDir = new File(uploadDir);
                if (!destDir.exists()) {
                    destDir.mkdirs();
                }
                String file2 = uploadDir + fileName;
                System.out.println("file2 : " + file2);
                file.transferTo(new File(file2));
                repairEquipment.setDispatchImg(fileName);
            } catch (Exception e) {
                e.printStackTrace();
                return AjaxResult.error("文件上传失败");
            }
        }
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
