package com.web.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;

public class SessionCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse
            response, Object handler) throws Exception {
		
        //Session Check - Session X
        if(request.getSession().getAttribute(MemberSession.LOGIN) == null){
        	
            // 세션이 없을 시, login으로 Redirect
            response.sendRedirect("/login");
            return false;
        }
		
        // Session O
        return true;

    };
}
