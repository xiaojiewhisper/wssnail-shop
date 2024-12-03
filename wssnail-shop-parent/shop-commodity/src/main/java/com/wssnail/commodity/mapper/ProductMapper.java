package com.wssnail.commodity.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wssnail.commodity.po.Product;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author snail
 * @since 2024-11-07
 */
@Mapper
public interface ProductMapper extends BaseMapper<Product> {

}
