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
 * 疫苗分类：(VaccineClassification)表实体类
 *
 */
@TableName("`vaccine_classification`")
@Data
@EqualsAndHashCode(callSuper = false)
public class VaccineClassification implements Serializable {

    // VaccineClassification编号
    @TableId(value = "vaccine_classification_id", type = IdType.AUTO)
    private Integer vaccine_classification_id;

    // 疫苗分类
    @TableField(value = "`vaccine_classification`")
    private String vaccine_classification;










    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
