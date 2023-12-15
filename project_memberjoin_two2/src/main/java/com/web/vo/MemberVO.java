package com.web.vo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import lombok.Data;

@Data
public class MemberVO implements HttpSessionBindingListener{
	
	private int seq;
	private String id;
	private String kakaoid;
	private String pw;
	private String name;
	private String nickname;
	private String role;
	private String tel;
	private String addr;
	private String birth;
	private String email;
	private String tier;

    // 로그인 중인 사용자의 세션을 저장하는 Map
    private static Map<String, HttpSession> loginUsers = new HashMap<>();

    @Override
    public void valueBound(HttpSessionBindingEvent event) {
        // 로그인 중인 사용자의 세션을 Map에 추가
        loginUsers.put(id, event.getSession());
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
        // 로그아웃한 사용자의 세션을 Map에서 제거
        loginUsers.remove(id);
    }

    public static HttpSession getLoginSession(String id) {
        // 로그인 중인 사용자의 세션을 반환
        return loginUsers.get(id);
    }


}
