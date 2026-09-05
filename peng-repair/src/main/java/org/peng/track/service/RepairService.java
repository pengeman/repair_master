package org.peng.track.service;

import org.peng.track.model.FaultCategory;
import org.peng.track.model.FaultCause;
import org.peng.track.model.RepairEquipment;
import org.peng.track.model.RepairProcess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Service
public class RepairService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 新增报修工单
     * repair_status 维修状态(0待开始，1维修中，2完成)

     */
    public int createRepair(RepairEquipment equipment) {
        String sql = "INSERT INTO repair_equipment (salename, model, sn, fault_desc, repair_desc, dispatch_img, order_time, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, equipment.getSalename());
            ps.setString(2, equipment.getModel());
            ps.setString(3, equipment.getSn());
            ps.setString(4, equipment.getFaultDesc());
            ps.setString(5, equipment.getRepairDesc());
            ps.setString(6, equipment.getDispatchImg());
            ps.setString(7, equipment.getOrderTime());
            ps.setString(8, "0"); //"待开始"
            return ps;
        }, keyHolder);
        Number key = keyHolder.getKey();
        return key != null ? key.intValue() : -1;
    }

    public void updateStartTime(int id, String startTime) {
        jdbcTemplate.update("UPDATE repair_equipment SET start_time = ? WHERE id = ?", startTime, id);
    }

    public void updateStatus(int id, String status) {
        //1待开始，2维修中，3已完工
        int istatus = 0;
        switch   (status){
            case "待开始":
                istatus = 1;break;
            case "维修中":
                istatus = 2;break;
            case "已完工":
                istatus = 3; break;
            default : istatus = 1;
        }
        jdbcTemplate.update("UPDATE repair_equipment SET status = ? WHERE id = ?", istatus, id);
    }

    public String getStatusById(int id) {
        List<String> result = jdbcTemplate.query(
            "SELECT status FROM repair_equipment WHERE id = ?",
            (rs, rowNum) -> rs.getString("status"), id);
        return result.isEmpty() ? "no status" : result.get(0);
    }

    public void addProcess(RepairProcess process) {
        jdbcTemplate.update(
            "INSERT INTO repair_process (main_id, media_file, media_desc, record_time, file_type) VALUES (?,?,?,?,?)",
            process.getMainId(), process.getMediaFile(), process.getMediaDesc(),
            process.getRecordTime(), process.getFileType());
    }

    public boolean hasProcess(int mainId) {
        Integer count = jdbcTemplate.queryForObject(
            "SELECT COUNT(*) FROM repair_process WHERE main_id = ?", Integer.class, mainId);
        return count != null && count > 0;
    }

    public RepairEquipment getById(int id) {
        List<RepairEquipment> list = jdbcTemplate.query(
            "SELECT id, model, sn, dispatch_img, fault_desc, repair_desc, fault_reason, summary, " +
            " order_time,   start_time, salename, status " +
            "FROM repair_equipment WHERE id = ?",
            (rs, rowNum) -> {
                RepairEquipment e = new RepairEquipment();
                e.setId(rs.getInt("id"));
                e.setModel(rs.getString("model"));
                e.setSn(rs.getString("sn"));
                e.setDispatchImg(rs.getString("dispatch_img"));
                e.setFaultDesc(rs.getString("fault_desc"));
                e.setRepairDesc(rs.getString("repair_desc"));
                e.setFaultReason(rs.getString("fault_reason"));
                e.setSummary(rs.getString("summary"));
                e.setOrderTime(rs.getString("order_time"));
                e.setStartTime(rs.getString("start_time"));
                e.setSalename(rs.getString("salename"));
                e.setStatus(rs.getString("status"));
                return e;
            }, id);
        return list.isEmpty() ? null : list.get(0);
    }

    public List<Map<String, Object>> getAll() {
        return jdbcTemplate.queryForList(
            "SELECT id, model, sn, order_time, start_time, salename, status FROM repair_equipment ORDER BY id DESC");
    }

    public List<Map<String, Object>> getAllUnfinished() {
        String sql = "SELECT id, model, sn, quality, order_time, start_time, salename, status FROM repair_equipment WHERE repair_status <> 2 ORDER BY id DESC";
        //System.out.println("getAllUnfinished: " + sql);
        List<Map<String, Object>> unfinishedList= jdbcTemplate.queryForList(sql);
        //System.out.println("unfinishedList: " + unfinishedList);
        return unfinishedList;
            
    }

    public List<RepairProcess> getProcessesByMainId(int mainId) {
        return jdbcTemplate.query(
            "SELECT id, main_id, media_file, media_desc,   record_time, file_type " +
            "FROM repair_process WHERE main_id = ? ORDER BY record_time DESC",
            (rs, rowNum) -> {
                RepairProcess p = new RepairProcess();
                p.setId(rs.getInt("id"));
                p.setMainId(rs.getInt("main_id"));
                p.setMediaFile(rs.getString("media_file"));
                p.setMediaDesc(rs.getString("media_desc"));
                p.setRecordTime(rs.getString("record_time"));
                p.setFileType(rs.getString("file_type"));
                return p;
            }, mainId);
    }

    public void saveSummaryAndFinish(int id, String summary, String faultReason, String faultType, String repairDesc) {
        jdbcTemplate.update(
            "UPDATE repair_equipment SET summary = ?, fault_reason = ?, fault_type = ?, repair_desc = ?, end_time = NOW(), repair_status = 2 WHERE id = ?",
            summary, faultReason, faultType, repairDesc, id);
    }

    public List<String> listMediaDescs(int mainId) {
        return jdbcTemplate.queryForList(
            "SELECT media_desc FROM repair_process WHERE main_id = ? ORDER BY record_time ASC",
            String.class, mainId);
    }

    public List<FaultCategory> getAllFaultCategories() {
        return jdbcTemplate.query(
            "SELECT id, name FROM fault_categories ORDER BY id",
            (rs, rowNum) -> new FaultCategory(rs.getInt("id"), rs.getString("name")));
    }

    /**
     * 查询所有故障原因
     */
    public List<FaultCause> getAllFaultCauses() {
        return jdbcTemplate.query(
            "SELECT id, cause FROM fault_cause ORDER BY id",
            (rs, rowNum) -> new FaultCause(rs.getInt("id"), rs.getString("cause")));
    }

    public String generateSummary(int id) {
        List<String> descs = jdbcTemplate.queryForList(
            "SELECT media_desc FROM repair_process WHERE main_id = ? ORDER BY record_time DESC",
            String.class, id);
        StringBuilder summary = new StringBuilder("维修总结：");
        for (String desc : descs) {
            summary.append(desc).append("; ");
        }
        return summary.toString();
    }
}
