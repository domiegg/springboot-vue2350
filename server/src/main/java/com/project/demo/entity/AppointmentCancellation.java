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
 * 预约取消：(AppointmentCancellation)表实体类
 *
 */
@TableName("`appointment_cancellation`")
@Data
@EqualsAndHashCode(callSuper = false)
public class AppointmentCancellation implements Serializable {

    // AppointmentCancellation编号
    @TableId(value = "appointment_cancellation_id", type = IdType.AUTO)
    private Integer appointment_cancellation_id;

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
    // 用户姓名
    @TableField(value = "`user_name`")
    private Integer user_name;
    // 预约时间
    @TableField(value = "`time_of_appointment`")
    private String time_of_appointment;
    // 取消数量
    @TableField(value = "`cancel_quantity`")
    private String cancel_quantity;
    // 电话
    @TableField(value = "`telephone`")
    private String telephone;
    // 取消原因
    @TableField(value = "`reason_for_cancellation`")
    private String reason_for_cancellation;










    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
