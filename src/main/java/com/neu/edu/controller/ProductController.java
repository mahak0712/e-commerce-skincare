package com.neu.edu.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.neu.edu.dao.CartDAO;
import com.neu.edu.dao.OrderDAO;
import com.neu.edu.dao.ProductDAO;
import com.neu.edu.dao.UserDAO;
import com.neu.edu.exception.ProductException;
import com.neu.edu.pojo.Cart;
import com.neu.edu.pojo.Order;
import com.neu.edu.pojo.Product;
import com.neu.edu.pojo.User;

@Controller
@RequestMapping("/sell/*/**")
public class ProductController {
	
	@Autowired
	@Qualifier("cartDao")
	CartDAO cartDao;
	
	@Autowired
	@Qualifier("userDao")
	UserDAO userDao;
		
	@Autowired
	@Qualifier("proDao")
	ProductDAO proDao;
	
	@Autowired
	@Qualifier("orderDao")
	OrderDAO orderDao;
	
	@RequestMapping(value="/sell/manage", method = RequestMethod.GET)
	public ModelAndView initializeForm(HttpServletRequest request) throws Exception {		
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("managepage");
		return mv;
	}
	
	@RequestMapping(value="/sell/manage/update", method = RequestMethod.GET)
	public ModelAndView UpdateProduct(HttpServletRequest request) throws Exception {		
		ModelAndView mv = new ModelAndView();	
		mv.addObject("product", new Product());
		List<Product> prolist = proDao.ListAllPro();
		mv.addObject("prolist",prolist);
		mv.setViewName("updatepro");
		return mv;
	}
	
	@RequestMapping(value="/sell/manage/update", method = RequestMethod.POST)
	public ModelAndView UpdateStockAndPrice(@ModelAttribute("product")  @Validated Product product, BindingResult result) throws Exception {		
        if(result.hasErrors()){

    		ModelAndView mv = new ModelAndView();	
    		mv.addObject("product", product);
    		List<Product> prolist = proDao.ListAllPro();
    		mv.addObject("prolist",prolist);
    		mv.setViewName("updatepro");
    		return mv;
        }
		
		try {			
			
			User u = userDao.FindUser(product.getVerifiedId());
			System.out.println(product.getVerifiedId());
			product.setUser(u);
			System.out.println(product.getProductName()+"+"+product.getVerifiedId());
			Product pro = proDao.FindPro(product.getProductName());
			pro = proDao.UpdateProduct(pro, product.getStock(), product.getPrice());		   
		    return new ModelAndView("update-success", "product",pro );
			
		} catch (ProductException e) {
			System.out.println(e.getMessage());
			return new ModelAndView("error", "errorMessage", "error while updating products");
		}
	}
	
	
	@RequestMapping(value="/sell/manage/in", method = RequestMethod.GET)
	public ModelAndView InStock(HttpServletRequest request) throws Exception {		
		ModelAndView mv = new ModelAndView();	
		mv.addObject("sell", new Product());
		mv.addObject("user", new Product().getUser());
		mv.setViewName("addtostock");
		return mv;
	}
	
	@RequestMapping(value = "/sell/manage/in", method = RequestMethod.POST)
	public ModelAndView addToStore(@ModelAttribute("sell")  @Validated Product sell, BindingResult result) throws Exception {

        if(result.hasErrors()){

        	return new ModelAndView("addtostock", "sell", sell);
        }
		try {			
			
			User u = userDao.FindUser(sell.getVerifiedId());
			System.out.println(sell.getVerifiedId());
			sell.setUser(u);
			System.out.println(sell.getProductName()+"+"+sell.getVerifiedId());
			Product pro = proDao.FindPro(sell.getProductName());

			if(pro!=null) {
				return new ModelAndView("error", "errorMessage","This item existed" );		
			}
			else {
				System.out.println(" I AM FILE " + sell.getPhoto().getName());
				String locaLpath = "/Users/mahaksingh/Pictures";
				String photoNewName = generateFileName(sell.getPhoto());
				sell.getPhoto().transferTo(new File(locaLpath, photoNewName));
				sell.setPhotoFile(photoNewName);
				sell = proDao.AddToStore(sell);
			}
		   
		    return new ModelAndView("addtostock", "product",sell );
			
		} catch (ProductException e) {
			System.out.println(e.getMessage());
			return new ModelAndView("error", "errorMessage", "error while adding to store");
		}
	}

	
	private String generateFileName(MultipartFile multiPart) {
		return new Date().getTime() + "-" + multiPart.getOriginalFilename().replace(" ", "_");
	}
	
	public String uploadFile(MultipartFile multipartFile) throws Exception {
		String fileName = generateFileName(multipartFile);
		String uploadDir = "/Users/mahaksingh/Pictures";
		String filePath = uploadDir + fileName;
		try {
			File file = new File(filePath);
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(multipartFile.getBytes());
			fos.close();
		} catch (Exception e) {
			throw e;
		}
		return filePath;
	}
	
	
	

}
