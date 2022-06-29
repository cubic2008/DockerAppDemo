package web;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan("web")
public class WebConfig extends WebMvcConfigurerAdapter {
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		resolver.setExposeContextBeansAsAttributes(true);
		return resolver;
	}
	
//	@Bean
//	public ViewResolver viewResolver() {
//		return new MyViewResolver();
//	}
	
//	@Bean
//	public MessageSource messageSourceBean() {
//		ResourceBundleMessageSource rbms = new ResourceBundleMessageSource();
//		rbms.setBasename( "classpath:messages");
//		return rbms;
//	}
	
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:messages");
		messageSource.setDefaultEncoding("UTF-8");
		return messageSource;
	}


	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
//	@Override
//    public void addCorsMappings(CorsRegistry registry) {
//        registry.addMapping("/**").allowedMethods("GET", "POST", "PUT", "DELETE", "HEAD", "OPTIONS", "PATCH");
//    }
	
	@Override
  public void addCorsMappings(CorsRegistry registry) {
      registry.addMapping("/**")
      		  .allowedMethods("GET", "POST", "PUT", "DELETE", "HEAD", "OPTIONS", "PATCH", "HEAD")
              .allowedOrigins("*")
              .allowCredentials(true)
              .allowedHeaders("Authorization", "Cache-Control", "Content-Type", "Accept", "X-Requested-With", "Access-Control-Allow-Origin", "Access-Control-Allow-Headers", "Origin")
          .exposedHeaders("Access-Control-Expose-Headers", "Authorization", "Cache-Control", "Content-Type", "Access-Control-Allow-Origin", "Access-Control-Allow-Headers", "Origin");

  }
}
