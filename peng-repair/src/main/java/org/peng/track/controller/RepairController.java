package org.peng.track.controller;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.domain.AjaxResult;
import org.peng.track.model.FaultCategory;
import org.peng.track.model.RepairEquipment;
import org.peng.track.model.RepairProcess;
import org.peng.track.service.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 设备维修 - 工单管理接口
 */
@Anonymous
@RestController
@RequestMapping("/repair/equipment")
public class RepairController {

    @Autowired
    private RepairService repairService;

    // ========== 前端 ruoyi-mobile 接口 ==========

    /**
     * 获取所有维修工单列表（未完工）
     */
    @GetMapping("/list")
    public AjaxResult list() {
        List<Map<String, Object>> list = repairService.getAll();
        return AjaxResult.success(list);
    }

    /**
     * 获取工单详情
     */
    @GetMapping("/detail/{id}")
    public AjaxResult detail(@PathVariable Long id) {
        try {
            RepairEquipment equipment = repairService.getById(id.intValue());
            if (equipment == null) {
                return AjaxResult.error("工单不存在");
            }
            Map<String, Object> result = new HashMap<>();
            result.put("id", equipment.getId());
            result.put("model", equipment.getModel());
            result.put("sn", equipment.getSn());
            result.put("order_time", equipment.getOrderTime());
            result.put("start_time", equipment.getStartTime());
            result.put("fault_desc", equipment.getFaultDesc());
            result.put("repair_desc", equipment.getRepairDesc());
            result.put("fault_reason", equipment.getFaultReason());
            result.put("summary", equipment.getSummary());
            result.put("dispatch_img", equipment.getDispatchImg());
            result.put("status", equipment.getStatus());
            result.put("salename", equipment.getSalename());

            List<RepairProcess> processes = repairService.getProcessesByMainId(id.intValue());
            List<Map<String, Object>> processList = processes.stream().map(p -> {
                Map<String, Object> map = new HashMap<>();
                map.put("media_file", p.getMediaFile());
                map.put("media_desc", p.getMediaDesc());
                map.put("record_time", p.getRecordTime());
                map.put("file_type", p.getFileType());
                return map;
            }).toList();
            result.put("processes", processList);

            return AjaxResult.success(result);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("查询失败");
        }
    }

    /**
     * 获取维修过程记录
     */
    @GetMapping("/process/{mainId}")
    public AjaxResult process(@PathVariable Integer mainId) {
        try {
            List<RepairProcess> processes = repairService.getProcessesByMainId(mainId);
            List<Map<String, Object>> processList = processes.stream().map(p -> {
                Map<String, Object> map = new HashMap<>();
                map.put("media_file", p.getMediaFile());
                map.put("media_desc", p.getMediaDesc());
                map.put("record_time", p.getRecordTime());
                map.put("file_type", p.getFileType());
                return map;
            }).toList();
            Map<String, Object> result = new HashMap<>();
            result.put("processes", processList);
            return AjaxResult.success(result);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("查询失败");
        }
    }

    // ========== 原 HTML 页面接口（兼容） ==========

    /**
     * 新增报修工单
     */
    @PostMapping("/create")
    public AjaxResult create(
            @RequestParam String salename,
            @RequestParam String model,
            @RequestParam String sn,
            @RequestParam String fault_desc,
            @RequestParam String repair_desc,
            @RequestParam(required = false) MultipartFile dispatch_img) {
        try {
            String fileName = null;
            if (dispatch_img != null && !dispatch_img.isEmpty()) {
                fileName = "dispatch_" + System.currentTimeMillis();
                dispatch_img.transferTo(new java.io.File("uploads/pics/" + fileName));
            }

            RepairEquipment equipment = new RepairEquipment();
            equipment.setSalename(salename);
            equipment.setModel(model);
            equipment.setSn(sn);
            equipment.setFaultDesc(fault_desc);
            equipment.setRepairDesc(repair_desc);
            equipment.setDispatchImg(fileName);
            equipment.setOrderTime(LocalDateTime.now().toString());

            repairService.createRepair(equipment);
            return AjaxResult.success("创建成功");
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("创建失败");
        }
    }

    /**
     * 设置开始时间
     */
    @PostMapping("/set-start-time/{id}")
    public AjaxResult setStartTime(@PathVariable Integer id, @RequestParam String start_time) {
        try {
            repairService.updateStartTime(id, start_time);
            return AjaxResult.success();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("设置失败");
        }
    }

