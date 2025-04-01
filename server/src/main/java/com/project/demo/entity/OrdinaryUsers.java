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
 * 普通用户：(OrdinaryUsers)表实体类
 *
 */
@TableName("`ordinary_users`")
@Data
@EqualsAndHashCode(callSuper = false)
public class OrdinaryUsers implements Serializable {

    // OrdinaryUsers编号
    @TableId(value = "ordinary_users_id", type = IdType.AUTO)
    private Integer ordinary_users_id;

    // 用户姓名
    @TableField(value = "`user_name`")
    private String user_name;
    // 性别
    @TableField(value = "`gender`")
    private String gender;
    // 年龄
    @TableField(value = "`age`")
    private Integer age;







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
