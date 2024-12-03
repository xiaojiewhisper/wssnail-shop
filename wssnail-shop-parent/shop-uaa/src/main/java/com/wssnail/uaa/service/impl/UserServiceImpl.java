package com.wssnail.uaa.service.impl;

import com.wssnail.uaa.mapper.UserMapper;
import com.wssnail.uaa.po.User;
import com.wssnail.uaa.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author snail
 * @since 2024-11-06
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
