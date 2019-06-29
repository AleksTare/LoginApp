package jbr.springmvc.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import jbr.springmvc.model.Login;
import jbr.springmvc.model.User;
import jbr.springmvc.service.UserService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.client.fluent.Content;
import org.apache.http.client.fluent.Request;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;


import java.net.URLEncoder;

@Controller
public class LoginController {
    @Autowired
    UserService userService;
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("login");
        mav.addObject("login", new Login());
        return mav;
    }
    @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
    public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
                                     @ModelAttribute("login") Login login) {
        ModelAndView mav = null;
        User user = userService.validateUser(login);
        if (null != user) {
            mav = new ModelAndView("welcome");
            mav.addObject("firstname", user.getFirstname());
        } else {
            mav = new ModelAndView("login");
            mav.addObject("message", "Invalid username or password");
        }
        return mav;
    }

    @RequestMapping(value = "/login/amazon", method = RequestMethod.GET)
    public ModelAndView loginAmazon(@RequestParam String access_token) {
            // Verify that the access token belongs to us
            // The token must be url-encoded when passed to tokeninfo
            Content c;
            Map<String, Object> m;
            ModelAndView mav = new ModelAndView("login");
            mav.addObject("login", new Login());
            mav.addObject("message", "Error logging in with Amazon");
            try {
                 c = Request.Get("https://api.amazon.com/auth/o2/tokeninfo?access_token="
                                + URLEncoder.encode(access_token, "UTF-8"))
                                .execute()
                                .returnContent();
                 m = new ObjectMapper().readValue(c.toString(), new TypeReference<Map<String,Object>>(){});

            if (!"amzn1.application-oa2-client.aedb066b31c4468388d07a2ca6801a0f".equals(m.get("aud"))) {
                // the access token does not belong to us
                throw new RuntimeException("Invalid token");
            }
            // Exchange the access token for user profile
            // The token must NOT be url-encoded when passed to profile
                c = Request.Get("https://api.amazon.com/user/profile")
                        .addHeader("Authorization", "bearer " + access_token)
                        .execute()
                        .returnContent();
            m = new ObjectMapper().readValue(c.toString(), new TypeReference<Map<String,Object>>(){});
            System.out.println(String.format("%s %s %s", m.get("name"), m.get("email"), m.get("user_id")));
            User user = userService.amazonLogin(m.get("email").toString(),m.get("name").toString());
            if (null != user) {
                mav = new ModelAndView("welcome");
                mav.addObject("firstname", user.getFirstname());
                if(user.getUsername().equals("")) mav.addObject("message", "Please update your password and username as soon as possible");
            } else {
                mav = new ModelAndView("login");
                mav.addObject("message", "Error logging in with Amazon");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return mav;
    }


}