package com.cm.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.user.service.UserService;
import com.cm.user.vo.User;

@WebFilter("/*")
public class AutoLogFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("user") == null) {
            Cookie[] cookies = req.getCookies();
            if(cookies != null) {
                for(Cookie cookie : cookies) {
                    if("autoLogin".equals(cookie.getName())) {
                        String[] credentials = cookie.getValue().split(":");
                        String id = credentials[0];
                        String pw = credentials[1];

                        UserService us = new UserService();
                        User u = us.getUserInfo(id, pw);

                        if(u != null) {
                            session = req.getSession(true);
                            session.setAttribute("user", u);
                            session.setMaxInactiveInterval(60 * 30);
                        }
                        break;
                    }
                }
            }
        }

        chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {}
    public void destroy() {}
}