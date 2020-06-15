package test.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.action.Action;
import test.action.ProductsMainAction;
import test.action.ProductsMainCountAciton;
import test.action.ProductsMainPriceAction;


@WebServlet("/products")
public class ProductsController extends HttpServlet {
	private final static String TAG = "UsersController : ";
	private static final long serialVersionUID = 1L;
       
    public ProductsController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String cmd = request.getParameter("cmd");
			System.out.println(TAG + "doProcess : " + cmd);
			Action action = router(cmd);
			action.execute(request, response);
	}
	
	public Action router(String cmd) {
		if(cmd.equals("main")) {
			return new ProductsMainAction();
		} else if(cmd.equals("mainPrice")) {
			return new ProductsMainPriceAction();
		} else if(cmd.equals("mainCount")) {
			return new ProductsMainCountAciton();
		}
		return null;
	}

}
