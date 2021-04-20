package iii.team3.shoppingCart.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//@Configuration @EnableWebMvc @ComponentScan(basePackages = {"shoppingCart","member","MessageBoard","product","act"}) @EnableTransactionManagement
@Configuration
public class SpringMvcConfig implements WebMvcConfigurer{

//	@Bean
//	public InternalResourceViewResolver viewResolver() {
//		var viewResolver = new InternalResourceViewResolver();
//		
//		viewResolver.setPrefix("/WEB-INF/");
//		viewResolver.setSuffix(".jsp");
//		viewResolver.setOrder(2);
//		
//		return viewResolver;
//	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/productnames/**").addResourceLocations("/WEB-INF/productnames/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/js/");
		registry.addResourceHandler("/image/**").addResourceLocations("/WEB-INF/image/");
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/css/");
//		registry.addResourceHandler("/paper-dashboard-master/**").addResourceLocations("/WEB-INF/paper-dashboard-master/");
//		registry.addResourceHandler("/distribution/**").addResourceLocations("/WEB-INF/distribution/");

	}
	
//	@Override
//	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
//		configurer.enable();
//	}
}
