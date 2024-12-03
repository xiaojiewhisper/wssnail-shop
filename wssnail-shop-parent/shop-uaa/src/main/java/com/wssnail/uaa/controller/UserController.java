package com.wssnail.uaa.controller;


import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.wssnail.common.web.Result;
import com.wssnail.uaa.dto.UserDto;
import com.wssnail.uaa.po.LoginLog;
import com.wssnail.uaa.po.User;
import com.wssnail.uaa.service.UserService;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.UUID;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author snail
 * @since 2024-11-06
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired(required = false)
    private RocketMQTemplate rocketMQTemplate;

    @PostMapping("/login")
    Result login(@RequestBody UserDto dto){
        User user = userService.getOne(new LambdaQueryWrapper<User>().eq(User::getPhone,dto
                .getPhone()));
        if (null==user){
            //如果没有用户创建用户
            User newUser = User.builder().phone(dto.getPhone()).nickname(UUID.randomUUID().toString()).build();
            userService.save(newUser);
            //生成token
            String token = UUID.randomUUID().toString();
            stringRedisTemplate.opsForValue().set(token, JSON.toJSONString(newUser));
            //发送登录日志
//            LoginLog loginLog = LoginLog.builder().logIp("127.0.0.1").userId(newUser.getId()).loginTime(new Date()).build();
//            rocketMQTemplate.convertAndSend("login-log",JSON.toJSONString(loginLog));
            return Result.success(token);
        }
        String token = UUID.randomUUID().toString();
        stringRedisTemplate.opsForValue().set(token, JSON.toJSONString(user));
        //发送登录日志
//        LoginLog loginLog = LoginLog.builder().logIp("127.0.0.1").userId(user.getId()).loginTime(new Date()).build();
//        rocketMQTemplate.convertAndSend("login-log",JSON.toJSONString(loginLog));
        return Result.success(token);
    }
}

