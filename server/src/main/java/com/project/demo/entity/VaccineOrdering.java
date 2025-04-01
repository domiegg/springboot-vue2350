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
 * 疫苗订购：(VaccineOrdering)表实体类
 *
 */
@TableName("`vaccine_ordering`")
@Data
@EqualsAndHashCode(callSuper = false)
public class VaccineOrdering implements Serializable {

    // VaccineOrdering编号
    @TableId(value = "vaccine_ordering_id", type = IdType.AUTO)
    private Integer vaccine_ordering_id;

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
    // 生产厂家
    @TableField(value = "`manufacturer`")
    private String manufacturer;
    // 订购数量
    @TableField(value = "`order_quantity`")
    private Integer order_quantity;
    // 目前状态
    @TableField(value = "`current_status`")
    private String current_status;
    // 订购日期
    @TableField(value = "`subscription_date`")
    private Timestamp subscription_date;
    // 发货日期
    @TableField(value = "`the_date_of_issuance`")
    private Timestamp the_date_of_issuance;
    // 预计到达
    @TableField(value = "`expected_arrival`")
    private Timestamp expected_arrival;
    // 发货厂家
    @TableField(value = "`shipping_manufacturer`")
    private String shipping_manufacturer;
    // 送货地址
    @TableField(value = "`delivery_address`")
    private String delivery_address;










    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
