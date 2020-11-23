package com.node.dao;

import com.node.domain.Classes;
import com.node.domain.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    User login(Map<String, String> map);

    List<Classes> query(String specialty);
}
