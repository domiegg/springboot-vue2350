package com.project.demo.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 接种记录：(VaccinationRecords)表实体类
 *
 */
@TableName("`vaccination_records`")
@Data
@EqualsAndHashCode(callSuper = false)
public class VaccinationRecords implements Serializable {

    // VaccinationRecords编号
    @TableId(value = "vaccination_records_id", type = IdType.AUTO)
    private Integer vaccination_records_id;

    // 预约编号
    @TableField(value = "`appointment_number`")
    private String appointment_number;
    // 疫苗编号
    @TableField(value = "`vaccine_no`")
    private String vaccine_no;
    // 疫苗名称
    @TableField(value = "`vaccine_name`")
    private String vaccine_name;
    // 疫苗分类
    @TableField(value = "`vaccine_classification`")
    private String vaccine_classification;
    // 适合人群
    @TableField(value = "`suitable_for_people`")
    private String suitable_for_people;
    // 可预约地点
    @TableField(value = "`bookable_location`")
    private String bookable_location;
    // 预约时间
    @TableField(value = "`time_of_appointment`")
    private String time_of_appointment;
    // 用户姓名
    @TableField(value = "`user_name`")
    private Integer user_name;
    // 电话
    @TableField(value = "`telephone`")
    private String telephone;
    // 接种工作人员
    @TableField(value = "`vaccination_staff`")
    private Integer vaccination_staff;
    // 注意事项
    @TableField(value = "`matters_needing_attention`")
    private String matters_needing_attention;










    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
