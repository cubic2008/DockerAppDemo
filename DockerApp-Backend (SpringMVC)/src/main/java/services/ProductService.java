package services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import controllers.exceptions.ProductNotFoundException;
import dao.ProductDao;
import domain.Product;

@Service
public class ProductService {

	@Autowired
	private ProductDao productDao;

	public List<Product> getAllProducts() {
		return productDao.findAll();
	}

	public Product getProductById(int productId) throws ProductNotFoundException{
		Product product = productDao.findById(productId);
		if (product == null) {
			throw new ProductNotFoundException("Product not found for this id: " + productId);
		} else {
			return product;
		}
	}
	
	public Product createProduct(Product product) {
		return productDao.save(product);
		
	}
	
	public Product updateProductById(int productId, Product product) throws ProductNotFoundException {
		product.setId(productId);
		return productDao.save(product);
	}

	public void deleteProductById(int productId) throws ProductNotFoundException {
		if (productDao.findById(productId) == null) {
			throw new ProductNotFoundException("Product not found for this id: " + productId);
		}
		productDao.deleteById(productId);
	}

}
