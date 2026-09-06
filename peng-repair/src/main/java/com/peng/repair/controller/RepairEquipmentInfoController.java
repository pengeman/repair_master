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
import org.springframework.web.bind.annotation.RequestParam;
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
import org.springframework.web.multipart.MultipartFile;
import com.ruoyi.common.config.RuoYiConfig;

/**
 * 工单维护Controller
 * 
 * @author pengweitao
 * @date 2026-08-04
 */
@Controller
@RequestMapping("/system/equipmentinfo")
public class RepairEquipmentInfoController extends BaseController
{
    private String prefix = "system/equipmentinfo";

    @Autowired
    private IRepairEquipmentService repairEquipmentService;

    @RequiresPermissions("system:equipmentinfo:view")
    @GetMapping()
    public String equipment()
    {
        return prefix + "/equipment";
    }

    /**
     * 查询工单维护列表
     */
    @RequiresPermissions("system:equipmentinfo:list")
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
    @RequiresPermissions("system:equipmentinfo:export")
    @Log(title = "工单维护", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(RepairEquipment repairEquipment)
    {
        List<RepairEquipment> list = repairEquipmentService.selectRepairEquipmentList(repairEquipment);
        ExcelUtil<RepairEquipment> util = new ExcelUtil<RepairEquipment>(RepairEquipment.class);
        return util.exportExcel(list, "工单维护数据");
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
     * 浏览工单信息
     */
    @RequiresPermissions("system:equipmentinfo:view")
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Long id, ModelMap mmap)
    {
        RepairEquipment repairEquipment = repairEquipmentService.selectRepairEquipmentById(id);
        mmap.put("repairEquipment", repairEquipment);
        return prefix + "/detail";
    }

    /**
     * 新增工单页面
     */
    @RequiresPermissions("system:equipmentinfo:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存工单（含 dispatch_img 文件上传 + dispatch_prop）
     */
    @RequiresPermissions("system:equipmentinfo:add")
    @Log(title = "工单维护", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(RepairEquipment repairEquipment,
            @RequestParam(value = "dispatchImgFile", required = false) MultipartFile dispatchImgFile)
    {
        if (dispatchImgFile != null && !dispatchImgFile.isEmpty())
        {
            try
            {
                String ext = "";
                String originalName = dispatchImgFile.getOriginalFilename();
                if (originalName != null && originalName.contains(".")) {
                    ext = originalName.substring(originalName.lastIndexOf("."));
                }
                String fileName = "dispatch_" + System.currentTimeMillis() + ext;
                java.io.File target = new java.io.File(RuoYiConfig.getProfile() + "/pics/" + fileName);
                java.io.File parentDir = target.getParentFile();
                if (parentDir != null && !parentDir.exists())
                {
                    parentDir.mkdirs();
                }
                dispatchImgFile.transferTo(target);
                repairEquipment.setDispatchImg(fileName);
            }
            catch (Exception e)
            {
                e.printStackTrace();
                return error("工单图片上传失败");
            }
        }
        return toAjax(repairEquipmentService.insertRepairEquipment(repairEquipment));
    }

    /**
     * 修改保存工单维护
     */
    @RequiresPermissions("system:equipmentinfo:edit")
    @Log(title = "工单维护", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(RepairEquipment repairEquipment)
    {
        return toAjax(repairEquipmentService.updateRepairEquipment(repairEquipment));
    }
 
}
