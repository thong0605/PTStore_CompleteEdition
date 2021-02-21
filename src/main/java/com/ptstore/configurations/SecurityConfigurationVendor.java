package com.ptstore.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.context.SecurityContextPersistenceFilter;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;

import com.ptstore.services.AccountService;

@EnableWebSecurity
@Configuration
@Order(value = 1)
public class SecurityConfigurationVendor extends WebSecurityConfigurerAdapter{

	@Autowired
	private AccountService accountService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.cors().and().csrf().disable(); 
		
//		http.authorizeRequests()
//			.antMatchers("/vendor/**").access("hasRole('ROLE_VENDOR')")//.anyRequest().authenticated()//		
//			.and()
//			.formLogin().loginPage("/vendor/login").permitAll()
//			.loginProcessingUrl("/vendor/processLogin")
//			.defaultSuccessUrl("/vendor/welcome")
//			.failureUrl("/vendor/login?error")
//			.usernameParameter("username")
//			.passwordParameter("password")
//			.and()
//			.logout().logoutUrl("/vendor/logout")
//			.logoutSuccessUrl("/vendor/login?logout")
//			//.deleteCookies("JSESSIONID")
//			.and()
//			.exceptionHandling().accessDeniedPage("/vendor/accessDenied");
//			
		http.authorizeRequests()
			.antMatchers("/vendor", "/vendor/login", "/vendor/register").permitAll()
			.antMatchers("/vendor/**").access("hasRole('ROLE_VENDOR')")
			//.anyRequest().authenticated()
			.and()
			.formLogin().loginPage("/vendor/login")
			.loginProcessingUrl("/vendor/processLogin")
			//.successForwardUrl("/vendor/processLogin")
			.defaultSuccessUrl("/vendor/welcome")		
			.failureUrl("/vendor/login?error")
			.usernameParameter("username")
			.passwordParameter("password")
			.and()
			.logout().logoutUrl("/vendor/logout")
			.logoutSuccessUrl("/vendor/login?logout").deleteCookies("JSESSIONID")
			.and()
			.exceptionHandling().accessDeniedPage("/vendor/accessDenied")	
		;
			
		
//		http.authorizeRequests()
//		.antMatchers("/customer/login", "/customer/register").permitAll()
//		.antMatchers("/customer/**") 
//		.access("hasRole('ROLE_CUSTOMER')")
//		.and()
//		.formLogin().loginPage("/customer/login")
//		.loginProcessingUrl("/customer/processLogin")
//		.defaultSuccessUrl("/customer/welcome")
//		.failureUrl("/customer/login?error")
//		.usernameParameter("username")
//		.passwordParameter("password")
//		.and()
//		.logout().logoutUrl("/customer/logout")
//		.logoutSuccessUrl("/customer/login?logout").deleteCookies("JSESSIONID")
//		.and()
//		.exceptionHandling().accessDeniedPage("/customer/accessDenied?accessDenied")
//		;
		
		http.rememberMe().key("uniqueAndSecret").tokenValiditySeconds(10000);
	
	}
	
	
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication().passwordEncoder(encoder())
        .withUser("vendor").password("password").roles("VENDOR")
        .and()
        .withUser("admin").password("password").roles("ADMIN")
        .and()
        .withUser("customer").password("password").roles("CUSTOMER");
		auth.userDetailsService(accountService);
	}
		
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean 
	public SecurityContextHolderAwareRequestFilter awareRequestFilter() {
		return new SecurityContextHolderAwareRequestFilter();
	}
	
	@Bean 
	public SecurityContextPersistenceFilter persistenceFilter() {
		return new SecurityContextPersistenceFilter();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**"); 
    }
	
	@SuppressWarnings("deprecation")
	@Bean
	@Override
	public UserDetailsService userDetailsService() {
		UserDetails user =
			 User.withDefaultPasswordEncoder()
				.username("user")
				.password("password")
				.roles("VENDOR","ADMIN", "CUSTOMER")
				.build();

		return new InMemoryUserDetailsManager(user);
	}
}
