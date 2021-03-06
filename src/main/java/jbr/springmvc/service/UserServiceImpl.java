package jbr.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;

import jbr.springmvc.dao.UserDao;
import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;

public class UserServiceImpl implements UserService {

    @Autowired
    public UserDao userDao;

    public boolean register(User user) {
        return userDao.register(user);
    }

    public User validateUser(Login login) {
        return userDao.validateUser(login);
    }

    public User amazonLogin(String email,String name){
        return userDao.validateToken(email,name);
    }

}