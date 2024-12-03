package com.wssnail.commodity.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wssnail.common.web.Result;
import com.wssnail.commodity.po.Product;
import com.wssnail.commodity.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author snail
 * @since 2024-11-07
 */
@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/page/{pageNo}")
    public Result page(@PathVariable  int pageNo){
        Page<Product> result = productService.page(new Page<>(pageNo,10));
        return Result.success(result);

    }
}

