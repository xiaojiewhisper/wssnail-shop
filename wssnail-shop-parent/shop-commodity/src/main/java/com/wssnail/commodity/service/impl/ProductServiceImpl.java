package com.wssnail.commodity.service.impl;

import com.wssnail.commodity.mapper.ProductMapper;
import com.wssnail.commodity.po.Product;
import com.wssnail.commodity.service.ProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author snail
 * @since 2024-11-07
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

}
