package jbr.springmvc.service;

import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;

public interface UserService {

    boolean register(User user);

    User validateUser(Login login);

    User amazonLogin(String email,String name);
}