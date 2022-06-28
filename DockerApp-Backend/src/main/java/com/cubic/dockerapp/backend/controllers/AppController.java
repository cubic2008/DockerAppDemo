package com.cubic.dockerapp.backend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cubic.dockerapp.backend.controllers.exceptions.ProductNotFoundException;
import com.cubic.dockerapp.backend.domain.Product;
import com.cubic.dockerapp.backend.services.ProductService;

@RestController
@RequestMapping("/api/v1")
public class AppController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping(value="/products", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Product> getProductList() {
		return productService.getAllProducts();
	}

	@GetMapping(value="/products/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public Product getProductById(@PathVariable("id") int productId) throws ProductNotFoundException{
		return productService.getProductById(productId);
	}
	
	@PostMapping(value="/products", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public Product createProduct(@RequestBody Product product) {
		return productService.createProduct(product);
		
	}
	
	@PutMapping(value="/products/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public Product updateProductById(@PathVariable("id") int productId, @RequestBody Product product) throws ProductNotFoundException {
		return productService.updateProductById(productId, product);
	}
}
