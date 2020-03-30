package com.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.entity.Order;
import com.web.service.OrderService;

@RequestMapping("/order")
@Controller
public class OrderController {
	
	
	@Autowired
	OrderService  orderService;
	
	@RequestMapping("/getAllorder")
	@ResponseBody
	public List<Order>  getAllorder(){				
		
		List<Order> list = orderService.getAllorder();
		
		return list;
	}
	
	@RequestMapping("/updateorder")
	@ResponseBody
	public Order getOrderById(Integer orderid) {
		
		return orderService.getorderById(orderid);
	}
	
	@RequestMapping("/saveorder")
	@ResponseBody
	public int updateorder(Order order) {
		
		return orderService.updateorder(order);
	}
	
	@RequestMapping("/addorder")
	@ResponseBody
	public int addorder(Order order) {
		
		return orderService.addorder(order);
	}

}
