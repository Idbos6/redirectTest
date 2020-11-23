package com.node.service;

import com.node.domain.Classes;
import com.node.domain.User;
import com.node.exception.MyUserException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {

    User login(String userName, String passWord) throws MyUserException;

    List<Classes> query(String specialty);
}
