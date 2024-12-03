package com.wssnail.order.service.impl;


import com.wssnail.api.feign.ProductFeignClient;
import com.wssnail.common.web.Result;
import com.wssnail.order.dto.OrderInfoDto;
import com.wssnail.order.mapper.OrderInfoMapper;
import com.wssnail.order.po.OrderInfo;
import com.wssnail.order.service.OrderInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author snail
 * @since 2024-11-07
 */
@Service
@Slf4j
public class OrderInfoServiceImpl extends ServiceImpl<OrderInfoMapper, OrderInfo> implements OrderInfoService {

    @Autowired
    private ProductFeignClient productFeignClient;
    @Autowired
    private OrderInfoMapper orderInfoMapper;
    @Override
    public String saveOrder(OrderInfoDto orderInfoDto) {
        String orderNo = UUID.randomUUID().toString();
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setOrderNo(orderNo);
        orderInfo.setUserId(orderInfoDto.getUserId());
        orderInfo.setProductId(orderInfoDto.getProductId());
        orderInfo.setProductImg(orderInfoDto.getProductImg());
        orderInfo.setProductName(orderInfoDto.getProductName());
        orderInfo.setPayDate(new Date());
        orderInfo.setProductPrice(orderInfoDto.getProductPrice());
        orderInfoMapper.insert(orderInfo);
        //扣减库存
        Result<Void> result = productFeignClient.reduceProduct(orderInfoDto.getProductCount(), orderInfoDto.getProductId());
        if (result.getCode()==200){
            log.info("库存扣减成功");
        }
        return orderNo;
    }
}
