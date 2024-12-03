package com.wssnail.order.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

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
@ApiModel(value="OrderInfo对象", description="")
public class OrderInfoDto implements Serializable {

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
