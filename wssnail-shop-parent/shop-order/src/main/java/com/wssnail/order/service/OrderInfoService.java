package com.wssnail.order.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.wssnail.order.dto.OrderInfoDto;
import com.wssnail.order.po.OrderInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author snail
 * @since 2024-11-07
 */
public interface OrderInfoService extends IService<OrderInfo> {

    String  saveOrder(OrderInfoDto orderInfoDto);

}
