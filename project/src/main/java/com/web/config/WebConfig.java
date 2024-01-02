package com.web.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.web.session.SessionCheckInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SessionCheckInterceptor())
                .order(2)
                .addPathPatterns("/memberJoinForm", "/loginForm", "/createparty",
                                 "/memberUpdate", "/memberUpdateForm", "/memberUpdateNo",
                                 "/memberUpdateResult", "/reviewInsert", "/admin",
                                 "/getmypage", "/groupInsert", "/groupJoinForm",
                                 "/groupRegistrationForm", "/imageban", "/mygrouplist",
                                 "/MyKingList", "/PartyList", "/partyUpdate",
                                 "/youtubePartyList", "/findparty", "/partydetail",
                                 "/payinfo", "/reviewContent", "/reviewForm" ) // 접근 금지 url
                .excludePathPatterns("/resources/**", "/**/*.ico", "/error", "/login", "/loginResult",
                					 "/userSearch" ); // 예외 url 
    }
}


