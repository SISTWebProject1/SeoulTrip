package com.sist.category.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class FoodModel {

	@RequestMapping("category_food.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("category_food_jsp", "category/food/food.jsp");

		return "index.jsp";
	}

}
