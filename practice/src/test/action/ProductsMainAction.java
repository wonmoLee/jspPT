package test.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.model.Products;
import test.repository.ProductsRepository;

public class ProductsMainAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductsRepository productsRepository = 
				ProductsRepository.getInstance();
		List<Products> products = productsRepository.findAll();
		System.out.println(products);
		
		request.setAttribute("products", products);
		
		RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
		dis.forward(request, response);
	}
}
