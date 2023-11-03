package com.example.demo.util;

import com.example.demo.config.UserInfoUserDetails;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class SecurityUtil {
    public static UserInfoUserDetails getId(){
        UserInfoUserDetails userDetails= (UserInfoUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return userDetails;
    }
    public static String getGmail(OAuth2User oAuth2User){
        String email=oAuth2User.getAttribute("email");
        return email;
    }

}
