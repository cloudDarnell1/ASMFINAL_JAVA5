package com.may.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.may.entity.OrderDetail;



public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
}