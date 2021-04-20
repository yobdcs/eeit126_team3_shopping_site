//package MessageBoard.config;
//
//import javax.servlet.Filter;
//
//import org.springframework.web.filter.CharacterEncodingFilter;
//import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
//
//
//public class MsgDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{
//	//大圈圈beans.config.xml
//		@Override
//		protected Class<?>[] getRootConfigClasses() {
//			return null;
//		}
//		//設定小圈圈mvc-servlet.xml
//		@Override
//		protected Class<?>[] getServletConfigClasses() {
//			return new Class[] {MsgSpringMVCJavaConfig.class};
//		}
//		//那些網址底下
//		@Override
//		protected String[] getServletMappings() {
//			return  new String[] {"/"};
//		}
//		
//		@Override
//		protected Filter[] getServletFilters() {
//			CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
//			characterEncodingFilter.setEncoding("UTF-8");
//			characterEncodingFilter.setForceEncoding(true);
//			return new Filter[] {characterEncodingFilter};
//		}
//}
