package dao;

import java.util.List;

import domain.Product;

public interface ProductDao {

	List<Product> findAll();

	Product findById(int productId);

	Product save(Product product);

	void deleteById(int productId);

}
