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
 * 接种人员：(VaccinationPersonnel)表实体类
 *
 */
@TableName("`vaccination_personnel`")
@Data
@EqualsAndHashCode(callSuper = false)
public class VaccinationPersonnel implements Serializable {

    // VaccinationPersonnel编号
    @TableId(value = "vaccination_personnel_id", type = IdType.AUTO)
    private Integer vaccination_personnel_id;

    // 接种工作人员
    @TableField(value = "`vaccination_staff`")
    private String vaccination_staff;







    // 用户编号
    @TableField(value = "user_id")
    private Integer userId;



    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
