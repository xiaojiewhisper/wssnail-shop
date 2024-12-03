package com.wssnail.api.result;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;

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
@ApiModel(value="Product对象", description="")
@Builder
public class ProductResult implements Serializable {

    private static final long serialVersionUID = 1L;

    private String productName;

    private String productTitle;

    private String productImg;

    private String productDetail;

    private BigDecimal productPrice;

    @ApiModelProperty(value = "剩余库存量")
    private Integer num;


}
