package com.sist.main.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class CategoryModel {

	@RequestMapping("category_food.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("category_food_jsp", "category/food/food.jsp");

		return "index.jsp";
	}

}
