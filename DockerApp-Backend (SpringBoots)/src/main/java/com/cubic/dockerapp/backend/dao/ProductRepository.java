package com.cubic.dockerapp.backend.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cubic.dockerapp.backend.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

}
