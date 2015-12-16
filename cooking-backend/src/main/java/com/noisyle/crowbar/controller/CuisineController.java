package com.noisyle.crowbar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noisyle.crowbar.core.base.BaseController;
import com.noisyle.crowbar.core.vo.ResponseData;
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
}
