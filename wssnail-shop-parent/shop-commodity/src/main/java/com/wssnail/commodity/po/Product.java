package com.wssnail.commodity.po;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
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
 * @since 2024-11-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("tb_product")
@ApiModel(value="Product对象", description="")
@Builder
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private String productName;

    private String productTitle;

    private String productImg;

    private String productDetail;

    private BigDecimal productPrice;

    @ApiModelProperty(value = "剩余库存量")
    private Integer num;


}
