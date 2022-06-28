package com.cubic.dockerapp.backend.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.cubic.dockerapp.backend.controllers.exceptions.ProductNotFoundException;
import com.cubic.dockerapp.backend.dao.ProductRepository;
import com.cubic.dockerapp.backend.domain.Product;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	public List<Product> getAllProducts() {
		return productRepository.findAll();
	}

	public Product getProductById(int productId) throws ProductNotFoundException{
		return productRepository.findById(productId)
				.orElseThrow(() -> new ProductNotFoundException("Product not found for this id :: " + productId));
	}
	
	public Product createProduct(Product product) {
		return productRepository.save(product);
		
	}
	
	public Product updateProductById(int productId, Product product) throws ProductNotFoundException {
		Product product0 = productRepository.findById(productId)
				.orElseThrow(() -> new ProductNotFoundException("Product not found for this id :: " + productId));
		product0.setName(product.getName());
		product0.setModel(product.getModel());
		product0.setPrice(product.getPrice());
		product0.setQuantity(product.getQuantity());
		return productRepository.save(product0);
	}

}
