package com.may.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.may.entity.Category;





public interface CategoryDAO extends JpaRepository<Category, String>{
}
