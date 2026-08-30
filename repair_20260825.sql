-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: ruoyi
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ruoyi`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ruoyi` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ruoyi`;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brain_test_result`
--

DROP TABLE IF EXISTS `brain_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brain_test_result` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `game_type` varchar(32) NOT NULL COMMENT '游戏类型(schulte/memory/match/pattern/reaction/sudoku)',
  `test_type` varchar(64) DEFAULT '' COMMENT '测试类型名称(专注力/记忆力/逻辑力/反应力)',
  `score` int DEFAULT '0' COMMENT '得分',
  `duration` int DEFAULT '0' COMMENT '用时(秒)',
  `level` int DEFAULT '1' COMMENT '难度等级',
  `extra` varchar(500) DEFAULT '' COMMENT '扩展信息(JSON,如失误次数)',
  `test_time` datetime DEFAULT NULL COMMENT '测试时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_game` (`user_id`,`game_type`),
  KEY `idx_test_time` (`test_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='脑力游戏成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brain_test_result`
--

LOCK TABLES `brain_test_result` WRITE;
/*!40000 ALTER TABLE `brain_test_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `brain_test_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breakdown`
--

DROP TABLE IF EXISTS `breakdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breakdown` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='故障类型字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breakdown`
--

LOCK TABLES `breakdown` WRITE;
/*!40000 ALTER TABLE `breakdown` DISABLE KEYS */;
INSERT INTO `breakdown` VALUES (1,'001','设备老化','使用时间太长了'),(2,'002','002','0022');
/*!40000 ALTER TABLE `breakdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fault_categories`
--

DROP TABLE IF EXISTS `fault_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fault_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fault_categories`
--

LOCK TABLES `fault_categories` WRITE;
/*!40000 ALTER TABLE `fault_categories` DISABLE KEYS */;
INSERT INTO `fault_categories` VALUES (6,'侵蚀'),(13,'其他'),(1,'化学腐蚀'),(4,'垢下腐蚀'),(2,'应力腐蚀'),(8,'机械冲击'),(7,'机械疲劳'),(12,'材料质量'),(5,'漏点腐蚀'),(9,'热应力冲击'),(10,'热疲劳'),(11,'焊接质量'),(3,'缝隙腐蚀');
/*!40000 ALTER TABLE `fault_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fault_cause`
--

DROP TABLE IF EXISTS `fault_cause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fault_cause` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cause` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fault_cause`
--

LOCK TABLES `fault_cause` WRITE;
/*!40000 ALTER TABLE `fault_cause` DISABLE KEYS */;
INSERT INTO `fault_cause` VALUES (1,'设计原因'),(2,'生产原因'),(3,'客户原因'),(4,'运输原因'),(5,'选型错误'),(6,'漏检验'),(7,'纯服务');
/*!40000 ALTER TABLE `fault_cause` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int DEFAULT '1' COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (2,'repair_equipment','维修工单','',NULL,'RepairEquipment','crud','com.peng.repair','system','equipment','工单维护','pengweitao',1,'0','/','{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"genView\":\"1\",\"treeParentCode\":\"\",\"parentMenuName\":\"售后管理\",\"treeCode\":\"\"}','admin','2026-08-04 23:15:05','','2026-08-06 14:42:03',''),(3,'repair_process','维修过程','',NULL,'RepairProcess','crud','com.peng.repair','repair','process','维修过程','pengweitao',1,'0','/','{\"parentMenuId\":\"1\",\"treeName\":\"\",\"genView\":\"1\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统管理\",\"treeCode\":\"\"}','admin','2026-08-06 14:36:11','','2026-08-06 14:57:03','');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (15,2,'id','',NULL,'Long','id','1','1',NULL,NULL,NULL,NULL,NULL,'EQ','input','',1,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(16,2,'model','板型',NULL,'String','model','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(17,2,'sn','编号',NULL,'String','sn','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(18,2,'dispatch_img','工单',NULL,'String','dispatchImg','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',5,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(19,2,'fault_desc','问题描述',NULL,'String','faultDesc','0','0',NULL,'1','1','1',NULL,'EQ','input','',6,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(20,2,'repair_desc','维修描述',NULL,'String','repairDesc','0','0',NULL,'1','1','1',NULL,'EQ','input','',7,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(21,2,'fault_reason','问题原因',NULL,'String','faultReason','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',8,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(22,2,'summary','总结',NULL,'String','summary','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',9,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(23,2,'order_time','工单时间',NULL,'Date','orderTime','0','0',NULL,'1','1','1',NULL,'EQ','datetime','',10,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(24,2,'start_time','开工时间',NULL,'Date','startTime','0','0',NULL,'1','1','1',NULL,'EQ','datetime','',11,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(25,2,'salename','业务员',NULL,'String','salename','0','0',NULL,'1','1','1',NULL,'LIKE','input','',2,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(26,2,'status','1待开始，2维修中，3已完工',NULL,'Long','status','0','0',NULL,'1','1',NULL,NULL,'EQ','radio','',12,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(27,2,'end_time','结束时间',NULL,'Date','endTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',13,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(28,2,'fault_type','外键 fault_categories.id',NULL,'Long','faultType','0','0',NULL,'1','1',NULL,NULL,'EQ','select','',14,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(29,2,'quality','质保期',NULL,'Long','quality','0','0',NULL,'1','1','1','1','EQ','select','u_quality',15,'admin','2026-08-04 23:15:05',NULL,'2026-08-06 14:42:03'),(30,3,'id','',NULL,'Long','id','1','1',NULL,NULL,NULL,NULL,NULL,'EQ','input','',1,'admin','2026-08-06 14:36:11',NULL,'2026-08-06 14:57:03'),(31,3,'main_id','',NULL,'Long','mainId','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',2,'admin','2026-08-06 14:36:11',NULL,'2026-08-06 14:57:03'),(32,3,'media_file','过程图片',NULL,'String','mediaFile','0','0',NULL,'1','1','1',NULL,'EQ','upload','',3,'admin','2026-08-06 14:36:11',NULL,'2026-08-06 14:57:03'),(33,3,'media_desc','过程描述',NULL,'String','mediaDesc','0','0',NULL,'1','1','1',NULL,'EQ','input','',4,'admin','2026-08-06 14:36:11',NULL,'2026-08-06 14:57:03'),(34,3,'record_time','记录时间',NULL,'Date','recordTime','0','0',NULL,'1','1','1',NULL,'EQ','datetime','',5,'admin','2026-08-06 14:36:11',NULL,'2026-08-06 14:57:03'),(35,3,'file_type','',NULL,'String','fileType','0','0',NULL,'1',NULL,NULL,NULL,'EQ','select','',6,'admin','2026-08-06 14:36:11',NULL,'2026-08-06 14:57:03');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_equipment`
--

DROP TABLE IF EXISTS `repair_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_equipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `model` varchar(128) DEFAULT NULL,
  `sn` varchar(128) DEFAULT NULL,
  `dispatch_img` varchar(128) DEFAULT NULL,
  `fault_desc` varchar(128) DEFAULT NULL,
  `repair_desc` varchar(128) DEFAULT NULL,
  `fault_reason` varchar(128) DEFAULT NULL,
  `cause_desc` varchar(255) DEFAULT NULL COMMENT '原因描述',
  `fault_type_desc` varchar(255) DEFAULT NULL COMMENT '故障分类(多选)',
  `summary` varchar(256) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `salename` varchar(64) DEFAULT NULL,
  `status` int DEFAULT '1' COMMENT '1待开始，2维修中，3已完工',
  `repair_status` int DEFAULT '0' COMMENT '维修状态(0待开始，1维修中，2完成)',
  `end_time` datetime DEFAULT NULL,
  `fault_type` int DEFAULT NULL COMMENT '外键 fault_categories.id',
  `fault_causeid` int DEFAULT NULL COMMENT '故障原因id',
  `quality` int DEFAULT NULL,
  `client` varchar(256) DEFAULT NULL,
  `client_add` varchar(256) DEFAULT NULL,
  `connection` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_equipment`
--

LOCK TABLES `repair_equipment` WRITE;
/*!40000 ALTER TABLE `repair_equipment` DISABLE KEYS */;
INSERT INTO `repair_equipment` VALUES (1,'BP100MV','完整编号24557','','外露','更换垫片','1',NULL,NULL,'客户名称，地址，联系人，电话','2026-06-27 00:00:00',NULL,'张万磊/彤程电子材料,',1,0,NULL,NULL,NULL,1,NULL,NULL,NULL),(3,'BP100MV','24557','','外露','','缝隙腐蚀','缝隙腐蚀','客户原因','补焊漏点','2026-06-27 00:00:00',NULL,'',3,0,'2026-08-10 23:03:14',NULL,NULL,NULL,NULL,NULL,NULL),(4,'BP100MV','24557','dispatch_1782564729243','外露','','外露','缝隙腐蚀','客户原因','【工单信息】板型：BP100MV，编号：24557，问题描述：外露\n【维修过程记录】\n1. 2026-05-25 09:50 拆开清洗，准备维修\n2. 2026-05-15 10:56 腐蚀，焊缝开裂\n','2026-06-27 00:00:00',NULL,'张万磊/彤程电子材料',3,2,'2026-08-10 23:19:28',3,3,NULL,NULL,NULL,NULL),(5,'BP120MV','24558','工单工单','问题描述','维修描述','问题原因',NULL,NULL,'',NULL,NULL,'张万磊/彤程电子材料',1,0,NULL,NULL,NULL,1,NULL,NULL,NULL),(6,'BP100MV','250024','','呲牙呲牙的','','',NULL,NULL,'',NULL,NULL,'王哈绕',1,0,NULL,NULL,NULL,1,'四川罗布泊化工','法国原装进口','法拉米'),(7,'','','','','','',NULL,NULL,'',NULL,NULL,'',1,0,NULL,NULL,NULL,NULL,'','','');
/*!40000 ALTER TABLE `repair_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_process`
--

DROP TABLE IF EXISTS `repair_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_id` int DEFAULT NULL,
  `media_file` varchar(128) DEFAULT NULL,
  `media_desc` varchar(128) DEFAULT NULL,
  `record_time` datetime DEFAULT NULL,
  `file_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_process`
--

LOCK TABLES `repair_process` WRITE;
/*!40000 ALTER TABLE `repair_process` DISABLE KEYS */;
INSERT INTO `repair_process` VALUES (1,2,'http://localhost:8080/profile/upload/2026/08/06/girl_beauty_20260806221229A001.jpeg','小小妹花朵','2026-08-06 00:00:00','photo'),(2,2,'1778685038334_wx_camera_1778038084298.jpg','准备打烊','2026-05-13 23:10:38','photo'),(3,4,'1778813768153_IMG_20260515_101304.jpg','腐蚀，焊缝开裂','2026-05-15 10:56:08','photo'),(4,5,'1778814776583_mmexport1778814724573.jpg','装好打压，不漏，有一条胶垫外漏','2026-05-15 11:12:57','photo'),(5,5,'1779673336886_tmp_img.png','等待业务员下单更换胶套','2026-05-25 09:42:17','photo'),(6,2,'1779673481714_tmp_img.png','看看看看','2026-05-25 09:44:42','photo'),(7,2,'1779673483376_tmp_img.png','看看看看','2026-05-25 09:44:43','photo'),(8,4,'1779673811973_IMG_20260525_094727.jpg','拆开清洗，准备维修','2026-05-25 09:50:12','photo'),(9,6,'1779876808644_cat.jpeg','后，结束了。封堵两条流到','2026-05-27 18:13:29','photo'),(10,7,'1780723621870_flower_hayeke.jpeg','好意多美里的','2026-06-06 13:27:02','photo'),(11,7,'1780729921087_girl_beauty.jpeg','第二次开始','2026-06-06 15:12:01','photo'),(12,7,'1780730032673_house.png','第三次房东','2026-06-06 15:13:53','photo'),(13,NULL,'','开始了','2026-08-05 00:00:00',NULL),(14,1,'http://localhost:8080/profile/upload/2026/08/09/house_20260809124932A002.png','房间上虞了','2026-08-09 12:47:17',NULL),(15,1,'http://localhost:8080/profile/upload/2026/08/09/girl_beauty_20260809130524A002.jpeg','妹妹来来额','2026-08-09 13:02:06',NULL),(16,1,'http://localhost:8080/profile/upload/2026/08/09/shishangdiaohua_20260809130718A003.jpeg','屎上雕花','2026-08-09 13:07:10',NULL);
/*!40000 ALTER TABLE `repair_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2026-06-26 14:21:08','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2026-06-26 14:21:08','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2026-06-26 14:21:08','',NULL,'深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue'),(4,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2026-06-26 14:21:08','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(5,'用户管理-密码字符范围','sys.account.chrtype','0','Y','admin','2026-06-26 14:21:09','',NULL,'默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）'),(6,'用户管理-初始密码修改策略','sys.account.initPasswordModify','1','Y','admin','2026-06-26 14:21:09','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),(7,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2026-06-26 14:21:09','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框'),(8,'主框架页-菜单导航显示风格','sys.index.menuStyle','default','Y','admin','2026-06-26 14:21:09','',NULL,'菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）'),(9,'主框架页-是否开启页脚','sys.index.footer','true','Y','admin','2026-06-26 14:21:09','',NULL,'是否开启底部页脚显示（true显示，false隐藏）'),(10,'主框架页-是否开启页签','sys.index.tagsView','true','Y','admin','2026-06-26 14:21:09','',NULL,'是否开启菜单多页签显示（true显示，false隐藏）'),(11,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2026-06-26 14:21:09','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb3 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2026-06-26 14:20:25','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2026-06-26 14:20:25','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2026-06-26 14:20:25','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2026-06-26 14:20:25','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2026-06-26 14:20:25','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2026-06-26 14:20:26','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2026-06-26 14:20:26','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2026-06-26 14:20:26','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2026-06-26 14:20:26','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2026-06-26 14:20:26','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2026-06-26 14:21:03','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2026-06-26 14:21:03','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2026-06-26 14:21:04','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2026-06-26 14:21:04','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2026-06-26 14:21:04','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2026-06-26 14:21:04','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2026-06-26 14:21:04','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2026-06-26 14:21:04','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2026-06-26 14:21:04','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2026-06-26 14:21:04','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2026-06-26 14:21:04','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2026-06-26 14:21:05','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2026-06-26 14:21:05','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2026-06-26 14:21:05','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2026-06-26 14:21:05','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2026-06-26 14:21:05','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2026-06-26 14:21:05','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2026-06-26 14:21:05','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2026-06-26 14:21:05','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2026-06-26 14:21:06','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2026-06-26 14:21:06','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2026-06-26 14:21:06','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2026-06-26 14:21:06','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2026-06-26 14:21:06','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2026-06-26 14:21:06','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2026-06-26 14:21:06','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2026-06-26 14:21:06','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2026-06-26 14:21:06','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2026-06-26 14:21:07','',NULL,'停用状态'),(100,1,'1','保内','u_quality',NULL,'default','Y','0','admin','2026-08-04 23:30:50','',NULL,NULL),(101,2,'2','保外','u_quality',NULL,'default','Y','0','admin','2026-08-04 23:31:17','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2026-06-26 14:21:01','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2026-06-26 14:21:01','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2026-06-26 14:21:01','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2026-06-26 14:21:01','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2026-06-26 14:21:01','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2026-06-26 14:21:01','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2026-06-26 14:21:02','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2026-06-26 14:21:02','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2026-06-26 14:21:02','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2026-06-26 14:21:02','',NULL,'登录状态列表'),(100,'质保','u_quality','0','admin','2026-08-04 23:22:16','admin','2026-08-04 23:28:21','');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2026-06-26 14:21:14','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2026-06-26 14:21:14','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2026-06-26 14:21:14','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `start_time` datetime DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '执行结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','退出成功','2026-08-06 14:50:31'),(2,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-06 14:50:31'),(3,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-06 17:50:30'),(4,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-06 19:38:31'),(5,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-06 21:35:55'),(6,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-06 22:11:07'),(7,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-06 23:08:30'),(8,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-07 01:01:41'),(9,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-08 19:11:59'),(10,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-09 00:33:04'),(11,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','退出成功','2026-08-09 00:38:54'),(12,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-09 11:00:21'),(13,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-09 12:15:30'),(14,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-09 16:20:41'),(15,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-09 18:07:37'),(16,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-09 18:44:46'),(17,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-09 19:55:52'),(18,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-09 20:34:31'),(19,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-09 22:03:40'),(20,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-09 23:01:49'),(21,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-10 09:01:07'),(22,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-10 22:04:45'),(23,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','退出成功','2026-08-10 22:31:01'),(24,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-10 22:31:01'),(25,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-10 23:01:28'),(26,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-11 00:08:00'),(27,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-20 22:05:30'),(28,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-21 10:32:41'),(29,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-21 20:33:05'),(30,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-21 22:58:09'),(31,'admin','192.168.66.245','内网IP','Edge 151','Linux','0','登录成功','2026-08-22 22:18:47'),(32,'admin','127.0.0.1','内网IP','Edge 151','Linux','0','登录成功','2026-08-22 22:20:14'),(33,'admin','192.168.188.2','内网IP','Chrome Webview 144.0.7559.86','Android 16','0','登录成功','2026-08-22 22:54:28'),(34,'admin','192.168.66.245','内网IP','Edge 151','Linux','0','登录成功','2026-08-22 22:57:19'),(35,'admin','192.168.66.245','内网IP','Edge 151','Linux','0','登录成功','2026-08-23 22:31:15'),(36,'admin','127.0.0.1','内网IP','Curl 7.68.0','','0','登录成功','2026-08-24 21:49:18'),(37,'admin','192.168.66.245','内网IP','Edge 151','Linux','0','登录成功','2026-08-24 22:44:51');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2102 DEFAULT CHARSET=utf8mb3 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'#','','M','0','1','','fa fa-gear','admin','2026-06-26 14:20:32','',NULL,'系统管理目录'),(2,'系统监控',0,2,'#','','M','0','1','','fa fa-video-camera','admin','2026-06-26 14:20:32','',NULL,'系统监控目录'),(3,'系统工具',0,3,'#','','M','0','1','','fa fa-bars','admin','2026-06-26 14:20:32','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip','menuBlank','C','0','1','','fa fa-location-arrow','admin','2026-06-26 14:20:32','',NULL,'若依官网地址'),(100,'用户管理',1,1,'/system/user','','C','0','1','system:user:view','fa fa-user-o','admin','2026-06-26 14:20:33','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'/system/role','','C','0','1','system:role:view','fa fa-user-secret','admin','2026-06-26 14:20:33','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'/system/menu','','C','0','1','system:menu:view','fa fa-th-list','admin','2026-06-26 14:20:33','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'/system/dept','','C','0','1','system:dept:view','fa fa-outdent','admin','2026-06-26 14:20:33','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'/system/post','','C','0','1','system:post:view','fa fa-address-card-o','admin','2026-06-26 14:20:33','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'/system/dict','','C','0','1','system:dict:view','fa fa-bookmark-o','admin','2026-06-26 14:20:33','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'/system/config','','C','0','1','system:config:view','fa fa-sun-o','admin','2026-06-26 14:20:33','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'/system/notice','','C','0','1','system:notice:view','fa fa-bullhorn','admin','2026-06-26 14:20:33','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'#','','M','0','1','','fa fa-pencil-square-o','admin','2026-06-26 14:20:33','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'/monitor/online','','C','0','1','monitor:online:view','fa fa-user-circle','admin','2026-06-26 14:20:33','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'/monitor/job','','C','0','1','monitor:job:view','fa fa-tasks','admin','2026-06-26 14:20:34','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'/monitor/data','','C','0','1','monitor:data:view','fa fa-bug','admin','2026-06-26 14:20:34','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'/monitor/server','','C','0','1','monitor:server:view','fa fa-server','admin','2026-06-26 14:20:34','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'/monitor/cache','','C','0','1','monitor:cache:view','fa fa-cube','admin','2026-06-26 14:20:34','',NULL,'缓存监控菜单'),(114,'表单构建',3,1,'/tool/build','','C','0','1','tool:build:view','fa fa-wpforms','admin','2026-06-26 14:20:34','',NULL,'表单构建菜单'),(115,'代码生成',3,2,'/tool/gen','','C','0','1','tool:gen:view','fa fa-code','admin','2026-06-26 14:20:34','',NULL,'代码生成菜单'),(116,'系统接口',3,3,'/tool/swagger','','C','0','1','tool:swagger:view','fa fa-gg','admin','2026-06-26 14:20:34','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'/monitor/operlog','','C','0','1','monitor:operlog:view','fa fa-address-book','admin','2026-06-26 14:20:34','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'/monitor/logininfor','','C','0','1','monitor:logininfor:view','fa fa-file-image-o','admin','2026-06-26 14:20:35','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'#','','F','0','1','system:user:list','#','admin','2026-06-26 14:20:35','',NULL,''),(1001,'用户新增',100,2,'#','','F','0','1','system:user:add','#','admin','2026-06-26 14:20:35','',NULL,''),(1002,'用户修改',100,3,'#','','F','0','1','system:user:edit','#','admin','2026-06-26 14:20:35','',NULL,''),(1003,'用户删除',100,4,'#','','F','0','1','system:user:remove','#','admin','2026-06-26 14:20:35','',NULL,''),(1004,'用户导出',100,5,'#','','F','0','1','system:user:export','#','admin','2026-06-26 14:20:35','',NULL,''),(1005,'用户导入',100,6,'#','','F','0','1','system:user:import','#','admin','2026-06-26 14:20:35','',NULL,''),(1006,'重置密码',100,7,'#','','F','0','1','system:user:resetPwd','#','admin','2026-06-26 14:20:35','',NULL,''),(1007,'角色查询',101,1,'#','','F','0','1','system:role:list','#','admin','2026-06-26 14:20:35','',NULL,''),(1008,'角色新增',101,2,'#','','F','0','1','system:role:add','#','admin','2026-06-26 14:20:36','',NULL,''),(1009,'角色修改',101,3,'#','','F','0','1','system:role:edit','#','admin','2026-06-26 14:20:36','',NULL,''),(1010,'角色删除',101,4,'#','','F','0','1','system:role:remove','#','admin','2026-06-26 14:20:36','',NULL,''),(1011,'角色导出',101,5,'#','','F','0','1','system:role:export','#','admin','2026-06-26 14:20:36','',NULL,''),(1012,'菜单查询',102,1,'#','','F','0','1','system:menu:list','#','admin','2026-06-26 14:20:36','',NULL,''),(1013,'菜单新增',102,2,'#','','F','0','1','system:menu:add','#','admin','2026-06-26 14:20:36','',NULL,''),(1014,'菜单修改',102,3,'#','','F','0','1','system:menu:edit','#','admin','2026-06-26 14:20:36','',NULL,''),(1015,'菜单删除',102,4,'#','','F','0','1','system:menu:remove','#','admin','2026-06-26 14:20:36','',NULL,''),(1016,'部门查询',103,1,'#','','F','0','1','system:dept:list','#','admin','2026-06-26 14:20:36','',NULL,''),(1017,'部门新增',103,2,'#','','F','0','1','system:dept:add','#','admin','2026-06-26 14:20:37','',NULL,''),(1018,'部门修改',103,3,'#','','F','0','1','system:dept:edit','#','admin','2026-06-26 14:20:37','',NULL,''),(1019,'部门删除',103,4,'#','','F','0','1','system:dept:remove','#','admin','2026-06-26 14:20:37','',NULL,''),(1020,'岗位查询',104,1,'#','','F','0','1','system:post:list','#','admin','2026-06-26 14:20:37','',NULL,''),(1021,'岗位新增',104,2,'#','','F','0','1','system:post:add','#','admin','2026-06-26 14:20:37','',NULL,''),(1022,'岗位修改',104,3,'#','','F','0','1','system:post:edit','#','admin','2026-06-26 14:20:37','',NULL,''),(1023,'岗位删除',104,4,'#','','F','0','1','system:post:remove','#','admin','2026-06-26 14:20:37','',NULL,''),(1024,'岗位导出',104,5,'#','','F','0','1','system:post:export','#','admin','2026-06-26 14:20:37','',NULL,''),(1025,'字典查询',105,1,'#','','F','0','1','system:dict:list','#','admin','2026-06-26 14:20:37','',NULL,''),(1026,'字典新增',105,2,'#','','F','0','1','system:dict:add','#','admin','2026-06-26 14:20:38','',NULL,''),(1027,'字典修改',105,3,'#','','F','0','1','system:dict:edit','#','admin','2026-06-26 14:20:38','',NULL,''),(1028,'字典删除',105,4,'#','','F','0','1','system:dict:remove','#','admin','2026-06-26 14:20:38','',NULL,''),(1029,'字典导出',105,5,'#','','F','0','1','system:dict:export','#','admin','2026-06-26 14:20:38','',NULL,''),(1030,'参数查询',106,1,'#','','F','0','1','system:config:list','#','admin','2026-06-26 14:20:38','',NULL,''),(1031,'参数新增',106,2,'#','','F','0','1','system:config:add','#','admin','2026-06-26 14:20:38','',NULL,''),(1032,'参数修改',106,3,'#','','F','0','1','system:config:edit','#','admin','2026-06-26 14:20:38','',NULL,''),(1033,'参数删除',106,4,'#','','F','0','1','system:config:remove','#','admin','2026-06-26 14:20:38','',NULL,''),(1034,'参数导出',106,5,'#','','F','0','1','system:config:export','#','admin','2026-06-26 14:20:38','',NULL,''),(1035,'公告查询',107,1,'#','','F','0','1','system:notice:list','#','admin','2026-06-26 14:20:38','',NULL,''),(1036,'公告新增',107,2,'#','','F','0','1','system:notice:add','#','admin','2026-06-26 14:20:39','',NULL,''),(1037,'公告修改',107,3,'#','','F','0','1','system:notice:edit','#','admin','2026-06-26 14:20:39','',NULL,''),(1038,'公告删除',107,4,'#','','F','0','1','system:notice:remove','#','admin','2026-06-26 14:20:39','',NULL,''),(1039,'操作查询',500,1,'#','','F','0','1','monitor:operlog:list','#','admin','2026-06-26 14:20:39','',NULL,''),(1040,'操作删除',500,2,'#','','F','0','1','monitor:operlog:remove','#','admin','2026-06-26 14:20:39','',NULL,''),(1041,'详细信息',500,3,'#','','F','0','1','monitor:operlog:detail','#','admin','2026-06-26 14:20:39','',NULL,''),(1042,'日志导出',500,4,'#','','F','0','1','monitor:operlog:export','#','admin','2026-06-26 14:20:39','',NULL,''),(1043,'登录查询',501,1,'#','','F','0','1','monitor:logininfor:list','#','admin','2026-06-26 14:20:39','',NULL,''),(1044,'登录删除',501,2,'#','','F','0','1','monitor:logininfor:remove','#','admin','2026-06-26 14:20:39','',NULL,''),(1045,'日志导出',501,3,'#','','F','0','1','monitor:logininfor:export','#','admin','2026-06-26 14:20:40','',NULL,''),(1046,'账户解锁',501,4,'#','','F','0','1','monitor:logininfor:unlock','#','admin','2026-06-26 14:20:40','',NULL,''),(1047,'在线查询',109,1,'#','','F','0','1','monitor:online:list','#','admin','2026-06-26 14:20:40','',NULL,''),(1048,'批量强退',109,2,'#','','F','0','1','monitor:online:batchForceLogout','#','admin','2026-06-26 14:20:40','',NULL,''),(1049,'单条强退',109,3,'#','','F','0','1','monitor:online:forceLogout','#','admin','2026-06-26 14:20:40','',NULL,''),(1050,'任务查询',110,1,'#','','F','0','1','monitor:job:list','#','admin','2026-06-26 14:20:40','',NULL,''),(1051,'任务新增',110,2,'#','','F','0','1','monitor:job:add','#','admin','2026-06-26 14:20:40','',NULL,''),(1052,'任务修改',110,3,'#','','F','0','1','monitor:job:edit','#','admin','2026-06-26 14:20:40','',NULL,''),(1053,'任务删除',110,4,'#','','F','0','1','monitor:job:remove','#','admin','2026-06-26 14:20:41','',NULL,''),(1054,'状态修改',110,5,'#','','F','0','1','monitor:job:changeStatus','#','admin','2026-06-26 14:20:41','',NULL,''),(1055,'任务详细',110,6,'#','','F','0','1','monitor:job:detail','#','admin','2026-06-26 14:20:41','',NULL,''),(1056,'任务导出',110,7,'#','','F','0','1','monitor:job:export','#','admin','2026-06-26 14:20:41','',NULL,''),(1057,'生成查询',115,1,'#','','F','0','1','tool:gen:list','#','admin','2026-06-26 14:20:41','',NULL,''),(1058,'生成修改',115,2,'#','','F','0','1','tool:gen:edit','#','admin','2026-06-26 14:20:41','',NULL,''),(1059,'生成删除',115,3,'#','','F','0','1','tool:gen:remove','#','admin','2026-06-26 14:20:41','',NULL,''),(1060,'预览代码',115,4,'#','','F','0','1','tool:gen:preview','#','admin','2026-06-26 14:20:41','',NULL,''),(1061,'生成代码',115,5,'#','','F','0','1','tool:gen:code','#','admin','2026-06-26 14:20:42','',NULL,''),(2000,'售后管理',0,1,'#','menuItem','M','0','1','','fa fa-wrench','admin','2026-06-26 17:24:05','admin','2026-06-26 17:24:34',''),(2001,'工单维护',2000,1,'/system/equipment','','C','0','1','system:equipment:view','#','admin','2026-06-26 21:55:38','',NULL,'工单维护菜单'),(2002,'工单维护查询',2001,1,'#','','F','0','1','system:equipment:list','#','admin','2026-06-26 21:55:39','',NULL,''),(2003,'工单维护新增',2001,2,'#','','F','0','1','system:equipment:add','#','admin','2026-06-26 21:55:39','',NULL,''),(2004,'工单维护修改',2001,3,'#','','F','0','1','system:equipment:edit','#','admin','2026-06-26 21:55:39','',NULL,''),(2005,'工单维护删除',2001,4,'#','','F','0','1','system:equipment:remove','#','admin','2026-06-26 21:55:39','',NULL,''),(2006,'工单维护导出',2001,5,'#','','F','0','1','system:equipment:export','#','admin','2026-06-26 21:55:39','',NULL,''),(2014,'售后服务',1,11,'/system/equipment','menuItem','C','0','1','system:equipment:view','fa fa-gavel','admin','2026-08-06 14:20:54','admin','2026-08-06 14:22:01',''),(2015,'维修过程',1,12,'/repair/process','menuItem','C','0','1','repair:process:view','#','admin','2026-08-06 14:48:03','admin','2026-08-06 14:50:18','维修过程菜单'),(2016,'维修过程查询',2015,1,'#','','F','0','1','repair:process:list','#','admin','2026-08-06 14:48:04','',NULL,''),(2017,'维修过程新增',2015,2,'#','','F','0','1','repair:process:add','#','admin','2026-08-06 14:48:04','',NULL,''),(2018,'维修过程修改',2015,3,'#','','F','0','1','repair:process:edit','#','admin','2026-08-06 14:48:04','',NULL,''),(2019,'维修过程删除',2015,4,'#','','F','0','1','repair:process:remove','#','admin','2026-08-06 14:48:04','',NULL,''),(2020,'维修过程导出',2015,5,'#','','F','0','1','repair:process:export','#','admin','2026-08-06 14:48:04','',NULL,''),(2100,'智域大脑',0,3,'#','','M','0','1','','fa fa-graduation-cap','admin','2026-08-24 21:35:14','',NULL,'智域大脑目录'),(2101,'游戏大厅',2100,1,'/brain','','C','0','1','brain:game:view','fa fa-gamepad','admin','2026-08-24 21:35:14','',NULL,'智力游戏大厅');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2026-06-26 14:21:17','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2026-06-26 14:21:17','',NULL,'管理员'),(3,'若依开源框架介绍','1',_binary '<p><span style=\"color: rgb(230, 0, 0);\">项目介绍</span></p><p><font color=\"#333333\">RuoYi开源项目是为企业用户定制的后台脚手架框架，为企业打造的一站式解决方案，降低企业开发成本，提升开发效率。主要包括用户管理、角色管理、部门管理、菜单管理、参数管理、字典管理、</font><span style=\"color: rgb(51, 51, 51);\">岗位管理</span><span style=\"color: rgb(51, 51, 51);\">、定时任务</span><span style=\"color: rgb(51, 51, 51);\">、</span><span style=\"color: rgb(51, 51, 51);\">服务监控、登录日志、操作日志、代码生成等功能。其中，还支持多数据源、数据权限、国际化、Redis缓存、Docker部署、滑动验证码、第三方认证登录、分布式事务、</span><font color=\"#333333\">分布式文件存储</font><span style=\"color: rgb(51, 51, 51);\">、分库分表处理等技术特点。</span></p><p><img src=\"https://foruda.gitee.com/images/1705030583977401651/5ed5db6a_1151004.png\" style=\"width: 64px;\"><br></p><p><span style=\"color: rgb(230, 0, 0);\">官网及演示</span></p><p><span style=\"color: rgb(51, 51, 51);\">若依官网地址：&nbsp;</span><a href=\"http://ruoyi.vip\" target=\"_blank\">http://ruoyi.vip</a><a href=\"http://ruoyi.vip\" target=\"_blank\"></a></p><p><span style=\"color: rgb(51, 51, 51);\">若依文档地址：&nbsp;</span><a href=\"http://doc.ruoyi.vip\" target=\"_blank\">http://doc.ruoyi.vip</a><br></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【不分离版】：&nbsp;</span><a href=\"http://demo.ruoyi.vip\" target=\"_blank\">http://demo.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【分离版本】：&nbsp;</span><a href=\"http://vue.ruoyi.vip\" target=\"_blank\">http://vue.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【微服务版】：&nbsp;</span><a href=\"http://cloud.ruoyi.vip\" target=\"_blank\">http://cloud.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【移动端版】：&nbsp;</span><a href=\"http://h5.ruoyi.vip\" target=\"_blank\">http://h5.ruoyi.vip</a></p><p><br style=\"color: rgb(48, 49, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12px;\"></p>','0','admin','2026-06-26 14:21:17','',NULL,'管理员'),(10,'名一样的人员开始屎上雕花','2',_binary '<p>开创屎上雕花的伟大创举</p>','0','admin','2026-08-09 13:12:08','',NULL,NULL);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_read`
--

DROP TABLE IF EXISTS `sys_notice_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_read` (
  `read_id` bigint NOT NULL AUTO_INCREMENT COMMENT '已读主键',
  `notice_id` int NOT NULL COMMENT '公告id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `read_time` datetime NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`read_id`),
  UNIQUE KEY `uk_user_notice` (`user_id`,`notice_id`) COMMENT '同一用户同一公告只记录一次'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='公告已读记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_read`
--

LOCK TABLES `sys_notice_read` WRITE;
/*!40000 ALTER TABLE `sys_notice_read` DISABLE KEYS */;
INSERT INTO `sys_notice_read` VALUES (1,3,1,'2026-08-09 00:34:21'),(2,2,1,'2026-08-09 00:34:28'),(3,1,1,'2026-08-09 00:34:34');
/*!40000 ALTER TABLE `sys_notice_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'操作日志',9,'com.ruoyi.web.controller.monitor.SysOperlogController.clean()','POST',1,'admin','研发部门','/monitor/operlog/clean','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-06 14:28:21',2131),(2,'登录日志',9,'com.ruoyi.web.controller.monitor.SysLogininforController.clean()','POST',1,'admin','研发部门','/monitor/logininfor/clean','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-06 14:28:32',1526),(3,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"repair_process\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-06 14:36:11',270),(4,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"repair_process\"],\"tableComment\":[\"维修过程\"],\"className\":[\"RepairProcess\"],\"functionAuthor\":[\"pengweitao\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"30\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"31\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"mainId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"32\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"过程图片\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"mediaFile\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"33\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"过程描述\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"mediaDesc\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"34\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"记录时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"recordTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"35\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"fileType\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"select\"],\"columns[5].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"business','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-06 14:41:36',283),(5,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"2\"],\"tableName\":[\"repair_equipment\"],\"tableComment\":[\"维修工单\"],\"className\":[\"RepairEquipment\"],\"functionAuthor\":[\"pengweitao\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"15\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"25\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"业务员\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"salename\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"16\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"板型\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"model\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"17\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"编号\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"sn\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"18\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"工单\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"dispatchImg\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"19\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"问题描述\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"faultDesc\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlTyp','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-06 14:42:03',266),(6,'代码生成',8,'com.ruoyi.generator.controller.GenController.download()','GET',1,'admin','研发部门','/tool/gen/download/repair_process','127.0.0.1','内网IP','\"repair_process\" ',NULL,0,NULL,'2026-08-06 14:46:06',117),(7,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2015\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"维修过程\"],\"url\":[\"/system/process\"],\"target\":[\"menuItem\"],\"perms\":[\"system:process:view\"],\"orderNum\":[\"12\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-06 14:50:18',254),(8,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"repair_process\"],\"tableComment\":[\"维修过程\"],\"className\":[\"RepairProcess\"],\"functionAuthor\":[\"pengweitao\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"30\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"31\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"mainId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"32\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"过程图片\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"mediaFile\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"33\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"过程描述\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"mediaDesc\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"34\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"记录时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"recordTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"35\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"fileType\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"select\"],\"columns[5].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.peng.repair\"],\"moduleName\":[\"system\"],\"businessN','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-06 14:53:35',328),(9,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"repair_process\"],\"tableComment\":[\"维修过程\"],\"className\":[\"RepairProcess\"],\"functionAuthor\":[\"pengweitao\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"30\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"31\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"mainId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"32\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"过程图片\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"mediaFile\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"upload\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"33\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"过程描述\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"mediaDesc\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"34\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"记录时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"recordTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"35\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"fileType\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"select\"],\"columns[5].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.peng.repair\"],\"moduleName\":[\"repair\"],\"businessN','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-06 14:57:04',195),(10,'代码生成',8,'com.ruoyi.generator.controller.GenController.download()','GET',1,'admin','研发部门','/tool/gen/download/repair_process','127.0.0.1','内网IP','\"repair_process\" ',NULL,0,NULL,'2026-08-06 14:57:11',120),(11,'维修过程',1,'com.peng.repair.controller.RepairProcessController.addSave()','POST',1,'admin','研发部门','/repair/process/add','127.0.0.1','内网IP','{\"mainId\":[\"\"],\"mediaFile\":[\"\"],\"mediaDesc\":[\"开始了\"],\"recordTime\":[\"2026-08-05\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-06 19:59:04',748),(12,'维修过程',2,'com.peng.repair.controller.RepairProcessController.editSave()','POST',1,'admin','研发部门','/repair/process/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"mediaFile\":[\"http://localhost:8080/profile/upload/2026/08/06/girl_beauty_20260806221229A001.jpeg\"],\"mediaDesc\":[\"小小妹花朵\"],\"recordTime\":[\"2026-08-06\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-06 22:13:06',224),(13,'维修过程',1,'com.peng.repair.controller.RepairProcessController.addSave()','POST',1,'admin','研发部门','/repair/process/add','127.0.0.1','内网IP','{\"mainId\":[\"1\"],\"mediaFile\":[\"http://localhost:8080/profile/upload/2026/08/09/house_20260809124932A002.png\"],\"mediaDesc\":[\"房间上虞了\"],\"recordTime\":[\"2026-08-09 12:47:17\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-09 12:49:59',546),(14,'维修过程',1,'com.peng.repair.controller.RepairProcessController.addSave()','POST',1,'admin','研发部门','/repair/process/add','127.0.0.1','内网IP','{\"mainId\":[\"1\"],\"mediaFile\":[\"http://localhost:8080/profile/upload/2026/08/09/girl_beauty_20260809130524A002.jpeg\"],\"mediaDesc\":[\"妹妹来来额\"],\"recordTime\":[\"2026-08-09 13:02:06\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-09 13:05:52',521),(15,'维修过程',1,'com.peng.repair.controller.RepairProcessController.addSave()','POST',1,'admin','研发部门','/repair/process/add','127.0.0.1','内网IP','{\"mainId\":[\"1\"],\"mediaFile\":[\"http://localhost:8080/profile/upload/2026/08/09/shishangdiaohua_20260809130718A003.jpeg\"],\"mediaDesc\":[\"屎上雕花\"],\"recordTime\":[\"2026-08-09 13:07:10\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-09 13:07:44',128),(16,'通知公告',1,'com.ruoyi.web.controller.system.SysNoticeController.addSave()','POST',1,'admin','研发部门','/system/notice/add','127.0.0.1','内网IP','{\"noticeTitle\":[\"名一样的人员开始屎上雕花\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<p>开创屎上雕花的伟大创举</p>\"],\"status\":[\"0\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-09 13:12:08',120),(17,'工单维护',1,'com.peng.repair.controller.RepairEquipmentController.addSave()','POST',1,'admin','研发部门','/system/equipment/add','127.0.0.1','内网IP','{\"model\":[\"BP120MV\"],\"sn\":[\"24558\"],\"dispatchImg\":[\"工单工单\"],\"faultDesc\":[\"问题描述\"],\"repairDesc\":[\"维修描述\"],\"faultReason\":[\"问题原因\"],\"summary\":[\"\"],\"orderTime\":[\"\"],\"startTime\":[\"\"],\"salename\":[\"张万磊/彤程电子材料\"],\"endTime\":[\"\"],\"quality\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-09 22:05:52',358),(18,'维修过程',0,'com.peng.repair.controller.RepairProcessController.process()','GET',1,'admin','研发部门','/repair/process','127.0.0.1','内网IP','','\"repair/process/process\"',0,NULL,'2026-08-10 22:04:50',107),(19,'维修过程',0,'com.peng.repair.controller.RepairProcessController.list()','POST',1,'admin','研发部门','/repair/process/list','127.0.0.1','内网IP','{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"isAsc\":[\"asc\"]}','{\"code\":0,\"rows\":[{\"faultDesc\":\"外露\",\"id\":1,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"quality\":1,\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料,\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":3,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":4,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"问题描述\",\"id\":5,\"model\":\"BP120MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"维修描述\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24558\",\"status\":1}],\"total\":4}',0,NULL,'2026-08-10 22:04:52',453),(20,'维修过程',0,'com.peng.repair.controller.RepairProcessController.finish()','GET',1,'admin','研发部门','/repair/process/finish','127.0.0.1','内网IP','{\"mainId\":[\"3\"]}','\"repair/process/finish\"',0,NULL,'2026-08-10 22:05:11',17),(21,'维修过程',0,'com.peng.repair.controller.RepairProcessController.finish()','GET',1,'admin','研发部门','/repair/process/finish','127.0.0.1','内网IP','{\"mainId\":[\"3\"]}','\"repair/process/finish\"',0,NULL,'2026-08-10 22:22:23',24),(22,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.update()','POST',1,'admin','研发部门','/system/user/profile/update','127.0.0.1','内网IP','{\"id\":[\"\"],\"userName\":[\"超主\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-10 22:30:46',386),(23,'维修过程',0,'com.peng.repair.controller.RepairProcessController.process()','GET',1,'admin','研发部门','/repair/process','127.0.0.1','内网IP','','\"repair/process/process\"',0,NULL,'2026-08-10 22:31:08',7),(24,'维修过程',0,'com.peng.repair.controller.RepairProcessController.list()','POST',1,'admin','研发部门','/repair/process/list','127.0.0.1','内网IP','{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"isAsc\":[\"asc\"]}','{\"code\":0,\"rows\":[{\"faultDesc\":\"外露\",\"id\":1,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"quality\":1,\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料,\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":3,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":4,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"问题描述\",\"id\":5,\"model\":\"BP120MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"维修描述\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24558\",\"status\":1}],\"total\":4}',0,NULL,'2026-08-10 22:31:09',305),(25,'维修过程',0,'com.peng.repair.controller.RepairProcessController.finish()','GET',1,'admin','研发部门','/repair/process/finish','127.0.0.1','内网IP','{\"mainId\":[\"4\"]}','\"repair/process/finish\"',0,NULL,'2026-08-10 22:31:11',29),(26,'维修完结',2,'com.peng.repair.controller.RepairProcessController.finishSave()','POST',1,'admin','研发部门','/repair/process/finishSave','127.0.0.1','内网IP','{\"id\":[\"4\"],\"faultReason\":[\"漏点腐蚀\"],\"causeDesc\":[\"漏点腐蚀了\"],\"faultTypeDesc\":[\"客户原因、运输原因、选型错误\"],\"repairDesc\":[\"\"],\"summary\":[\"补焊漏点\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-10 22:31:53',166),(27,'维修过程',0,'com.peng.repair.controller.RepairProcessController.process()','GET',1,'admin','研发部门','/repair/process','127.0.0.1','内网IP','','\"repair/process/process\"',0,NULL,'2026-08-10 23:01:54',145),(28,'维修过程',0,'com.peng.repair.controller.RepairProcessController.list()','POST',1,'admin','研发部门','/repair/process/list','127.0.0.1','内网IP','{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"isAsc\":[\"asc\"]}','{\"code\":0,\"rows\":[{\"faultDesc\":\"外露\",\"id\":1,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"quality\":1,\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料,\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":3,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":4,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"问题描述\",\"id\":5,\"model\":\"BP120MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"维修描述\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24558\",\"status\":1}],\"total\":4}',0,NULL,'2026-08-10 23:01:55',517),(29,'维修过程',0,'com.peng.repair.controller.RepairProcessController.finish()','GET',1,'admin','研发部门','/repair/process/finish','127.0.0.1','内网IP','{\"mainId\":[\"3\"]}','\"repair/process/finish\"',0,NULL,'2026-08-10 23:02:05',27),(30,'维修过程',0,'com.peng.repair.controller.RepairProcessController.finish()','GET',1,'admin','研发部门','/repair/process/finish','127.0.0.1','内网IP','{\"mainId\":[\"3\"]}','\"repair/process/finish\"',0,NULL,'2026-08-10 23:02:35',21),(31,'维修完结',2,'com.peng.repair.controller.RepairProcessController.finishSave()','POST',1,'admin','研发部门','/repair/process/finishSave','127.0.0.1','内网IP','{\"id\":[\"3\"],\"faultReason\":[\"缝隙腐蚀\"],\"causeDesc\":[\"缝隙腐蚀\"],\"faultTypeDesc\":[\"客户原因\"],\"repairDesc\":[\"\"],\"summary\":[\"补焊漏点\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-10 23:03:14',180),(32,'维修过程',0,'com.peng.repair.controller.RepairProcessController.finish()','GET',1,'admin','研发部门','/repair/process/finish','127.0.0.1','内网IP','{\"mainId\":[\"3\"]}','\"repair/process/finish\"',0,NULL,'2026-08-10 23:06:25',18),(33,'维修过程',0,'com.peng.repair.controller.RepairProcessController.process()','GET',1,'admin','研发部门','/repair/process','127.0.0.1','内网IP','','\"repair/process/process\"',0,NULL,'2026-08-10 23:18:26',273),(34,'维修过程',0,'com.peng.repair.controller.RepairProcessController.list()','POST',1,'admin','研发部门','/repair/process/list','127.0.0.1','内网IP','{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"isAsc\":[\"asc\"]}','{\"code\":0,\"rows\":[{\"faultDesc\":\"外露\",\"id\":1,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"quality\":1,\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料,\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":3,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"外露\",\"id\":4,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"问题描述\",\"id\":5,\"model\":\"BP120MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"维修描述\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24558\",\"status\":1}],\"total\":4}',0,NULL,'2026-08-10 23:18:26',480),(35,'维修过程',0,'com.peng.repair.controller.RepairProcessController.process()','GET',1,'admin','研发部门','/repair/process','127.0.0.1','内网IP','','\"repair/process/process\"',0,NULL,'2026-08-10 23:18:33',2),(36,'维修过程',0,'com.peng.repair.controller.RepairProcessController.list()','POST',1,'admin','研发部门','/repair/process/list','127.0.0.1','内网IP','{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"isAsc\":[\"asc\"]}','{\"code\":0,\"rows\":[{\"faultDesc\":\"外露\",\"id\":1,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"quality\":1,\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料,\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":3,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"外露\",\"id\":4,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"问题描述\",\"id\":5,\"model\":\"BP120MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"维修描述\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24558\",\"status\":1}],\"total\":4}',0,NULL,'2026-08-10 23:18:33',41),(37,'维修过程',0,'com.peng.repair.controller.RepairProcessController.finish()','GET',1,'admin','研发部门','/repair/process/finish','127.0.0.1','内网IP','{\"mainId\":[\"4\"]}','\"repair/process/finish\"',0,NULL,'2026-08-10 23:18:37',26),(38,'维修完结',2,'com.peng.repair.controller.RepairProcessController.finishSave()','POST',1,'admin','研发部门','/repair/process/finishSave','127.0.0.1','内网IP','{\"id\":[\"4\"],\"faultReason\":[\"外露\"],\"faultCauseId\":[\"3\"],\"faultType\":[\"3\"],\"faultTypeDesc\":[\"客户原因\"],\"causeDesc\":[\"缝隙腐蚀\"],\"repairDesc\":[\"\"],\"summary\":[\"【工单信息】板型：BP100MV，编号：24557，问题描述：外露\\n【维修过程记录】\\n1. 2026-05-25 09:50 拆开清洗，准备维修\\n2. 2026-05-15 10:56 腐蚀，焊缝开裂\\n\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-10 23:19:27',165),(39,'维修过程',0,'com.peng.repair.controller.RepairProcessController.finish()','GET',1,'admin','研发部门','/repair/process/finish','127.0.0.1','内网IP','{\"mainId\":[\"4\"]}','\"repair/process/finish\"',0,NULL,'2026-08-10 23:20:32',25),(40,'维修过程',0,'com.peng.repair.controller.RepairProcessController.process()','GET',1,'admin','研发部门','/repair/process','127.0.0.1','内网IP','','\"repair/process/process\"',0,NULL,'2026-08-11 00:16:08',0),(41,'维修过程',0,'com.peng.repair.controller.RepairProcessController.list()','POST',1,'admin','研发部门','/repair/process/list','127.0.0.1','内网IP','{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"isAsc\":[\"asc\"]}','{\"code\":0,\"rows\":[{\"faultDesc\":\"外露\",\"id\":1,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"quality\":1,\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料,\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":3,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"外露\",\"id\":4,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"问题描述\",\"id\":5,\"model\":\"BP120MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"维修描述\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24558\",\"status\":1}],\"total\":4}',0,NULL,'2026-08-11 00:16:08',42),(42,'维修过程',0,'com.peng.repair.controller.RepairProcessController.process()','GET',1,'admin','研发部门','/repair/process','127.0.0.1','内网IP','','\"repair/process/process\"',0,NULL,'2026-08-20 22:11:33',178),(43,'维修过程',0,'com.peng.repair.controller.RepairProcessController.list()','POST',1,'admin','研发部门','/repair/process/list','127.0.0.1','内网IP','{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"isAsc\":[\"asc\"]}','{\"code\":0,\"rows\":[{\"faultDesc\":\"外露\",\"id\":1,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"quality\":1,\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料,\",\"sn\":\"24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":3,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"外露\",\"id\":4,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"问题描述\",\"id\":5,\"model\":\"BP120MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"维修描述\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24558\",\"status\":1}],\"total\":4}',0,NULL,'2026-08-20 22:11:33',355),(44,'工单维护',2,'com.peng.repair.controller.RepairEquipmentController.editSave()','POST',1,'admin','研发部门','/system/equipment/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"model\":[\"BP100MV\"],\"sn\":[\"完整编号24557\"],\"dispatchImg\":[\"\"],\"faultDesc\":[\"外露\"],\"repairDesc\":[\"更换垫片\"],\"faultReason\":[\"1\"],\"summary\":[\"客户名称，地址，联系人，电话\"],\"orderTime\":[\"2026-06-27\"],\"startTime\":[\"\"],\"salename\":[\"张万磊/彤程电子材料,\"],\"endTime\":[\"\"],\"quality\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-21 10:35:26',264),(45,'工单维护',1,'com.peng.repair.controller.RepairEquipmentController.addSave()','POST',1,'admin','研发部门','/system/equipment/add','127.0.0.1','内网IP','{\"salename\":[\"王哈绕\"],\"client\":[\"四川罗布泊化工\"],\"clientAdd\":[\"法国原装进口\"],\"connection\":[\"法拉米\"],\"model\":[\"BP100MV\"],\"sn\":[\"250024\"],\"faultDesc\":[\"呲牙呲牙的\"],\"quality\":[\"1\"],\"dispatchImg\":[\"\"],\"repairDesc\":[\"\"],\"faultReason\":[\"\"],\"summary\":[\"\"],\"orderTime\":[\"\"],\"startTime\":[\"\"],\"endTime\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-21 23:19:09',624),(46,'维修过程',0,'com.peng.repair.controller.RepairProcessController.process()','GET',1,'admin','研发部门','/repair/process','192.168.66.245','内网IP','','\"repair/process/process\"',0,NULL,'2026-08-22 22:19:28',128),(47,'维修过程',0,'com.peng.repair.controller.RepairProcessController.list()','POST',1,'admin','研发部门','/repair/process/list','192.168.66.245','内网IP','{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"isAsc\":[\"asc\"]}','{\"code\":0,\"rows\":[{\"faultDesc\":\"外露\",\"id\":1,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"quality\":1,\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料,\",\"sn\":\"完整编号24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":3,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"外露\",\"id\":4,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"问题描述\",\"id\":5,\"model\":\"BP120MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"维修描述\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24558\",\"status\":1},{\"faultDesc\":\"呲牙呲牙的\",\"id\":6,\"model\":\"BP100MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"\",\"salename\":\"王哈绕\",\"sn\":\"250024\",\"status\":1}],\"total\":5}',0,NULL,'2026-08-22 22:19:29',162),(48,'维修过程',0,'com.peng.repair.controller.RepairProcessController.view()','GET',1,'admin','研发部门','/repair/process/view/6','192.168.66.245','内网IP','6 {\"processList\":[{\"fileType\":\"photo\",\"id\":9,\"mainId\":6,\"mediaDesc\":\"后，结束了。封堵两条流到\",\"mediaFile\":\"1779876808644_cat.jpeg\",\"params\":{},\"recordTime\":1779876809000}]} ','\"repair/process/view\"',0,NULL,'2026-08-22 22:19:41',85),(49,'维修过程',0,'com.peng.repair.controller.RepairProcessController.view()','GET',1,'admin','研发部门','/repair/process/view/5','192.168.66.245','内网IP','5 {\"processList\":[{\"fileType\":\"photo\",\"id\":5,\"mainId\":5,\"mediaDesc\":\"等待业务员下单更换胶套\",\"mediaFile\":\"1779673336886_tmp_img.png\",\"params\":{},\"recordTime\":1779673337000},{\"fileType\":\"photo\",\"id\":4,\"mainId\":5,\"mediaDesc\":\"装好打压，不漏，有一条胶垫外漏\",\"mediaFile\":\"1778814776583_mmexport1778814724573.jpg\",\"params\":{},\"recordTime\":1778814777000}]} ','\"repair/process/view\"',0,NULL,'2026-08-22 22:19:48',4),(50,'维修过程',0,'com.peng.repair.controller.RepairProcessController.view()','GET',1,'admin','研发部门','/repair/process/view/3','192.168.66.245','内网IP','3 {\"processList\":[]} ','\"repair/process/view\"',0,NULL,'2026-08-22 22:19:51',4),(51,'维修过程',0,'com.peng.repair.controller.RepairProcessController.view()','GET',1,'admin','研发部门','/repair/process/view/1','192.168.66.245','内网IP','1 {\"processList\":[{\"id\":16,\"mainId\":1,\"mediaDesc\":\"屎上雕花\",\"mediaFile\":\"http://localhost:8080/profile/upload/2026/08/09/shishangdiaohua_20260809130718A003.jpeg\",\"params\":{},\"recordTime\":1786252030000},{\"id\":15,\"mainId\":1,\"mediaDesc\":\"妹妹来来额\",\"mediaFile\":\"http://localhost:8080/profile/upload/2026/08/09/girl_beauty_20260809130524A002.jpeg\",\"params\":{},\"recordTime\":1786251726000},{\"id\":14,\"mainId\":1,\"mediaDesc\":\"房间上虞了\",\"mediaFile\":\"http://localhost:8080/profile/upload/2026/08/09/house_20260809124932A002.png\",\"params\":{},\"recordTime\":1786250837000}]} ','\"repair/process/view\"',0,NULL,'2026-08-22 22:19:53',7),(52,'维修过程',0,'com.peng.repair.controller.RepairProcessController.view()','GET',1,'admin','研发部门','/repair/process/view/1','192.168.66.245','内网IP','1 {\"processList\":[{\"id\":16,\"mainId\":1,\"mediaDesc\":\"屎上雕花\",\"mediaFile\":\"http://localhost:8080/profile/upload/2026/08/09/shishangdiaohua_20260809130718A003.jpeg\",\"params\":{},\"recordTime\":1786252030000},{\"id\":15,\"mainId\":1,\"mediaDesc\":\"妹妹来来额\",\"mediaFile\":\"http://localhost:8080/profile/upload/2026/08/09/girl_beauty_20260809130524A002.jpeg\",\"params\":{},\"recordTime\":1786251726000},{\"id\":14,\"mainId\":1,\"mediaDesc\":\"房间上虞了\",\"mediaFile\":\"http://localhost:8080/profile/upload/2026/08/09/house_20260809124932A002.png\",\"params\":{},\"recordTime\":1786250837000}]} ','\"repair/process/view\"',0,NULL,'2026-08-22 22:20:01',4),(53,'工单维护',6,'com.peng.repair.controller.RepairEquipmentController.importData()','POST',1,'admin','研发部门','/system/equipment/import','192.168.66.245','内网IP','{\"data\":[\"{\\n    \\\"id\\\": \\\"211436720782\\\",\\n    \\\"index\\\": 1,\\n    \\\"消息主题\\\": \\\"售后服务\\\",\\n    \\\"消息内容\\\": \\\"王善芹提交了“外派现场维修”的审批申请，请及时处理\\\",\\n    \\\"关联数据\\\": \\\"外派现场维修\\\",\\n    \\\"关联数据-metaName\\\": \\\"CustomObject1014__c\\\",\\n    \\\"关联数据-metaId\\\": 201121306707,\\n    \\\"关联数据-code\\\": \\\"211433943277\\\",\\n    \\\"提交人\\\": \\\"王善芹\\\",\\n    \\\"创建时间\\\": \\\"2026年08月10日 13:19\\\",\\n    \\\"状态\\\": \\\"未处理\\\",\\n    \\\"售后服务名称\\\": \\\"外派现场维修\\\",\\n    \\\"出厂编号\\\": \\\"保外\\\",\\n    \\\"售后服务客户名称\\\": \\\"浙江贝得药业有限公司\\\",\\n    \\\"质保期\\\": \\\"质保期外\\\",\\n    \\\"所属部门\\\": \\\"南方客服部\\\",\\n    \\\"负责人\\\": \\\"王善芹\\\",\\n    \\\"附件类型\\\": \\\"售后服务派工单\\\",\\n    \\\"附件\\\": \\\"派工浙江贝得药业8-10.jpg\\\",\\n    \\\"备注\\\": \\\"-----\\\",\\n    \\\"设备故障分析报告\\\": \\\"-----\\\",\\n    \\\"创建人\\\": \\\"王善芹\\\",\\n    \\\"修改人\\\": \\\"孟庆杰\\\",\\n    \\\"修改时间\\\": \\\"2026年08月10日 17:39\\\"\\n  }\"]}','{\"msg\":\"导入数据格式不正确，请使用 JSON 数组格式，如 [{\\\"sn\\\":\\\"SN001\\\",\\\"salename\\\":\\\"张三\\\",...}]\",\"code\":500}',0,NULL,'2026-08-23 22:31:54',203),(54,'工单维护',1,'com.peng.repair.controller.RepairEquipmentController.addSave()','POST',1,'admin','研发部门','/system/equipment/add','192.168.66.245','内网IP','{\"salename\":[\"\"],\"client\":[\"\"],\"clientAdd\":[\"\"],\"connection\":[\"\"],\"model\":[\"\"],\"sn\":[\"\"],\"faultDesc\":[\"\"],\"quality\":[\"\"],\"dispatchImg\":[\"\"],\"repairDesc\":[\"\"],\"faultReason\":[\"\"],\"summary\":[\"\"],\"orderTime\":[\"\"],\"startTime\":[\"\"],\"endTime\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2026-08-23 22:50:34',575),(55,'维修过程',0,'com.peng.repair.controller.RepairProcessController.process()','GET',1,'admin','研发部门','/repair/process','192.168.66.245','内网IP','','\"repair/process/process\"',0,NULL,'2026-08-23 23:34:51',218),(56,'维修过程',0,'com.peng.repair.controller.RepairProcessController.list()','POST',1,'admin','研发部门','/repair/process/list','192.168.66.245','内网IP','{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"isAsc\":[\"asc\"]}','{\"code\":0,\"rows\":[{\"faultDesc\":\"外露\",\"id\":1,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"quality\":1,\"repairDesc\":\"更换垫片\",\"salename\":\"张万磊/彤程电子材料,\",\"sn\":\"完整编号24557\",\"status\":1},{\"faultDesc\":\"外露\",\"id\":3,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"外露\",\"id\":4,\"model\":\"BP100MV\",\"orderTime\":1782489600000,\"params\":{},\"repairDesc\":\"\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24557\",\"status\":3},{\"faultDesc\":\"问题描述\",\"id\":5,\"model\":\"BP120MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"维修描述\",\"salename\":\"张万磊/彤程电子材料\",\"sn\":\"24558\",\"status\":1},{\"faultDesc\":\"呲牙呲牙的\",\"id\":6,\"model\":\"BP100MV\",\"params\":{},\"quality\":1,\"repairDesc\":\"\",\"salename\":\"王哈绕\",\"sn\":\"250024\",\"status\":1},{\"faultDesc\":\"\",\"id\":7,\"model\":\"\",\"params\":{},\"repairDesc\":\"\",\"salename\":\"\",\"sn\":\"\",\"status\":1}],\"total\":6}',0,NULL,'2026-08-23 23:34:51',231);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2026-06-26 14:20:29','',NULL,''),(2,'se','项目经理',2,'0','admin','2026-06-26 14:20:29','',NULL,''),(3,'hr','人力资源',3,'0','admin','2026-06-26 14:20:29','',NULL,''),(4,'user','普通员工',4,'0','admin','2026-06-26 14:20:29','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1','0','0','admin','2026-06-26 14:20:31','',NULL,'超级管理员'),(2,'普通角色','common',2,'2','0','0','admin','2026-06-26 14:20:31','',NULL,'普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,1061);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','超主','00','ry@163.com','15888888888','1','/profile/avatar/2026/06/27/67f389f6fa1d4c5b97da747b7f24ff12.png','29c67a30398638269fe600f73a054934','111111','0','0','192.168.66.245','2026-08-24 22:44:51',NULL,'admin','2026-06-26 14:20:27','','2026-08-10 22:30:45','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','8e6d98b90472783cc73c17047ddccf36','222222','0','0','127.0.0.1',NULL,NULL,'admin','2026-06-26 14:20:27','',NULL,'测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int DEFAULT '0' COMMENT '超时时间，单位为分钟',
  `session_data` blob COMMENT '序列化的Session数据，用于服务重启后恢复会话',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='在线用户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_dept`
--

DROP TABLE IF EXISTS `u_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `u_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_dept`
--

LOCK TABLES `u_dept` WRITE;
/*!40000 ALTER TABLE `u_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_dept` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-25 17:46:25
