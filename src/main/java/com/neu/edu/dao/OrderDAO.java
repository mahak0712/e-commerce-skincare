package com.neu.edu.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.neu.edu.exception.OrderException;
import com.neu.edu.exception.ProductException;
import com.neu.edu.pojo.Cart;
import com.neu.edu.pojo.Order;

public class OrderDAO extends DAO{
	public OrderDAO() {}
	
	public Order AddNewOrder(Order order) throws OrderException{
		try {
			begin();
			System.out.println("add product to user cart");
			System.out.println(order.getUser().getUserID());
			getSession().save(order);
			commit();
			return order;
		}catch (HibernateException e) {
			rollback();
			throw new OrderException("Exception while adding order: " + e.getMessage());
		}
	}
	
    public List<Order> listConsumerOrder(long userID) throws Exception{
    	
    	try {
            begin();	  
            Query q = getSession().createQuery("from Order order where order.user.userID=:userID");
            q.setLong("userID", userID);
            List<Order> orderList =q.list();
            commit();
            return orderList;
        } catch (HibernateException e) {
            rollback();
            throw new ProductException("could not list consumer orders", e);
        }
    	
    }
    
    public List<Order> listAllOrder() throws Exception{
    	
    	try {
            begin();	  
            Query q = getSession().createQuery("from Order");
            List<Order> orderList =q.list();
            commit();
            return orderList;
        } catch (HibernateException e) {
            rollback();
            throw new ProductException("could not list all orders", e);
        }
    	
    }
    
    public Order findOrder(long orderID) throws Exception{
    	try {
            begin();	  
            Query q = getSession().createQuery("from Order where orderID=:orderID");
            q.setLong("orderID", orderID);
            Order order =(Order) q.uniqueResult();
            commit();
            return order;
        } catch (HibernateException e) {
            rollback();
            throw new ProductException("could not list all orders", e);
        }	
    }
	
	

}
