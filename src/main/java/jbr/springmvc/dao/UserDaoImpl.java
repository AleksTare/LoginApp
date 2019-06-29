package jbr.springmvc.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;
public class UserDaoImpl implements UserDao {
    @Autowired
    DataSource datasource;
    @Autowired
    JdbcTemplate jdbcTemplate;
    public void register(User user) {
        String sql = "insert into users values(?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, new Object[] { user.getUsername(), user.getPassword(), user.getFirstname(),
                user.getLastname(), user.getEmail(), user.getAddress(), user.getPhone() });
    }
    public User validateUser(Login login) {
        if(login.getPassword().equals("") || login.getUsername().equals("")) return null;
        String sql = "select * from users where username='" + login.getUsername() + "' and password='" + login.getPassword() + "'";
        List<User> users = jdbcTemplate.query(sql, new UserMapper());
        return users.size() > 0 ? users.get(0) : null;
    }


    public User validateToken(String email,String name){
        User user;
        String sql = "select * from users where email='" + email + "'";
        List<User> users = jdbcTemplate.query(sql, new UserMapper());
        if(users.size() > 0){
            //If user exists, proceed with login
             user = users.get(0);
        }else{
            //Register new user
            user = new User();
            user.setUsername("");
            user.setPassword("");
            user.setFirstname(name.substring(0,name.indexOf(" ")));
            user.setLastname(name.substring(name.indexOf(" ")));
            user.setEmail(email);
             sql = "insert into users values(?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql, new Object[] { user.getUsername(), user.getPassword(), user.getFirstname(),
                    user.getLastname(), user.getEmail(), "", 0 });
        }
        return user;
    }


}
class UserMapper implements RowMapper<User> {
    public User mapRow(ResultSet rs, int arg1) throws SQLException {
        User user = new User();
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setFirstname(rs.getString("firstname"));
        user.setLastname(rs.getString("lastname"));
        user.setEmail(rs.getString("email"));
        user.setAddress(rs.getString("address"));
        user.setPhone(rs.getInt("phone"));
        return user;
    }
}