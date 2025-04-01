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
 * 仓管用户：(WarehouseManagementUser)表实体类
 *
 */
@TableName("`warehouse_management_user`")
@Data
@EqualsAndHashCode(callSuper = false)
public class WarehouseManagementUser implements Serializable {

    // WarehouseManagementUser编号
    @TableId(value = "warehouse_management_user_id", type = IdType.AUTO)
    private Integer warehouse_management_user_id;

    // 仓管人员
    @TableField(value = "`warehouse_management_personnel`")
    private String warehouse_management_personnel;







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
