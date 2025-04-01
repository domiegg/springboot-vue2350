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
 * 疫苗库存：(VaccineInventory)表实体类
 *
 */
@TableName("`vaccine_inventory`")
@Data
@EqualsAndHashCode(callSuper = false)
public class VaccineInventory implements Serializable {

    // VaccineInventory编号
    @TableId(value = "vaccine_inventory_id", type = IdType.AUTO)
    private Integer vaccine_inventory_id;

    // 图片
    @TableField(value = "`picture`")
    private String picture;
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
    // 库存数量
    @TableField(value = "`inventory_quantity`")
    private Integer inventory_quantity;
    // 生产厂家
    @TableField(value = "`manufacturer`")
    private String manufacturer;
    // 生产日期
    @TableField(value = "`date_of_manufacture`")
    private Timestamp date_of_manufacture;
    // 失效日期
    @TableField(value = "`expiration_date`")
    private Timestamp expiration_date;
    // 存放位置
    @TableField(value = "`storage_location`")
    private String storage_location;
    // 存放要求
    @TableField(value = "`storage_requirements`")
    private String storage_requirements;










    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
