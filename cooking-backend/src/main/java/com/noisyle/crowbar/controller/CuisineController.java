package com.noisyle.crowbar.controller;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.PropertyUtils;
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
import com.noisyle.crowbar.core.exception.GeneralException;
import com.noisyle.crowbar.core.vo.ResponseData;
import com.noisyle.crowbar.model.Cuisine;
import com.noisyle.crowbar.model.CuisineCat;
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

	@RequestMapping(value = "/saveCuisineCat", method = RequestMethod.POST)
	@ResponseBody
	public Object saveCuisineCat(CuisineCat cat) {
		if ("".equals(cat.getParentid())) {
			cat.setParentid(null);
		}
		cuisineService.saveCuisineCat(cat);
		return ResponseData.buildSuccessResponse(cat, "保存成功");
	}

	@RequestMapping(value = "/delCuisineCat", method = RequestMethod.POST)
	@ResponseBody
	public Object delCuisineCat(CuisineCat cat) {
		cuisineService.deleteCuisineCat(cat.getId());
		return ResponseData.buildSuccessResponse(cat.getId(), "删除成功");
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

	@RequestMapping(value = "/addCuisine", method = RequestMethod.GET)
	public String addCuisine(Model model) {
		return "admin/cuisine/add";
	}

	@RequestMapping(value = "/viewCuisine", method = RequestMethod.GET)
	public String viewCuisine(Model model, @RequestParam Long id) {
		model.addAttribute("cuisine", cuisineService.findCuisineById(id));
		return "admin/cuisine/view";
	}

	@RequestMapping(value = "/saveCuisine", method = RequestMethod.POST)
	@ResponseBody
	public Object saveCuisine(Cuisine cuisine, String categoryId) {
		if (cuisine.getId() == null) {
//			cuisine.setTime(new Date().getTime());
		}else{
			Cuisine cuisine_db = cuisineService.findCuisineById(cuisine.getId());
			try {
				PropertyUtils.copyProperties(cuisine_db, cuisine);
			} catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
				throw new GeneralException("保存失败", e);
			}
			cuisine = cuisine_db;
		}
		cuisineService.saveCuisine(cuisine);
		return ResponseData.buildSuccessResponse(cuisine, "保存成功");
	}

	@RequestMapping(value = "/delCuisine", method = RequestMethod.POST)
	@ResponseBody
	public Object delCuisine(Cuisine cuisine) {
		cuisineService.deleteCuisine(cuisine.getId());
		return ResponseData.buildSuccessResponse(cuisine.getId(), "删除成功");
	}
}
