package com.noisyle.crowbar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noisyle.crowbar.core.base.BaseController;
import com.noisyle.crowbar.core.datatables.PageParam;
import com.noisyle.crowbar.service.CuisineService;

@Controller
@RequestMapping("/admin")
public class CuisineController extends BaseController {
	@Autowired
	private CuisineService cuisineService;

	// 菜品分类管理
	@RequestMapping(value = "/cuisineCatList", method = RequestMethod.GET)
	public String cuisineCatList() {
		return "admin/cuisineCat/list";
	}

	@RequestMapping(value = "/cuisineCats", method = RequestMethod.GET)
	@ResponseBody
	public Object queryCuisineCatList(@RequestParam(required = false) String q) {
		return cuisineService.queryCuisineCatList(q);
	}
	
	@RequestMapping(value = "/cuisineCat", method = RequestMethod.GET)
	@ResponseBody
	public Object queryCuisineCatList(@RequestParam Long id) {
		return cuisineService.findCuisineCatById(id);
	}

	// 菜品信息管理
	@RequestMapping(value = "/cuisineList", method = RequestMethod.GET)
	public String cuisineList() {
		return "admin/cuisine/list";
	}

	@RequestMapping(value = "/cuisineList", method = RequestMethod.POST)
	@ResponseBody
	public Object queryCuisineList(@RequestBody PageParam pageParam) {
		return cuisineService.getPage(pageParam);
	}

	@RequestMapping(value = "/viewCuisine", method = RequestMethod.GET)
	public String viewCuisine(Model model, @RequestParam Long id) {
		model.addAttribute("cuisine", cuisineService.findCuisineById(id));
		return "admin/cuisine/view";
	}

}
