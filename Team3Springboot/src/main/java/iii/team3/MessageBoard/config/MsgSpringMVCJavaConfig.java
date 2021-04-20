//package MessageBoard.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.ComponentScan;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.multipart.commons.CommonsMultipartResolver;
//import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
//import org.springframework.web.servlet.config.annotation.EnableWebMvc;
//import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//import org.springframework.web.servlet.view.InternalResourceViewResolver;
//
//@Configuration
//@EnableWebMvc
//@ComponentScan(basePackages = "MessageBoard")
//public class MsgSpringMVCJavaConfig implements WebMvcConfigurer{
//	
//	@Bean
//	public CommonsMultipartResolver multipartViewResolver() {
//		CommonsMultipartResolver multipartViewResolver =new CommonsMultipartResolver();//對應到bean.config.xml裡面的id
//		multipartViewResolver.setDefaultEncoding("UTF-8");
//		return multipartViewResolver;
//	}
//	
//	@Bean
//	public InternalResourceViewResolver viewResolver(){
//		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
//		viewResolver.setPrefix("/WEB-INF/MessageBoardapps/");
//		viewResolver.setSuffix(".jsp");
//		viewResolver.setOrder(2);
//		return viewResolver;
//	}
//	
//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/css/");
//		registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/img/");
//		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/js/");
//		registry.addResourceHandler("/vendor/**").addResourceLocations("/WEB-INF/vendor/");
//		registry.addResourceHandler("/assets/**").addResourceLocations("/WEB-INF/assets/");
//	}
//
//	@Override
//	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
//		configurer.enable();
//	}
//	
//}
