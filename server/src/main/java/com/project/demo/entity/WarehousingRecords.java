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
 * 入库记录：(WarehousingRecords)表实体类
 *
 */
@TableName("`warehousing_records`")
@Data
@EqualsAndHashCode(callSuper = false)
public class WarehousingRecords implements Serializable {

    // WarehousingRecords编号
    @TableId(value = "warehousing_records_id", type = IdType.AUTO)
    private Integer warehousing_records_id;

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
    // 生产厂家
    @TableField(value = "`manufacturer`")
    private String manufacturer;
    // 生产日期
    @TableField(value = "`date_of_manufacture`")
    private String date_of_manufacture;
    // 失效日期
    @TableField(value = "`expiration_date`")
    private String expiration_date;
    // 入库数量
    @TableField(value = "`receipt_quantity`")
    private Integer receipt_quantity;










    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
