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