    /**
     * 新增维修过程记录（含图片/视频上传）
     */
    @PostMapping("/add-process/{mainId}")
    public AjaxResult addProcess(
            @PathVariable Integer mainId,
            @RequestParam String desc,
            @RequestParam MultipartFile media) {
        try {
            String type = media.getContentType() != null && media.getContentType().contains("video") ? "video" : "photo";
            String subDir = type.equals("video") ? "video/" : "pics/";
            String fileName = System.currentTimeMillis() + "_" + media.getOriginalFilename();
            media.transferTo(new java.io.File("uploads/" + subDir + fileName));

            RepairProcess process = new RepairProcess();
            process.setMainId(mainId);
            process.setMediaFile(fileName);
            process.setMediaDesc(desc);
            process.setRecordTime(LocalDateTime.now().toString());
            process.setFileType(type);

            boolean hadProcess = repairService.hasProcess(mainId);
            repairService.addProcess(process);
            String dt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            repairService.updateStartTime(mainId, dt);
            if (!hadProcess) {
                repairService.updateStatus(mainId, "维修中");
            }
            return AjaxResult.success();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("添加记录失败");
        }
    }

    /**
     * 查看维修工单（AI 接口）
     */
    @GetMapping("/view_repair/{id}")
    public AjaxResult viewRepair(@PathVariable Long id) {
        try {
            RepairEquipment equipment = repairService.getById(id.intValue());
            if (equipment == null) {
                return AjaxResult.error("工单不存在");
            }
            Map<String, Object> result = new HashMap<>();
            result.put("id", equipment.getId());
            result.put("device_model", equipment.getModel());
            result.put("device_sn", equipment.getSn());
            result.put("dispatch_img", equipment.getDispatchImg());
            result.put("fault_desc", equipment.getFaultDesc());
            result.put("repair_desc", equipment.getRepairDesc());
            result.put("fault_reason", equipment.getFaultReason());
            result.put("order_time", equipment.getOrderTime());
            result.put("start_time", equipment.getStartTime());
            return AjaxResult.success(result);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("查询失败");
        }
    }

    /**
     * 生成维修总结
     */
    @GetMapping("/generate-summary/{id}")
    public AjaxResult generateSummary(@PathVariable Long id) {
        try {
            String summary = repairService.generateSummary(id.intValue());
            return AjaxResult.success(summary);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("生成失败");
        }
    }

    /**
     * 完成维修（保存总结）
     */
    @PostMapping("/finish/{id}")
    public AjaxResult finish(
            @PathVariable Long id,
            @RequestParam String summary,
            @RequestParam(required = false) String fault_reason,
            @RequestParam(required = false) String fault_type,
            @RequestParam(required = false) String repair_desc) {
        try {
            repairService.saveSummaryAndFinish(id.intValue(), summary, fault_reason, fault_type, repair_desc);
            return AjaxResult.success();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("保存失败");
        }
    }

    /**
     * 获取所有故障分类
     */
    @GetMapping("/fault-categories")
    public AjaxResult faultCategories() {
        try {
            List<FaultCategory> list = repairService.getAllFaultCategories();
            return AjaxResult.success(list);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("查询失败");
        }
    }

    /**
     * 获取未完工工单列表
     */
    @GetMapping("/unlist")
    public AjaxResult unfinishedList() {
        List<Map<String, Object>> list = repairService.getAllUnfinished();
        return AjaxResult.success(list);
    }

    /**
     * 获取工单详情（简易版，供跟踪页面使用）
     */
    @GetMapping("/detailfortrack/{id}")
    public AjaxResult detailForTrack(@PathVariable Long id) {
        try {
            RepairEquipment equipment = repairService.getById(id.intValue());
            if (equipment == null) {
                return AjaxResult.error("工单不存在");
            }
            Map<String, Object> result = new HashMap<>();
            result.put("id", equipment.getId());
            result.put("salename", equipment.getSalename());
            result.put("model", equipment.getModel());
            result.put("sn", equipment.getSn());
            result.put("order_time", equipment.getOrderTime());
            result.put("start_time", equipment.getStartTime());
            result.put("fault_desc", equipment.getFaultDesc());
            result.put("repair_desc", equipment.getRepairDesc());
            result.put("status", equipment.getStatus());
            result.put("dispatch_img", equipment.getDispatchImg());
            return AjaxResult.success(result);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("查询失败");
        }
    }

    /**
     * 获取维修过程（兼容旧路径）
     */
    @GetMapping("/repairProcess/{id}")
    public AjaxResult repairProcess(@PathVariable Long id) {
        try {
            List<RepairProcess> processes = repairService.getProcessesByMainId(id.intValue());
            List<Map<String, Object>> processList = processes.stream().map(p -> {
                Map<String, Object> map = new HashMap<>();
                map.put("media_file", p.getMediaFile());
                map.put("media_desc", p.getMediaDesc());
                map.put("record_time", p.getRecordTime());
                map.put("file_type", p.getFileType());
                return map;
            }).toList();
            Map<String, Object> result = new HashMap<>();
            result.put("processes", processList);
            return AjaxResult.success(result);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("查询失败");
        }
    }
}
