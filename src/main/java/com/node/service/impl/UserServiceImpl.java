package com.node.service.impl;

import com.node.dao.UserDao;
import com.node.domain.Classes;
import com.node.domain.User;
import com.node.exception.ext.LoginException;
import com.node.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    UserDao userDao;

    @Override
    public User login(String userName, String passWord) throws LoginException {

        Map<String,String> map = new HashMap<String,String>();
        map.put("userName",userName);
        map.put("passWord",passWord);

        User user = userDao.login(map);
        if (user == null) {
            throw new LoginException("账号密码错误");

        }

        // 如果程序能够成功的执行到该行，说明账号密码正确

        return user;

    }

    @Override
    public List<Classes> query(String specialty) {


        return userDao.query(specialty);


    }
}
