package com.web.service;

import java.util.List;

import com.web.entity.Order;

public interface OrderService {
	
	
	List<Order>  getAllorder();
	
	Order getorderById(Integer orderid);
	
	int updateorder(Order order);
	
	int addorder(Order order);

}
