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
 * 可预约地点：(BookableLocation)表实体类
 *
 */
@TableName("`bookable_location`")
@Data
@EqualsAndHashCode(callSuper = false)
public class BookableLocation implements Serializable {

    // BookableLocation编号
    @TableId(value = "bookable_location_id", type = IdType.AUTO)
    private Integer bookable_location_id;

    // 可预约地点
    @TableField(value = "`bookable_location`")
    private String bookable_location;










    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
