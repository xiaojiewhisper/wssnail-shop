package com.wssnail.commodity.feign;

import cn.hutool.core.bean.BeanUtil;
import com.wssnail.api.feign.ProductFeignClient;
import com.wssnail.api.result.ProductResult;
import com.wssnail.commodity.po.Product;
import com.wssnail.commodity.service.ProductService;
import com.wssnail.common.web.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductFeignController implements ProductFeignClient {

    @Autowired
    private ProductService productService;

    @Override
    public Result<ProductResult> getProductById(Long productId) {
        Product product = productService.getById(productId);
        ProductResult productResult = BeanUtil.copyProperties(product, ProductResult.class);
        return Result.success(productResult);
    }

    @Override
    public Result<Void> reduceProduct(Integer num, Long productId) {
        Product dbProduct = productService.getById(productId);
        dbProduct.setNum(dbProduct.getNum()-num);
        productService.updateById(dbProduct);
        return Result.success(null);
    }
}
