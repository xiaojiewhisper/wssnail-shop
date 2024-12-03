package com.wssnail.order.po;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author snail
 * @since 2024-11-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("tb_order_info")
@ApiModel(value="OrderInfo对象", description="")
public class OrderInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String orderNo;

    private Long userId;

    private Long productId;

    private String productImg;

    private Long deliveryAddrId;

    private String productName;

    private Integer productCount;

    private BigDecimal productPrice;

    private BigDecimal seckillPrice;

    private Integer status;

    private Date createDate;

    private Date payDate;

    private Date seckillDate;

    private Integer sekillTime;

    private BigDecimal intergral;

    private Long seckillId;

    private Integer payType;


}
