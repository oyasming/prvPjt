package com.prv.pjt.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.prv.pjt.handler.FailureLoginHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private DataSource dataSource;
	@Value("${spring.queries.auth-query}")
	private String authQuery;
	@Value("${spring.queries.user-query}")
	private String userQuery;

	@Override
	public void configure(WebSecurity web) throws Exception {
		// TODO Auto-generated method stub
		// 리소스(이미지, css, 등등) 폴더를 예외처리 한다.
		web.ignoring().antMatchers("/resources/**", "/css/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		// /admin.do 와 /join.do 의 명확한 권한 설정이 되어있지 않음. 현재 인증여부만 확인
		
		http.authorizeRequests()
			.antMatchers("/").permitAll()
			.antMatchers("/index.do").permitAll()
			.antMatchers("/customer.do").permitAll()
			.antMatchers("/login.do").permitAll()
			.antMatchers("/admin.do", "/join**").authenticated()
			.and()
			.csrf().disable()
			.formLogin().loginPage("/login.do")
			//.failureUrl("/login.do?error=true")
			.failureHandler(new FailureLoginHandler())
			.defaultSuccessUrl("/index.do")
			.usernameParameter("username").passwordParameter("password")
			.and()
			.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logoutProcess.do"))
			.logoutSuccessUrl("/login.do")
			.and()
			.exceptionHandling().accessDeniedPage("/");
		// 로그아웃 처리 미구현
		// 세션 처리 미구현
//			.and()
//			.sessionManagement().maximumSessions(1).expiredUrl("/login.do");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stubauthQuery
		auth.jdbcAuthentication()
			.authoritiesByUsernameQuery(authQuery)
			.usersByUsernameQuery(userQuery)
			.dataSource(dataSource)
			.passwordEncoder(bCryptPasswordEncoder);
	}
}
