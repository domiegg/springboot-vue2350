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
 * 疫苗预约：(VaccineAppointment)表实体类
 *
 */
@TableName("`vaccine_appointment`")
@Data
@EqualsAndHashCode(callSuper = false)
public class VaccineAppointment implements Serializable {

    // VaccineAppointment编号
    @TableId(value = "vaccine_appointment_id", type = IdType.AUTO)
    private Integer vaccine_appointment_id;

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
    // 生产厂家
    @TableField(value = "`manufacturer`")
    private String manufacturer;
    // 适合人群
    @TableField(value = "`suitable_for_people`")
    private String suitable_for_people;
    // 可预约时间
    @TableField(value = "`bookable_time`")
    private String bookable_time;
    // 可预约地点
    @TableField(value = "`bookable_location`")
    private String bookable_location;
    // 可预约数量
    @TableField(value = "`bookable_quantity`")
    private Integer bookable_quantity;
    // 注意事项
    @TableField(value = "`matters_needing_attention`")
    private String matters_needing_attention;

    // 点击数
    @TableField(value = "hits")
    private Integer hits;









    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
