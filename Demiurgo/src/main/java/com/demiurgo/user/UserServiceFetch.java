package com.demiurgo.user;

import org.springframework.stereotype.Service;

@Service
public class UserServiceFetch {
    private final UserRepository userRepository;
    private final UserMapper userMapper;

    public UserServiceFetch(UserRepository userRepository, UserMapper userMapper){
        this.userRepository = userRepository;
        this.userMapper = userMapper;

    }

}
