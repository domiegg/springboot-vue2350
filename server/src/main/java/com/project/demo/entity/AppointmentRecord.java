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
 * 预约记录：(AppointmentRecord)表实体类
 *
 */
@TableName("`appointment_record`")
@Data
@EqualsAndHashCode(callSuper = false)
public class AppointmentRecord implements Serializable {

    // AppointmentRecord编号
    @TableId(value = "appointment_record_id", type = IdType.AUTO)
    private Integer appointment_record_id;

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
    private Timestamp time_of_appointment;
    // 预约数量
    @TableField(value = "`number_of_appointments`")
    private String number_of_appointments;
    // 用户姓名
    @TableField(value = "`user_name`")
    private Integer user_name;
    // 电话
    @TableField(value = "`telephone`")
    private String telephone;










    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
