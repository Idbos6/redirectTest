package com.node.controller;

import com.node.domain.Classes;
import com.node.domain.User;
import com.node.exception.MyUserException;
import com.node.service.UserService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService us;

    @ResponseBody
    @RequestMapping("/login.do")
    public Map<String, Object> login(HttpServletRequest request) throws MyUserException {

        String userName = request.getParameter("userName");
        String passWord = request.getParameter("passWord");

        Map<String, Object> map = new HashMap<>();

        User user = us.login(userName, passWord);


        // 如果程序执行到此处，说明业务层没有为controller抛出任何的异常
        // 表示登录成功
            /*

                {"success":true}

             */
        request.getSession().setAttribute("user", user);
        map.put("success", true);
        return map;

    }

    @ResponseBody
    @RequestMapping("/query.do")
    public List<Classes> query(HttpServletRequest request) {

        String specialty = request.getParameter("specialty");

        return us.query(specialty);

    }

    @ResponseBody
    @RequestMapping("/quit.do")
    public Map<String, Object> quit(HttpServletRequest request) throws MyUserException, IOException {

        request.getSession().setAttribute("user", null);
        Map<String, Object> map = new HashMap<>();
        map.put("success", "true");
        return map;


    }

}
