package com.ptstore.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration 
public class TemplateConfiguration implements WebMvcConfigurer {
	
	@Bean
	public UrlBasedViewResolver viewResolver() {
		UrlBasedViewResolver urlBasedViewResolver = new UrlBasedViewResolver();
		urlBasedViewResolver.setViewClass(TilesView.class);
		return urlBasedViewResolver;
	}
	
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] { 
			"/WEB-INF/tiles/tiles.xml",
			
			// vendor
			"/WEB-INF/tiles/vendor/tile_account_vendor.xml",
			"/WEB-INF/tiles/vendor/tile_dashboard_vendor.xml",
			"/WEB-INF/tiles/vendor/tile_order_vendor.xml",
			"/WEB-INF/tiles/vendor/tile_product_vendor.xml",
			"/WEB-INF/tiles/vendor/tile_quality_vendor.xml",
			
			// customer
			"/WEB-INF/tiles/customer/tile_home.xml", 
			"/WEB-INF/tiles/customer/tile_product.xml",
			"/WEB-INF/tiles/customer/tile_customer.xml", 
			"/WEB-INF/tiles/customer/tile_cart.xml",
			"/WEB-INF/tiles/customer/tile_order.xml",
			
			// admin
			"/WEB-INF/tiles/admin/admin_tile_category.xml",
			"/WEB-INF/tiles/admin/admin_tile_account.xml",
			"/WEB-INF/tiles/admin/admin_tile_product.xml",
			"/WEB-INF/tiles/admin/admin_tile_rate.xml",
			"/WEB-INF/tiles/admin/admin_tile_statistics.xml",
			"/WEB-INF/tiles/admin/admin_tile_orders.xml",
			 
		});
		return tilesConfigurer;
	}
	

}
