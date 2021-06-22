package com.may.dao;

import com.may.entity.Product;
import com.may.entity.Report;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Integer>{

	@Query("SELECT p FROM Product p WHERE p.category.id='1005'")
	List<Product> findByCategoryId();
	
	@Query("SELECT p FROM Product p WHERE p.category.id=?1")
	List<Product> findByCategoryId(String category);
	
//	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
//	List<Product> findByPrice(double minPrice, double maxPrice);
	
	List<Product> findByPriceBetween(double minPrice, double maxPrice);

	@Query(value = "SELECT * FROM Products WHERE price BETWEEN ?1 AND ?2", nativeQuery =true )
	List<Product> findByPrice(double minPrice, double maxPrice);
	
	@Query(value="SELECT * FROM Products WHERE name LIKE ?1",nativeQuery = true)
	List<Product> findByKeyword(String keyword);
	
	@Query(name = "findByKeyword")
	List<Product> findByKeyword2(String keyword);
	
	@Query("SELECT p FROM Product p WHERE p.price > ?1 ORDER BY p.price DESC")
	List<Product> findByPrice1(double min);
	
	@Query("SELECT p FROM Product p WHERE p.price > ?1")
	List<Product> findByPrice2(double min, Sort sort);
	
	@Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
	Page<Product> findByKeywords(String keywords, Pageable pageable);

	Page<Product> findAllByNameLike(String keywords, Pageable pageable);
	
	@Query(value = "SELECT * FROM Products WHERE name like %?1%", nativeQuery =true )
	List<Product> findAllByNameLikeNoPaging(String Name);
	
	@Query("SELECT new Report(o.category, sum(o.price), count(o)) "
			+ " FROM Product o "
			+ " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
	List<Report> getInventoryByCategory();
}
