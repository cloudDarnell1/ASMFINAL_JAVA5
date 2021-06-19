package com.may.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.may.entity.Order;



public interface OrderDAO extends JpaRepository<Order, Long>{
}
