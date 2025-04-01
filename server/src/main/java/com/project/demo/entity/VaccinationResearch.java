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
 * 接种调研：(VaccinationResearch)表实体类
 *
 */
@TableName("`vaccination_research`")
@Data
@EqualsAndHashCode(callSuper = false)
public class VaccinationResearch implements Serializable {

    // VaccinationResearch编号
    @TableId(value = "vaccination_research_id", type = IdType.AUTO)
    private Integer vaccination_research_id;

    // 预约编号
    @TableField(value = "`appointment_number`")
    private String appointment_number;
    // 疫苗名称
    @TableField(value = "`vaccine_name`")
    private String vaccine_name;
    // 疫苗分类
    @TableField(value = "`vaccine_classification`")
    private String vaccine_classification;
    // 用户姓名
    @TableField(value = "`user_name`")
    private Integer user_name;
    // 电话
    @TableField(value = "`telephone`")
    private String telephone;
    // 接种工作人员
    @TableField(value = "`vaccination_staff`")
    private Integer vaccination_staff;
    // 接种异常
    @TableField(value = "`abnormal_vaccination`")
    private String abnormal_vaccination;
    // 接种后反应
    @TableField(value = "`post_vaccination_reaction`")
    private String post_vaccination_reaction;










    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
