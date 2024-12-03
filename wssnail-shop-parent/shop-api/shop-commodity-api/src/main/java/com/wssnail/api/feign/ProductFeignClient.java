package com.wssnail.api.feign;

import com.wssnail.api.result.ProductResult;
import com.wssnail.common.web.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient(value = "shop-product", contextId = "shop")
public interface ProductFeignClient {

    @RequestMapping(value = {"/getProductById/{productId}"}, method = {RequestMethod.GET}, produces = {"application/json; charset=UTF-8"})
    Result<ProductResult> getProductById(@PathVariable Long productId);


    @RequestMapping(value = {"/reduceProduct/{num}/{productId}"}, method = {RequestMethod.GET}, produces = {"application/json; charset=UTF-8"})
    Result<Void> reduceProduct(@PathVariable("num") Integer num ,@PathVariable("productId") Long productId);
}
