package com.may;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.may.intercepptor.AuthInterceptor;
import com.may.intercepptor.LoginInterceptor;

@SpringBootApplication
public class Asm2Application implements WebMvcConfigurer {

	public static void main(String[] args) {
		SpringApplication.run(Asm2Application.class, args);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
			.addPathPatterns("/admin/**")
			.order(1);

		registry.addInterceptor(new AuthInterceptor())
			.addPathPatterns("/admin/**")
			.order(2);
	}
}
