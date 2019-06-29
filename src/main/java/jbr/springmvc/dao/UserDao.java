package jbr.springmvc.dao;
import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;
public interface UserDao {
    boolean register(User user);
    User validateUser(Login login);
    User validateToken(String email,String name);
}