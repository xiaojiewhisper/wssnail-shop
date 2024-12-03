package com.wssnail.uaa.po;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author snail
 * @since 2024-11-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("tb_login_log")
@ApiModel(value="LoginLog对象", description="")
@Builder
public class LoginLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "登录人id")
    private Integer userId;

    @ApiModelProperty(value = "ip")
    private String logIp;

    @ApiModelProperty(value = "登陆时间")
    private Date loginTime;

}
