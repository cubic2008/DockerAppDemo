package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import domain.Product;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private TransactionTemplate transactionTemplate;
	
	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<Product> findAll() {
		return this.entityManager.createQuery("from Product", Product.class).getResultList();
	}

	@Override
	public Product findById(int productId) {
		return this.entityManager.find( Product.class, productId );
	}

	@Override
	public Product save(Product product) {
		return this.transactionTemplate.execute ( 
				new TransactionCallback<Product>() {
					@Override
					public Product doInTransaction(TransactionStatus ts) {
						if ( product.getId() == 0 ) {
							entityManager.persist( product );
						} else {
							entityManager.merge( product );
						}
						entityManager.flush();
						return product;
					}
				} );
	}

	@Override
	public void deleteById(int productId) {
		this.transactionTemplate.execute ( 
				new TransactionCallbackWithoutResult() {
					@Override
					protected void doInTransactionWithoutResult(TransactionStatus arg0) {
						Product product = entityManager.find(Product.class, productId );
						entityManager.remove(product);
					}
				} );
	}
	 
}
