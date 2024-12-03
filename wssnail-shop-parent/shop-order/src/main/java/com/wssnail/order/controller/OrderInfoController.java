package com.wssnail.order.controller;


import com.wssnail.common.web.Result;
import com.wssnail.order.dto.OrderInfoDto;
import com.wssnail.order.service.OrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
@RequestMapping("/orderInfo")
public class OrderInfoController {

    @Autowired
    private OrderInfoService orderInfoService;

    @PostMapping("/saveOrder")
    public Result saveOrder(@RequestBody OrderInfoDto orderInfoDto) {
       return  Result.success(orderInfoService.saveOrder(orderInfoDto));
    }
}

