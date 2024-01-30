
> 프로젝트 URL : &nbsp; http://site.oyes.o-r.kr/

---
# 1.&nbsp;프로젝트 개요

### 1-1 프로젝트 기획 및 분석
#### &nbsp; 빅데이터 플랫폼 기업인 아이지에이O스의 조사에 따르면, 최근 OTT서비스의 요금인상에 따라 사용하는 고객 이탈 수가 감소하는 경우가 있다. 예를 들어, 이전 디O니 플러스 11월 요금인상 정책 발표에 따라, 고객이 400만에서 328만으로 줄어드는 경우가 있었다. 이러한 현상이 있음에도, OTT 서비스들은 재정적 문제로 요금인상을 멈추지 않고있다. 서비스의 요금부담을 줄일 수 있다면 사용자들이 많아질 것으로 기대된다. 따라서 OYES 팀은 OTT서비스 아이디를 공유하는 프로젝트를 기획하여 진행하였다. 


### 1-2 프로젝트 개발환경 및 기술스택
> ** apache-tomcat 9.0.84 | Spring Boot 4 (STS4) | Java 11 | Oracle DataBase 11g **

![](https://velog.velcdn.com/images/spg9468/post/1e69ca75-59c3-41ac-8f1a-7f55be5c4047/image.png)


### 1-3 프로젝트 아키텍쳐
![](https://velog.velcdn.com/images/spg9468/post/21b6e2d2-44ea-4fb6-8443-675911525805/image.png)

---
# 2.&nbsp; 프로젝트 기능소개

### 2-1 기능 요약
~~~
로그인 & 회원가입 & 파티만들기
~~~

![](https://velog.velcdn.com/images/spg9468/post/9e53a648-0fc2-4b4c-b2ca-fdc49e589457/image.png)

~~~
마이페이지 & Q&A페이지
~~~
![](https://velog.velcdn.com/images/spg9468/post/df256260-d9e4-4bc6-9813-5e727b096336/image.png)


~~~
어드민페이지
~~~

![](https://velog.velcdn.com/images/spg9468/post/41ab62fe-edd5-4c9b-8c1a-4350f2c9341b/image.png)

---


# 3.&nbsp; 프로젝트 개발결과
### 3-1 플로우 차트
![](https://velog.velcdn.com/images/spg9468/post/ea382928-c55e-4d7f-ad4a-6d4d3021e2c7/image.png)


### 3-2 Springboot Controller

#### ✅ &nbsp; Mybatis-Config
- ** SqlSessionFactory 생성 시 Reference로 DataSource Bean 수정 및 생성**
```
package com.web.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(value="com.web.dao",sqlSessionFactoryRef = "SqlSessionFactory")
public class MyBatisConfig {
	private static SqlSessionFactory factory = null;

	@Value("${mybatis.mapper-locations}")
	String mPath;
	
	@Bean(name="dataSource")
	@ConfigurationProperties(prefix="spring.datasource")
	public DataSource DataSource() {
		return DataSourceBuilder.create().build();
	}
	
	@Bean(name="SqlSessionFactory")
	public SqlSessionFactory SqlSessionFactory(@Qualifier("dataSource") DataSource DataSource, ApplicationContext applicatiionContext) throws Exception{
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(DataSource);
		sqlSessionFactoryBean.setMapperLocations(applicatiionContext.getResources(mPath));
		return sqlSessionFactoryBean.getObject();
	}
	@Bean(name="SessionTemplate")
	public SqlSessionTemplate SqlSessionTemplate(@Qualifier("SqlSessionFactory") SqlSessionFactory firestSqlSessionFactory) {
		return new SqlSessionTemplate(firestSqlSessionFactory);
	}
	
}
```

#### ✅ &nbsp; Interceptor-Config
- ** 로그인 안되어있을 때 Interceptor로 접근 금지 URL 관리 **
```
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

```
- ** HandlerInterceptor 부분 **
```
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

```

### 3-3 &nbsp; JSoup 데이터 크롤링

#### ✅ &nbsp; TopService

```
package com.web.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.web.vo.Top;

@Service
public class TopService {
	private static String Top_Netflix_URL = "https://www.netflix.com/tudum/top10/south-korea";
	private static String Top_WhaCha_URL ="https://pedia.watcha.com/";
    @PostConstruct
    public List<Top> getTopDatas() throws IOException {
        List<Top> TopList = new ArrayList<>();
        Document document = Jsoup.connect(Top_Netflix_URL).get();

        Elements contents = document.select("section ul div");
        for(Element content : contents) {
        	Top top = Top.builder()
        			.image(content.select("picture source").attr("abs:srcset"))
        			.subject(content.select("b").text())
        			.url(content.select("a").attr("abs:href"))
        			.build();
        	if(top.getImage() != "" && top.getSubject() != "" && top.getUrl() != "") {
            	top.setSubject(top.getSubject().substring(0,top.getSubject().length()-3));
        		TopList.add(top);
        	}
        }
        return TopList;
    }
    
    @PostConstruct
    public List<Top> getTopWhacha() throws IOException {
        List<Top> TopList = new ArrayList<>();
        Document document = Jsoup.connect(Top_WhaCha_URL).get();
        Elements contents = document.select("section div ul li");
        for(Element content : contents) {
        	Top top = Top.builder()
        			.image(content.select("img").attr("abs:src"))
        			.subject(content.select("a").text())
        			.url(content.select("a").attr("abs:href"))
        			.build();
        	if(top.getImage() != "" && top.getSubject() != "" && top.getUrl() != "") {
        		TopList.add(top);
        	}
        }
        return TopList.subList(0, 10);
    }
}

```
---
# 4. &nbsp; 결론
#### &nbsp; OTT서비스에 대한 수요가 날로 늘어나고 있으며, 이에 따른 공유 서비스들도 증가하고 있다. 그러나 수요 증가 추세에도 불구하고 아직까지 사람들이 많이 이용하고 있는 공유 서비스는 없는 편이다. 따라서 본 프로젝트는 OTT서비스 파티 관리 부분을 개선하여 사용자에게 보다 나은 서비스를 제공하고자 하였다.


